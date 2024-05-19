//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation

struct XProjId: Identifiable, Hashable {
    let stringValue: String
    var comment: String?

    var id: String {
        stringValue
    }

    init(stringValue: any StringProtocol) {
        self.stringValue = String(stringValue)
    }

    init() {
        var uuidString = UUID().uuidString
        uuidString.removeAll { $0 == "-" }
        let range = uuidString.startIndex..<uuidString.index(uuidString.startIndex, offsetBy: 24)
        stringValue = String(uuidString[range])
    }
}
