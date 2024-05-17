//  Created by Axel Ancona Esselmann on 5/16/24.
//

import Foundation

enum RegexError: Swift.Error {
    case noMatch
}

protocol ElementProperty {
    var stringValue: String { get }
}

struct ElementIdProperty: ElementProperty {

    let stringValue: String

    init(_ body: Substring, key: String) throws {
        let regexString = "\(key)\\s+=\\s+(?<id>[0-9A-F]{24})"
        let regex = try Regex<(Substring, id: Substring)>(regexString)
        guard let result = try regex.firstMatch(in: body[body.startIndex..<body.endIndex]) else {
            throw RegexError.noMatch
        }
        let id = result.id
        self.stringValue = String(id)
    }
}

struct ElementStringProperty: ElementProperty {

    let stringValue: String

    init(_ body: Substring, key: String) throws {
        let regexString = "\(key)\\s+=\\s+(?<stringValue>[^;]+);"
        let regex = try Regex<(Substring, stringValue: Substring)>(regexString)
        guard let result = try regex.firstMatch(in: body[body.startIndex..<body.endIndex]) else {
            throw RegexError.noMatch
        }
        self.stringValue = String(result.stringValue)
    }
}
