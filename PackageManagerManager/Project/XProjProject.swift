//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation
import ParenthesesParser

struct XProjProject {
    enum Error: Swift.Error {
        case noProjectHeader
        case missingSection(XProjIsa)
        case missingElement
        case missingProperty
        case missingRemoteUrl
        case missingVersion
        case unknown
    }

    let content: String
    let sections: [XProjSection]
}

extension XProjProject {
    func remotePackageReferences(for targetName: String) throws -> [XCRemoteSwiftPackageReference] {
        guard let remotePackageSection = sections.first(where: { $0.isa == .XCRemoteSwiftPackageReference }) else {
            return []
        }
        let remotePackageSectionElements = remotePackageSection.elements
        return remotePackageSectionElements
            .compactMap { $0 as? XCRemoteSwiftPackageReference }
    }

    func packageDependency(for packageReferenceId: XProjId) throws -> XCSwiftPackageProductDependency {
        guard let dependencySection =  sections.first(where: { $0.isa == .XCSwiftPackageProductDependency }) else {
            throw Error.missingSection(.XCSwiftPackageProductDependency)
        }
        let dependencySectionElements = dependencySection.elements
        guard let dependency = dependencySectionElements
            .compactMap({ $0 as? XCSwiftPackageProductDependency })
            .first(where: { $0.package == packageReferenceId })
        else {
            throw Error.missingElement
        }
        return dependency
    }

    func addedDepenency(_ dependency: Dependency, to targetName: String) throws -> Self {
        let remotePackageId = XProjId()
        guard let repositoryUrl = dependency.remoteUrl?.absoluteString else {
            throw Error.missingRemoteUrl
        }
        guard let version = dependency.version else {
            throw Error.missingVersion
        }
        let remotePackageReferenceBody = """

        \(remotePackageId.stringValue) /* XCRemoteSwiftPackageReference "\(dependency.name)" */ = {
            isa = XCRemoteSwiftPackageReference;
            repositoryURL = "\(repositoryUrl)";
            requirement = {
                kind = \(version.kind.rawValue);
                minimumVersion = \(version.versionString);
            };
        };
"""
        var contentCopy = content

        let endOfRemotePackageSectionBodyIndex: String.Index
        do {
            endOfRemotePackageSectionBodyIndex = try endOfSectionIndex(
                for: .XCRemoteSwiftPackageReference,
                in: contentCopy
            )
        } catch Error.missingSection(let sectionIsa) {
            endOfRemotePackageSectionBodyIndex = try createSection(
                .XCRemoteSwiftPackageReference,
                in: &contentCopy
            )
        }
        contentCopy.insert(contentsOf: remotePackageReferenceBody, at: endOfRemotePackageSectionBodyIndex)

        // TODO: One for each target but same packageId
        let dependencyId = XProjId()

        // NOTE: Different for local!!!
        let dependencyBody = """

        \(dependencyId.stringValue) /* \(dependency.name) */ = {
            isa = XCSwiftPackageProductDependency;
            package = \(remotePackageId.stringValue) /* XCRemoteSwiftPackageReference "\(dependency.name)" */;
            productName = \(dependency.name);
        };
"""

        let endOfDependencySectionBodyIndex: String.Index
        do {
            endOfDependencySectionBodyIndex = try endOfSectionIndex(
                for: .XCSwiftPackageProductDependency,
                in: contentCopy
            )
        } catch Error.missingSection(let sectionIsa) {
            endOfDependencySectionBodyIndex = try createSection(
                .XCSwiftPackageProductDependency,
                in: &contentCopy
            )
        }
        contentCopy.insert(contentsOf: dependencyBody, at: endOfDependencySectionBodyIndex)

        contentCopy = try insertIdAtEndOfArray(
            remotePackageId,
            comment: "XCRemoteSwiftPackageReference \"\(dependency.name)\"",
            withPropertyName: "packageReferences",
            for: .PBXProject, 
            in: contentCopy
        )

        // TODO: Make sure we have the right target
        contentCopy = try insertIdAtEndOfArray(
            dependencyId,
            comment: dependency.name,
            withPropertyName: "packageProductDependencies",
            for: .PBXNativeTarget, in: contentCopy
        )

        let buildFileId = XProjId()
        // TODO: Make sure I am adding to the right framework
        contentCopy = try insertIdAtEndOfArray(
            buildFileId,
            comment: "\(dependency.name) in Frameworks",
            withPropertyName: "files",
            for: .PBXFrameworksBuildPhase, 
            in: contentCopy
        )

        let buildFileBody = """

        \(buildFileId.stringValue) /* \(dependency.name) in Frameworks */ = {isa = PBXBuildFile; productRef = \(dependencyId.stringValue) /* \(dependency.name) */; };
"""
        let endOfBuildFileSectionBodyIndex = try endOfSectionIndex(for: .PBXBuildFile, in: contentCopy)
        contentCopy.insert(contentsOf: buildFileBody, at: endOfBuildFileSectionBodyIndex)
        let project = try XProjProject(content: contentCopy.replacing("    ", with: "\t"))
        print(project.content)
        return project
    }

