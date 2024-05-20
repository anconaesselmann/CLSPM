//  Created by Axel Ancona Esselmann on 5/17/24.
//

import Foundation
import XProjParser

extension XProjId {
    init?(_ body: Substring, currentIndex: inout String.Index) {
        let idRegex = /(?<id>[0-9A-F]{24})\s+(\/\*\s*(?<comment>[^\*]+)\s*\*\/)?/
        guard let result = try? idRegex.firstMatch(in: body[currentIndex..<body.endIndex]) else {
            return nil
        }
        let comment: String?
        if let commentSubstring = result.comment {
            comment = String(commentSubstring)
        } else {
            comment = nil
        }
        currentIndex = result.range.upperBound
        self.init(stringValue: String(result.id), comment: comment)
    }
}
