//  Created by Axel Ancona Esselmann on 6/7/24.
//

import Foundation

extension Config {
    func setup_testing() -> Self {
        var copy = self
        copy.localRoot = nil
        copy.setCreateGithubRepo = nil
        copy.verbose = false
        copy.global = false
        copy.listOutputFile = nil
        return copy
    }
}
