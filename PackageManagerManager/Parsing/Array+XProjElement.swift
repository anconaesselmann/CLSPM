//  Created by Axel Ancona Esselmann on 5/16/24.
//

import Foundation
import ParenthesesParser

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
                    return try PBXNativeTarget($0.content, id: $0.id)
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

    func expand() throws -> [ExpandedXProjElement] {
        try map { element in
            guard let elementRange = (try? ParenthesesParser().nextFrame(
                element.content,
                from: element.content.startIndex,
                types: [.braces]
            ))?.range else {
                throw XProjProject.Error.unknown
            }

            var elementContent = element.content[elementRange]
            elementContent.removeFirst()
            elementContent.removeLast()

            let explodedElement = ExpandedXProjElement(
                isa: element.isa,
                properties: try Self.toXProjProperties(elementContent),
                id: element.id
            )
            return explodedElement
        }
    }

    private static func toXProjProperties(_ elementContent: Substring) throws -> [XProjProperty] {
        var elementContent = elementContent
        var currentIndex = elementContent.startIndex
        var endIndex = elementContent.endIndex

        var objectContents: [UUID: [XProjProperty]] = [:]
        var arrayContents: [UUID: [Any]] = [:]

        while let objectRange = (try? ParenthesesParser().nextFrame(
            elementContent,
            from: currentIndex,
            types: [.braces]
        ))?.range {
            var objectContent = elementContent[objectRange]
                .trimmingCharacters(in: .whitespacesAndNewlines)
            objectContent.removeFirst()
            objectContent.removeLast()
            let objectProperties = try Self.toXProjProperties(objectContent[objectContent.startIndex..<objectContent.endIndex])
            let id = UUID()
            objectContents[id] = objectProperties
            elementContent.removeSubrange(objectRange)
            elementContent.insert(contentsOf: id.uuidString, at: objectRange.lowerBound)
        }

        currentIndex = elementContent.startIndex
        while let arrayRange = (try? ParenthesesParser().nextFrame(
            elementContent,
            from: currentIndex,
            types: [.parentheses]
        ))?.range {
            var arrayContent = elementContent[arrayRange]
                .trimmingCharacters(in: .whitespacesAndNewlines)
            arrayContent.removeFirst()
            arrayContent.removeLast()
            let id = UUID()
            arrayContents[id] = arrayContent.split(separator: ",")
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines)}
                .filter { !$0.isEmpty }
                .compactMap { (XProjId($0) ?? $0) }
            elementContent.removeSubrange(arrayRange)
            elementContent.insert(contentsOf: id.uuidString, at: arrayRange.lowerBound)
        }

        currentIndex = elementContent.startIndex
        endIndex = elementContent.endIndex

            let regexString =
                "(?<whiteSpace>[\\t ]+)" +
                "(?<key>[^ \\{\\}; \t\n]+)" +
                "\\s=\\s" +
                "(?<value>[^;\\{]+)" +
                ";"
        let regex: Regex<(Substring, whiteSpace: Substring, key: Substring, value: Substring)> = try Regex(regexString)
        var properties: [XProjProperty] = []
        while let result = try regex.firstMatch(in: elementContent[currentIndex..<endIndex]) {
            let value: Any
            let stringValue = String(result.value)
            if let id = UUID(uuidString: stringValue) {
                if let objectValue = objectContents[id] {
                    value = objectValue
                } else if let arrayValue = arrayContents[id] {
                    value = arrayValue
                } else {
                    value = id
                }
            } else if let id = XProjId(stringValue) {
                value = id
            } else {
                value = stringValue
            }
            let property = XProjProperty(
                indentation: String(result.whiteSpace),
                key: String(result.key),
                value: value
            )
            properties.append(property)
            currentIndex = result.range.upperBound
        }
        return properties
    }
}
