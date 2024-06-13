//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

enum InstallError: Swift.Error {
    case invalidLocalOverrides([String])
    case invalidUserInput
    case invalidDirectoryPath(String)
}
