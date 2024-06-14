//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

extension JsonSpmDependency {

    enum Error: Swift.Error {
        case missingUrl
    }

    func consolTextForResolution(useVersion: Bool) throws -> String {
        guard let url = url else {
            throw Error.missingUrl
        }
        var result = url
        if useVersion, let version = version {
            result += " \(version)"
        }
        return result
    }
}
