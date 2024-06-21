//  Created by Axel Ancona Esselmann on 6/4/24.
//

import Foundation

struct CreateConfig: Codable {
    var createGithubRepo: Bool = false
}

enum ListFormat: String, Codable {
    init?(consoleString: String?) {
        switch consoleString {
        case "plain":
            self = .simplePlainText
        case "md":
            self = .githubMD
        case "json":
            self = .json
        default:
            self = .simplePlainText
        }
    }

    case simplePlainText
    case githubMD
    case json
}

struct ListConfig: Codable {

    struct OutputFile: Codable {
        var path: URL?
        var format: ListFormat = .simplePlainText
    }

    var output: OutputFile?
    var ignored: Set<String>?
}

struct GithubConfig: Codable {
    var pat: String?
    var user: String?
}

struct ConfigFile: Codable {
    var localRoot: String?
    var orgs: [String]?
    var targetIds: [String: UUID]?
    var createConfig: CreateConfig?
    var listConfig: ListConfig?
    var githubConfig: GithubConfig?

    func combined(with other: Self) -> Self {
        var combined = ConfigFile()
        combined.localRoot = self.localRoot ?? other.localRoot
        combined.orgs = self.orgs ?? other.orgs
        combined.targetIds = (self.targetIds ?? [:])
            .reduce(into: (other.targetIds ?? [:])) {
                $0[$1.key] = $1.value
            }
        combined.createConfig = self.createConfig ?? other.createConfig
        combined.githubConfig = self.githubConfig ?? other.githubConfig
        return combined
    }
}
