//  Created by Axel Ancona Esselmann on 5/16/24.
//

import Foundation
import XProjParser

struct ElementIdArrayProperty {

    let ids: [XProjId]

    init(_ body: Substring, key: String) throws {
        let regexString = "\(key)\\s+=\\s+\\((?<ids>[^)]+)\\);"
        let regex = try Regex<(Substring, ids: Substring)>(regexString)
        guard let result = try regex.firstMatch(in: body[body.startIndex..<body.endIndex]) else {
            throw RegexError.noMatch
        }
        let idsBody = result.ids
        var index = idsBody.startIndex
        var ids: [XProjId] = []
        while let id = XProjId(idsBody, currentIndex: &index) {
            ids.append(id)
        }
        self.ids = ids
    }
}
