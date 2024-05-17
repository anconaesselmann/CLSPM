//  Created by Axel Ancona Esselmann on 5/16/24.
//

import Foundation

extension PBXBuildFileFileRef {
    init(_ body: Substring, id: XProjId) throws {
        self.id = id
        self.fileRef = try ElementIdProperty(body, key: "fileRef").id
    }
}

extension PBXBuildFileProductRef {
    init(_ body: Substring, id: XProjId) throws {
        self.id = id
        self.productRef = try ElementIdProperty(body, key: "productRef").id
    }
}

extension PBXFrameworksBuildPhase {
    init(_ body: Substring, id: XProjId) throws {
        self.id = id
        self.files = try ElementIdArrayProperty(body, key: "files").ids
    }
}

extension PBXProject {
    init(_ body: Substring, id: XProjId) throws {
        self.id = id
        self.packageReferences = try ElementIdArrayProperty(body, key: "packageReferences").ids
        self.targets = try ElementIdArrayProperty(body, key: "targets").ids
    }
}

extension XCRemoteSwiftPackageReference {
    init(_ body: Substring, id: XProjId) throws {
        self.id = id
        self.repositoryURL = try ElementURLProperty(body, key: "repositoryURL").url
        self.requirement = .init(
            kind: try ElementStringProperty(body, key: "kind").stringValue,
            minimumVersion: try ElementStringProperty(body, key: "minimumVersion").stringValue
        )
    }
}

extension XCSwiftPackageProductDependency {
    init(_ body: Substring, id: XProjId) throws {
        self.id = id
        self.package = try ElementIdProperty(body, key: "package").id
        self.productName = try ElementStringProperty(body, key: "productName").stringValue
    }
}
