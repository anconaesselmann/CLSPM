//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation

extension XProjIsa {

    enum Error: Swift.Error {
        case invalid
    }

    init(elementBody: Substring) throws {
        let regex = /\{\s*isa\s+=\s+(?<isa>[^;]+);/
            .dotMatchesNewlines()
        guard let result = try regex.firstMatch(in: elementBody) else {
            throw Error.invalid
        }
        let isaString = String(result.isa)
        self.init(rawValue: isaString)
    }

    init?(header: Substring) {
        let regex = /\/\*\s+Begin\s+(?<isa>[^\s]+)\s+[^\*]+\*\//

        guard let result = try? regex.firstMatch(in: header) else {
            return nil
        }
        let isaString = String(result.isa)
        self.init(rawValue: isaString)
    }
}
