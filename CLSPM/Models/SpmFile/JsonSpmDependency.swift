//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

struct JsonSpmDependency: Codable, Named {
    var id: UUID?
    let name: String
    var url: String?
    var version: String?
    var localPath: String?
    var useLocal: Bool?
}

extension JsonSpmDependency {
    func usingLocal() -> Self {
        var copy = self
        copy.useLocal = true
        return copy
    }

    func withUpdatedId(_ id: UUID?) -> Self {
        guard let id = id else {
            return self
        }
        var copy = self
        copy.id = id
        return copy
    }
}
