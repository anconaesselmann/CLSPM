//  Created by Axel Ancona Esselmann on 6/20/24.
//

import Foundation

public extension Sequence {
    func map<T>(errors: inout [Swift.Error], _ transform: (Element) throws -> T) -> [T] {
        compactMap { (element: Element) -> T? in
            do {
                return try transform(element)
            } catch {
                errors.append(error)
                return nil
            }
        }
    }

    func reduce<Result>(
        into initialResult: Result,
        errors: inout [Swift.Error],
        _ updateAccumulatingResult: (inout Result, Element) throws -> ()
    ) -> Result {
        reduce(into: initialResult) {
            do {
                try updateAccumulatingResult(&$0, $1)
            } catch {
                errors.append(error)
            }
        }
    }
}
