//  Created by Axel Ancona Esselmann on 6/11/24.
//

import Foundation

extension List {
    func setup_testing() -> Self {
        var copy = self
        copy.testTargets = false
        copy.target = []
        copy.verbose = false
        copy.console = false
        copy.ignore = []
        copy.persistIgnore = false
        return copy
    }
}
