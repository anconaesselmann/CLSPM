//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

struct JsonSpmDependency: Codable {
    let id: UUID?
    let name: String
    let url: String?
    let version: String?
    let localPath: String?
    var useLocal: Bool?
}

extension JsonSpmDependency {
    func usingLocal() -> Self {
        var copy = self
        copy.useLocal = true
        return copy
    }
}
