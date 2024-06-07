//  Created by Axel Ancona Esselmann on 6/7/24.
//

import Foundation

extension FileManagerProtocol {
    var spmFileDir: URL {
        currentDirectory
            .appending(path: "spmfile")
    }
}
