//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation

struct Target {
    let id: UUID
    var dependencies: [JsonSpmDependency]

    init(id: UUID?, dependencies: [JsonSpmDependency]) {
        self.id = id ?? UUID()
        self.dependencies = dependencies
    }

    var localDependencies: [JsonSpmDependency] {
        dependencies.filter { $0.useLocal ?? false }
    }

    @discardableResult
    mutating func useLocal(for dependencyNames: Set<String>) -> Set<String> {
        var found: Set<String> = []
        dependencies = dependencies.map {
            guard dependencyNames.contains($0.name) else {
                return $0
            }
            found.insert($0.name)
            return $0.usingLocal()
        }
        return found
    }
}

extension Dictionary where Key == String, Value == Target {
    var names: [String] {
        keys.sorted()
    }
}
