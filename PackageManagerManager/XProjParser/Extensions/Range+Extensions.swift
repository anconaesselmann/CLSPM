//  Created by Axel Ancona Esselmann on 5/20/24.
//

import Foundation

extension Range where Bound == String.Index {

    enum Error: Swift.Error {
        case invalidRange
    }

    func clipedBounds(for content: any StringProtocol) throws -> Self {
        guard lowerBound > content.startIndex else {
            throw Error.invalidRange
        }
        guard upperBound < content.endIndex else {
            throw Error.invalidRange
        }
        let start = content.index(after: lowerBound)
        let end = content.index(before: upperBound)
        guard start < end else {
            throw Error.invalidRange
        }
        return start..<end
    }
}
