//  Created by Axel Ancona Esselmann on 5/16/24.
//

import Foundation

enum RegexError: Swift.Error {
    case noMatch
}

protocol ElementProperty {
    var stringValue: String { get }
}

struct ElementURLProperty: ElementProperty {

    enum Error: Swift.Error {
        case notAValidUrl
    }

    let stringValue: String

    let url: URL

    init(_ body: Substring, key: String) throws {
        let regexString = "\(key)\\s+=\\s+\"(?<urlString>[^;]+)\";"
        let regex = try Regex<(Substring, urlString: Substring)>(regexString)
        guard let result = try regex.firstMatch(in: body[body.startIndex..<body.endIndex]) else {
            throw RegexError.noMatch
        }
        let stringValue = String(result.urlString)
        guard let url = URL(string: stringValue) else {
            throw Error.notAValidUrl
        }
        self.stringValue = stringValue
        self.url = url
    }
}

struct ElementIdProperty: ElementProperty {

    let stringValue: String

    var id: XProjId {
        .init(stringValue: stringValue)
    }

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
