//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

extension Bool {
    init(extendedMeaningString: String) {
        switch extendedMeaningString.lowercased().trimmingCharacters(in: .whitespaces) {
        case "y", "yes", "affirmative", "amen", "fine", "good", "okay", "true", "yea", "aye",
            "all right", "beyond a doubt", "by all means", "certainly", "definitely", "even so", "exactly", "gladly", "good enough", "granted", "indubitably", "just so", "most assuredly", "naturally", "of course", "positively", "precisely", "sure thing", "surely", "undoubtedly", "unquestionably", "very well", "willingly", "without fail", "yep", "ja":
            self = true
        default:
            self = false
        }
    }
}
