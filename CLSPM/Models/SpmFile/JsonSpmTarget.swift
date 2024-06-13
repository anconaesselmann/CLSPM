//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

struct JsonSpmTarget: Codable, Named {
    let id: UUID?
    let name: String
    var dependencies: [String]
}
