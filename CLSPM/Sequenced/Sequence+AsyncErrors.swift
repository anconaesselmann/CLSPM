//  Created by Axel Ancona Esselmann on 6/20/24.
//

import Foundation

public extension Sequence {
    func asyncMap<T>(
        errors: inout [Swift.Error],
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        await asyncCompactMap { (element: Element) -> T? in
            do {
                return try await transform(element)
            } catch {
                errors.append(error)
                return nil
            }
        }
    }

    func asyncCompactMap<T>(
        errors: inout [Swift.Error],
        _ transform: (Element) async throws -> T?
    ) async rethrows -> [T] {
        await asyncCompactMap { (element: Element) -> T? in
            do {
                if let transformed = try await transform(element) {
                    return transformed
                } else {
                    return nil
                }
            } catch {
                errors.append(error)
                return nil
            }
        }
    }
}
