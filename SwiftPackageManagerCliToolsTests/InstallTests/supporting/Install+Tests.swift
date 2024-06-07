//  Created by Axel Ancona Esselmann on 6/7/24.
//

import Foundation

extension Install {
    func setup_testing() -> Self {
        var copy = self
        copy.spmfile = nil
        copy.local = []
        copy.verbose = false
        copy.cloneToSpmmDir = false
        copy.packageCacheDir = nil
        return copy
    }
}
