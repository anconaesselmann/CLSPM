//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation

struct JsonSpmTarget: Codable {
    let id: UUID?
    let name: String
    let dependencies: [String]
}

struct JsonSpmDependency: Codable {
    let id: UUID?
    let name: String
    let url: String?
    let version: String?
    let localPath: String?
    var useLocal: Bool?
}

struct JsonSpmFile: Codable {
    var targets: [JsonSpmTarget]
    var dependencies: [JsonSpmDependency]?
}
