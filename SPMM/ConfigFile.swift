//  Created by Axel Ancona Esselmann on 6/4/24.
//

import Foundation

struct ConfigFile: Codable {
    var localRoot: String?

    func combined(with other: Self) -> Self {
        var combined = ConfigFile()
        combined.localRoot = self.localRoot ?? other.localRoot
        return combined
    }
}
