//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation
import ParenthesesParser
import XProjParser

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
            .first(where: { $0.package.id == packageReferenceId.id })
        else {
            throw Error.missingElement
        }
        return dependency
    }
}
