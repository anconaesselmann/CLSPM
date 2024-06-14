//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

public extension URL {

    enum Error: Swift.Error {
        case invalidUrl
    }

    static func githubRepo(githubUserName org: String, repoName name: String) throws -> URL {
        guard let url = URL(string: "https://github.com/\(org)/\(name)") else {
            throw Error.invalidUrl
        }
        return url
    }

    static func githubReleases(
        githubUserName org: String,
        repoName name: String
    ) throws -> URL {
        guard let url = URL(string: "https://api.github.com/repos/\(org)/\(name)/releases") else {
            throw Error.invalidUrl
        }
        return url
    }

    static func githubContributors(
        githubUserName org: String,
        repoName name: String
    ) throws -> URL {
        guard let url = URL(string: "https://api.github.com/repos/\(org)/\(name)/contributors") else {
            throw Error.invalidUrl
        }
        return url
    }

    static func githubProjectInfo(
        githubUserName org: String,
        repoName name: String
    ) throws -> URL {
        guard let url = URL(string: "https://api.github.com/repos/\(org)/\(name)") else {
            throw Error.invalidUrl
        }
        return url
    }
}
