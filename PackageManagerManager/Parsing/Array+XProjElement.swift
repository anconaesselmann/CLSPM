//  Created by Axel Ancona Esselmann on 5/16/24.
//

import Foundation

extension Array where Element == GenericXProjElement {
    func mapToElements() -> [XProjElement] {
        map {
            do {
                switch $0.isa {
                case .PBXBuildFile:
                    if let element = try? PBXBuildFileFileRef($0.content, id: $0.id) {
                        return element
                    } else if let element = try? PBXBuildFileProductRef($0.content, id: $0.id) {
                        return element
                    } else {
                        return $0
                    }
                case .PBXFileReference:
                    return $0
                case .PBXFrameworksBuildPhase:
                    return try PBXFrameworksBuildPhase($0.content, id: $0.id)
                case .PBXGroup:
                    return $0
                case .PBXNativeTarget:
                    return $0
                case .PBXProject:
                    return try PBXProject($0.content, id: $0.id)
                case .PBXResourcesBuildPhase:
                    return $0
                case .XCBuildConfiguration:
                    return $0
                case .XCConfigurationList:
                    return $0
                case .XCRemoteSwiftPackageReference:
                    return try XCRemoteSwiftPackageReference($0.content, id: $0.id)
                case .XCSwiftPackageProductDependency:
                    return try XCSwiftPackageProductDependency($0.content, id: $0.id)
                case .other(_):
                    return $0
                }
            } catch {
                print(error)
                return $0
            }
        }
    }
}
