//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation

struct JsonSpmFile: Codable {
    var targets: [JsonSpmTarget]
    var dependencies: [JsonSpmDependency]?
}

extension JsonSpmFile {
    var microCompatible: Bool {
        let namesOfTargetsWithDependencies = Set(
            targets
                .filter { !$0.dependencies.isEmpty}
                .map { $0.name }
        )
        guard namesOfTargetsWithDependencies.count <= 1 else {
            return false
        }
        if let target = namesOfTargetsWithDependencies.first {
            return !target.hasSuffix("Tests")
        } else {
            return true
        }
    }
}
