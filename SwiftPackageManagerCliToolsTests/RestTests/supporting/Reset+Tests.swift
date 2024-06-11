//  Created by Axel Ancona Esselmann on 6/11/24.
//

import Foundation

extension Reset {
    func setup_testing() -> Self {
        var copy = self
        copy.verbose = false
        copy.global = false
        copy.local = false
        copy.config = false
        copy.dependencies = false
        copy.spmfile = false
        copy.all = false
        return copy
    }
}
