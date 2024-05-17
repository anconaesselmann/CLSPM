//  Created by Axel Ancona Esselmann on 5/16/24.
//

import Foundation

struct ElementStringProperty {

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
