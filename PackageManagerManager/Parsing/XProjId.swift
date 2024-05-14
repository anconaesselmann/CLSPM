//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation

struct XProjId: Identifiable, Hashable {
    let stringValue: String

    var id: String {
        stringValue
    }

    init(stringValue: any StringProtocol) {
        self.stringValue = String(stringValue)
    }

    init?(_ body: Substring, currentIndex: inout String.Index) {
        let idRegex = /(?<id>[0-9A-F]{24})\s+/
        guard let result = try? idRegex.firstMatch(in: body[currentIndex..<body.endIndex]) else {
            return nil
        }
        stringValue = String(result.id)
        currentIndex = result.range.upperBound
    }
}
