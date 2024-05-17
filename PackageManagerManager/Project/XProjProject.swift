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
    }

    let content: String
    let sections: [XProjSection]
}

extension XProjProject {
    func remotePackageReferences(for targetName: String) throws -> [XCRemoteSwiftPackageReference] {
        guard let remotePackageSection = sections.first(where: { $0.isa == .XCRemoteSwiftPackageReference }) else {
            throw Error.missingSection(.XCRemoteSwiftPackageReference)
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
        guard let result = try Regex(regexString).firstMatch(in: content) else {
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
}
