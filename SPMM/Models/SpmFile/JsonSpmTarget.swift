//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

struct JsonSpmTarget: Codable {
    let id: UUID?
    let name: String
    let dependencies: [String]
}
