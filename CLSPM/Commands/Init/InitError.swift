//  Created by Axel Ancona Esselmann on 6/9/24.
//

import Foundation

enum InitError: Swift.Error, LocalizedError {
    case couldNotResolveDependencyNames([String])
    case projectHasBeenInitialized
}
