//  Created by Axel Ancona Esselmann on 5/16/24.
//

import Foundation

struct ElementURLProperty {

    enum Error: Swift.Error {
        case notAValidUrl
    }

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
        self.url = url
    }
}
