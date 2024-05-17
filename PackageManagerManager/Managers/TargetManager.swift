//  Created by Axel Ancona Esselmann on 5/17/24.
//

import Foundation

class TargetManager {

    private(set) var targets: [Target] = []

    init() { }

    func set(targets: [Target]) {
        self.targets = targets
    }
}
