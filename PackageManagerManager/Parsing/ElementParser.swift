//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation
import ParenthesesParser

struct ElementParser {
    static func parse(_ body: Substring, currentIndex: String.Index) -> [GenericXProjElement] {
        var elements: [GenericXProjElement] = []
        var elementsIndex = body.startIndex

        while elementsIndex < body.endIndex {
            guard let id = XProjId(body, currentIndex: &elementsIndex) else {
                elementsIndex = body.endIndex
                break
            }
            guard let elementContent = try? ParenthesesParser().nextFrame(body, from: elementsIndex, types: [.braces]) else {
                elementsIndex = body.endIndex
                break
            }
            let body = body[elementContent.start..<elementContent.end]
            guard let element = try? GenericXProjElement(content: body, id: id) else {
                assertionFailure()
                continue
            }
            elements.append(element)
            elementsIndex = elementContent.end
        }
        return elements
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

extension Array where Element == GenericXProjElement {
    func mapToElements() -> [XProjElement] {
        map {
            do {
                switch $0.isa {
                case .PBXBuildFile:
                    return $0
                case .PBXFileReference:
                    return $0
                case .PBXFrameworksBuildPhase:
                    return $0
                case .PBXGroup:
                    return $0
                case .PBXNativeTarget:
                    return $0
                case .PBXProject:
                    return $0
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
