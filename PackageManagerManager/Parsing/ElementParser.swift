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

}

extension XCSwiftPackageProductDependency {
    init(_ body: Substring, id: XProjId) throws {
        let packageId = try ElementIdProperty(body, key: "package")
        let productName = try ElementStringProperty(body, key: "productName")
        self.init(
            id: id,
            package: XProjId(stringValue: packageId.stringValue),
            productName: productName.stringValue
        )
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
                    return $0
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
