//  Created by Axel Ancona Esselmann on 6/20/24.
//

import Foundation

public extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()
        for element in self {
            try await values.append(transform(element))
        }
        return values
    }

    func asyncCompactMap<T>(
        _ transform: (Element) async throws -> T?
    ) async rethrows -> [T] {
        var values = [T]()
        for element in self {
            if let transformed = try await transform(element) {
                values.append(transformed)
            }
        }
        return values
    }
}
