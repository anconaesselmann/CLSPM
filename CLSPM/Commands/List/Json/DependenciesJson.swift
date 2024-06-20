//  Created by Axel Ancona Esselmann on 6/20/24.
//

import Foundation

struct DependenciesJson: Codable {

    enum Error: Swift.Error {
        case noContent
    }
    struct AttributionJson: Codable {
        let name: String
        let htmlUrl: URL
        let creator: String
        let creatorHtmlUrl: URL
    }

    var elements: [RepoJson]
    var attribution: AttributionJson

    static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes, .sortedKeys]
        return encoder
    }()

    func data() throws -> Data {
        try Self.encoder.encode(self)
    }

    func string() throws -> String {
        guard let content = String(data: try data(), encoding: .utf8) else {
            throw Error.noContent
        }
        return content
    }
}
