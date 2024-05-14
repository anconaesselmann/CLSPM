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
    init?(_ body: Substring, id: XProjId) {
        let packageIdRegex = /package\s+=\s+(?<packageId>[0-9A-F]{24})/
        guard let packageIdResult = try? packageIdRegex.firstMatch(in: body[body.startIndex..<body.endIndex]) else {
            return nil
        }
        let productNameRegex = /productName\s+=\s+(?<productName>[^;]+);/
        guard let productNameResult = try? productNameRegex.firstMatch(in: body[body.startIndex..<body.endIndex]) else {
            return nil
        }
        self.init(
            id: id,
            package: XProjId(stringValue: packageIdResult.packageId),
            productName: String(productNameResult.productName)
        )
    }
}

extension Array where Element == GenericXProjElement {
    func mapToElements() -> [XProjElement] {
        map {
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
                return XCSwiftPackageProductDependency($0.content, id: $0.id) ?? $0
            case .other(_):
                return $0
            }
        }
    }
}
