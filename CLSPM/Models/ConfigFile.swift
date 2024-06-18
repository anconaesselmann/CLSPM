//  Created by Axel Ancona Esselmann on 6/4/24.
//

import Foundation

struct CreateConfig: Codable {
    var createGithubRepo: Bool = false
}

struct ListConfig: Codable {

    struct OutputFile: Codable {
        enum Format: String, Codable {
            case simplePlainText
        }

        var path: URL?
        var format: Format = .simplePlainText
    }

    var output: OutputFile?

}

struct ConfigFile: Codable {
    var localRoot: String?
    var orgs: [String]?
    var targetIds: [String: UUID]?
    var createConfig: CreateConfig?
    var listConfig: ListConfig?

    func combined(with other: Self) -> Self {
        var combined = ConfigFile()
        combined.localRoot = self.localRoot ?? other.localRoot
        combined.orgs = self.orgs ?? other.orgs
        combined.targetIds = (self.targetIds ?? [:])
            .reduce(into: (other.targetIds ?? [:])) {
                $0[$1.key] = $1.value
            }
        combined.createConfig = self.createConfig ?? other.createConfig
        return combined
    }
}
