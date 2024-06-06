//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation

extension Init {
    func setup_testing() -> Self {
        var copy = self
        copy.spmfile = nil
        copy.cached = []
        copy.target = nil
        copy.verbose = false
        copy.force = false
        copy.noTestTargets = false
        copy.globalDependencies = false
        copy.microSpmfile = false
        return copy
    }
}