    func remotePackageRemoved(_ name: String) throws -> Self {
        var content = content
        guard let dependencySection =  sections.first(where: { $0.isa == .XCSwiftPackageProductDependency }) else {
            throw Error.missingSection(.XCSwiftPackageProductDependency)
        }
        let dependencySectionElements = dependencySection.elements
        let dependencies = dependencySectionElements
            .compactMap { $0 as? XCSwiftPackageProductDependency }
            .filter { $0.productName == name }

        try dependencies.forEach {
            content = try removeElement(element: $0, from: content)
        }

        let dependencyIds = Set(dependencies.map { $0.id })

        let packageIds = Set(dependencies.map { $0.package })

        guard let remotePackageSection = sections.first(where: { $0.isa == .XCRemoteSwiftPackageReference }) else {
            throw Error.missingSection(.XCRemoteSwiftPackageReference)
        }
        let remotePackageSectionElements = remotePackageSection.elements
        let remotePackages = remotePackageSectionElements
            .compactMap { $0 as? XCRemoteSwiftPackageReference }
            .filter { packageIds.contains($0.id) }

//        let remotePackages = remotePackageReferences(for: <#T##String#>)

        let remotePackageIds = remotePackages.map { $0.id }

        try remotePackages.forEach {
            content = try removeElement(element: $0, from: content)
        }

        guard let buildFileSection = sections.first(where: { $0.isa == .PBXBuildFile }) else {
            throw Error.missingSection(.PBXBuildFile)
        }
        let buildFileSectionElements = buildFileSection.elements
        let buildFiles = buildFileSectionElements
            .compactMap { $0 as? PBXBuildFileProductRef}
            .filter { dependencyIds.contains($0.productRef) }

        let buildFilesIds = buildFiles.map { $0.id }

        try buildFiles.forEach {
            content = try removeElement(element: $0, from: content)
        }

        guard let frameworksBuildPhaseSection = sections.first(where: { $0.isa == .PBXFrameworksBuildPhase }) else {
            throw Error.missingSection(.PBXFrameworksBuildPhase)
        }
        let frameworksBuildPhaseSectionElements = frameworksBuildPhaseSection.elements
        let frameworksBuildPhaseElements = frameworksBuildPhaseSectionElements
            .compactMap { $0 as? PBXFrameworksBuildPhase}

        try frameworksBuildPhaseElements.forEach { buildPhase in
            try buildFilesIds.forEach { fileReference in
                content = try removeId(fileReference, from: "files", on: buildPhase, from: content)
            }
        }

        let targetSections = sections.filter( { $0.isa == .PBXNativeTarget })
        guard !targetSections.isEmpty else {
            throw Error.missingSection(.PBXProject)
        }
        try targetSections.forEach { targetSections in
            let targetSectionsElements = targetSections.elements
            let targetElements = targetSectionsElements
                .compactMap { $0 as? PBXNativeTarget}

            try targetElements.forEach { target in
                try dependencyIds.forEach { fileReference in
                    content = try removeId(fileReference, from: "packageProductDependencies", on: target, from: content)
                }
            }
        }

        guard let projectSection = sections.first(where: { $0.isa == .PBXProject }) else {
            throw Error.missingSection(.PBXProject)
        }
        guard let projectElement = projectSection.elements.first as? PBXProject else {
            throw Error.missingElement
        }
        try remotePackageIds.forEach { remotePackageId in
            content = try removeId(remotePackageId, from: "packageReferences", on: projectElement, from: content)
        }
        return try XProjProject(content: content)
    }

    private func removeId(_ id: XProjId, from arrayKey: String, on element: XProjElement, from content: String) throws -> String {
        let elementRange = try range(for: element, in: content)
        let propertyRange = try range(
            forPropertyWithKey: arrayKey,
            in: content,
            in: elementRange
        )
        let regexString = "\\s+\(id.stringValue)[^,]+,"
        guard let result = try Regex(regexString).firstMatch(in: content[propertyRange]) else {
            throw Error.missingSection(element.isa)
        }
        let content = content.replacingCharacters(in: result.range, with: "")
        return content
    }

