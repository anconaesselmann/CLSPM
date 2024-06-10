//  Created by Axel Ancona Esselmann on 6/9/24.
//

import Foundation

enum InitError: Swift.Error, LocalizedError {
    case couldNotResolveDependencyNames([String])
    case passingATestTargetIntoInitIsNotSupported // In recovery steps suggest using add
    case projectHasBeenInitialized
}
