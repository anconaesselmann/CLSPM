//  Created by Axel Ancona Esselmann on 5/9/24.
//

import Foundation

protocol XProjElement {
    var isa: XProjIsa { get }
    var id: XProjId { get }
}

struct GenericXProjElement: XProjElement {
    let isa: XProjIsa
    let content: Substring
    let id: XProjId

    init(content: Substring, id: XProjId) throws {
        self.content = content
        isa = try XProjIsa(elementBody: content)
        self.id = id
    }
}

struct PBXBuildFile: XProjElement {
    var isa: XProjIsa { .PBXBuildFile }
    let id: XProjId
}

struct PBXFileReference: XProjElement {
    var isa: XProjIsa { .PBXFileReference }
    let id: XProjId
}

struct PBXFrameworksBuildPhase: XProjElement {
    var isa: XProjIsa { .PBXFrameworksBuildPhase }
    let id: XProjId
}

struct PBXGroup: XProjElement {
    var isa: XProjIsa { .PBXGroup }
    let id: XProjId
}

struct PBXNativeTarget: XProjElement {
    var isa: XProjIsa { .PBXNativeTarget }
    let id: XProjId
}

struct PBXProject: XProjElement {
    var isa: XProjIsa { .PBXProject }
    let id: XProjId
}

struct PBXResourcesBuildPhase: XProjElement {
    var isa: XProjIsa { .PBXResourcesBuildPhase }
    let id: XProjId
}

struct XCBuildConfiguration: XProjElement {
    var isa: XProjIsa { .XCBuildConfiguration }
    let id: XProjId
}

struct XCConfigurationList: XProjElement {
    var isa: XProjIsa { .XCConfigurationList }
    let id: XProjId
}

struct XCRemoteSwiftPackageRequirement {
    let kind: String
    let minimumVersion: String
}

struct XCRemoteSwiftPackageReference: XProjElement {
    var isa: XProjIsa { .XCRemoteSwiftPackageReference }
    let id: XProjId
    let repositoryURL: URL
    let requirement: XCRemoteSwiftPackageRequirement
}

struct XCSwiftPackageProductDependency: XProjElement {
    var isa: XProjIsa { .XCSwiftPackageProductDependency }
    let id: XProjId
    let package: XProjId
    let productName: String
}
