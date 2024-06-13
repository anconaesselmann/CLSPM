//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

extension String {
    func indented(_ count: Int = 1) -> Self {
        count > 0
            ? (0..<count).map { _ in "\t" } + self
            : self
    }
}
