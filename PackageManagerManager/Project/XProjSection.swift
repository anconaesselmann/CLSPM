//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation
import XProjParser

struct XProjSection: Identifiable {

    enum Error: Swift.Error {
        case noIsaInSectionHeader
    }

    var isa: XProjIsa
    var elements: [XProjElement]

    var id: String {
        isa.rawValue // TODO: Not unique right now
    }
}