    private func range(for element: XProjElement, in content: String) throws -> Range<String.Index> {
        let regexString = "\\s+\(element.id.stringValue)[^{]+{[^}]*isa\\s+=\\s+\(element.isa.rawValue)"
        guard let result = try Regex(regexString).firstMatch(in: content) else {
            throw Error.missingSection(element.isa)
        }
        let startIndex = result.range.lowerBound
        guard let elementContent = try? ParenthesesParser().nextFrame(content, from: startIndex, types: [.braces]) else {
            throw Error.missingSection(element.isa)
        }
        let endIndex = content.index(after: elementContent.end)
        return startIndex..<endIndex
    }

    private func range(
        forPropertyWithKey propertyKey: String,
        in content: String,
        in range: Range<String.Index>
    ) throws -> Range<String.Index> {
        var elementContent = content[range]
        let regexString = "\(propertyKey)\\s+=\\s+\\([^\\)]*\\);"
        guard let result = try Regex(regexString).firstMatch(in: elementContent) else {
            throw Error.missingProperty
        }
        return result.range
    }

    private func removeElement(element: XProjElement, from content: String) throws -> String {
        let elementRange = try range(for: element, in: content)
        return content.replacingCharacters(in: elementRange, with: "")
    }

    private func sectionRanges(for isa: XProjIsa, in content: String) throws -> [Range<String.Index>] {
        var sectionRanges: [Range<String.Index>] = []
        var currentIndex: String.Index = content.startIndex

        var sectionRange: Range<String.Index> = content.startIndex..<content.endIndex

        while let section = try XProjSection(content: content, currentIndex: &currentIndex, range: &sectionRange) {
            if section.isa == isa {
                sectionRanges.append(sectionRange)
            }
        }
        return sectionRanges
    }

    private func insertIdAtEndOfArray(_ id: XProjId, comment: String, withPropertyName key: String, for sectionIsa: XProjIsa, in content: String) throws -> String {
        guard let sectionRange = try sectionRanges(for: sectionIsa, in: content).first else {
            throw Error.missingSection(sectionIsa)
        }
        let regexString = "(?<whiteSpace>[\t| ]+)\(key)\\s+=\\s+\\([^\\)]+"
        let regex: Regex<(Substring, whiteSpace: Substring)> = try Regex(regexString)
        guard let result = try regex.firstMatch(in: content[sectionRange]) else {
            throw Error.missingSection(sectionIsa)
        }
        let index = result.range.upperBound

        let arrayElementContent = """
    \(id.stringValue) /* \(comment) */,
\(result.whiteSpace)
"""
        var contentCopy = content
        contentCopy.insert(
            contentsOf: arrayElementContent,
            at: index)
        return contentCopy
    }

    private func endOfSectionIndex(for sectionIsa: XProjIsa, in content: String) throws -> String.Index {
        guard let sectionRange = try sectionRanges(for: sectionIsa, in: content).first else {
            throw Error.missingSection(sectionIsa)
        }
        let regexString = "\\/\\* End \(sectionIsa) section \\*\\/"
        let regex = try Regex(regexString)
        guard let result = try regex.firstMatch(in: content[sectionRange]) else {
            throw Error.missingSection(sectionIsa)
        }
        return content.index(before: result.range.lowerBound)
    }

    private func createSection(
        _ sectionIsa: XProjIsa,
        after previousSectionIsa: XProjIsa? = nil,
        in content: inout String
    ) throws -> String.Index {
        var currentIndex: String.Index = content.startIndex

        var sectionRange: Range<String.Index> = content.startIndex..<content.endIndex

        while let section = try XProjSection(content: content, currentIndex: &currentIndex, range: &sectionRange) {
            if
                let previousSectionIsa = previousSectionIsa,
                section.isa == previousSectionIsa
            {
                break
            }
        }

        let emptySectionHeader = """


/* Begin \(sectionIsa.rawValue) section */
"""
        let emptySectionFooter = """

/* End \(sectionIsa.rawValue) section */
"""
        content.insert(
            contentsOf: emptySectionHeader + emptySectionFooter,
            at: sectionRange.upperBound
        )
        return content.index(sectionRange.upperBound, offsetBy: emptySectionHeader.count)
    }

    func listAllProperties() throws {
        let range = content.startIndex..<content.endIndex
        let t = try XProjParser.parse(content: content[range], range: range)
        print(t)
        var all: [ExpandedXProjElement] = []
        for section in self.sections {
            let properties = try properties(for: section.isa, in: content)
//            print(properties)
            all += properties
        }
        print(all)
    }

    private func properties(
        for sectionIsa: XProjIsa,
        in content: String
    ) throws -> [ExpandedXProjElement] {
        guard let sectionRange = try sectionRanges(
            for: sectionIsa,
            in: content
        ).first else {
            throw Error.missingSection(sectionIsa)
        }
        let sectionBody = content[sectionRange]
        let elements = ElementParser
            .parse(sectionBody, currentIndex: sectionBody.startIndex)

        return try elements.expand()
    }
}
