//  Created by Axel Ancona Esselmann on 5/16/24.
//

import Foundation
import XProjParser

struct ElementIdProperty {

    let id: XProjId

    init(_ body: Substring, key: String) throws {
        let regexString = "\(key)\\s+=\\s+(?<id>[0-9A-F]{24})"
        let regex = try Regex<(Substring, id: Substring)>(regexString)
        guard let result = try regex.firstMatch(in: body[body.startIndex..<body.endIndex]) else {
            throw RegexError.noMatch
        }
        let stringValue = String(result.id)
        self.id = .init(stringValue: stringValue)
    }
}
