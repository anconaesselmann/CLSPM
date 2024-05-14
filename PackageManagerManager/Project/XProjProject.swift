//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation

struct XProjProject {
    enum Error: Swift.Error {
        case noProjectHeader
    }

    let header: Substring
    let sections: [XProjSection]
    let footer: Substring
}
