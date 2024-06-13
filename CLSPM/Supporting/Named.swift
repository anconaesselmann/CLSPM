//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

protocol Named: Comparable {
    var name: String { get }
}

extension Named {
    static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.name < rhs.name
    }
}

extension Array where Element: Named {
    var byName: [String: Element] {
        reduce(into: [:]) {
            $0[$1.name] = $1
        }
    }
}
