//  Created by Axel Ancona Esselmann on 5/20/24.
//

import Foundation

public enum XProjIsa: Identifiable, Equatable {

    case PBXBuildFile, PBXFileReference, PBXFrameworksBuildPhase, PBXGroup, PBXNativeTarget, PBXProject, PBXResourcesBuildPhase, XCBuildConfiguration, XCConfigurationList, XCRemoteSwiftPackageReference, XCSwiftPackageProductDependency
    case other(String)

    public var id: String {
        rawValue
    }

    public var rawValue: String {
        switch self {
        case .PBXBuildFile:
            return "PBXBuildFile"
        case .PBXFileReference:
            return "PBXFileReference"
        case .PBXFrameworksBuildPhase:
            return "PBXFrameworksBuildPhase"
        case .PBXGroup:
            return "PBXGroup"
        case .PBXNativeTarget:
            return "PBXNativeTarget"
        case .PBXProject:
            return "PBXProject"
        case .PBXResourcesBuildPhase:
            return "PBXResourcesBuildPhase"
        case .XCBuildConfiguration:
            return "XCBuildConfiguration"
        case .XCConfigurationList:
            return "XCConfigurationList"
        case .XCRemoteSwiftPackageReference:
            return "XCRemoteSwiftPackageReference"
        case .XCSwiftPackageProductDependency:
            return "XCSwiftPackageProductDependency"
        case .other(let rawValue):
            return rawValue
        }
    }

    public init(rawValue: String) {
        switch rawValue {
        case "PBXBuildFile":
            self = .PBXBuildFile
        case "PBXFileReference":
            self = .PBXFileReference
        case "PBXFrameworksBuildPhase":
            self = .PBXFrameworksBuildPhase
        case "PBXGroup":
            self = .PBXGroup
        case "PBXNativeTarget":
            self = .PBXNativeTarget
        case "PBXProject":
            self = .PBXProject
        case "PBXResourcesBuildPhase":
            self = .PBXResourcesBuildPhase
        case "XCBuildConfiguration":
            self = .XCBuildConfiguration
        case "XCConfigurationList":
            self = .XCConfigurationList
        case "XCRemoteSwiftPackageReference":
            self = .XCRemoteSwiftPackageReference
        case "XCSwiftPackageProductDependency":
            self = .XCSwiftPackageProductDependency
        default:
            self = .other(rawValue)
        }
    }
}
