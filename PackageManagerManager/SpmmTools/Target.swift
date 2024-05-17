//  Created by Axel Ancona Esselmann on 5/17/24.
//

import Foundation

struct Target {

    let name: String
    let dependencies: [Dependency]

    init(name: String, dependencies: [Dependency]) {
        self.name = name
        self.dependencies = dependencies
    }
}
