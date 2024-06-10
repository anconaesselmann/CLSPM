//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation

extension Init {
    func setup_testing() -> Self {
        var copy = self
        copy.spmfile = nil
        copy.dependency = []
        copy.target = nil
        copy.verbose = false
        copy.force = false
        copy.testTargets = false
        copy.globalDependencies = false
        copy.csv = false
        return copy
    }
}
