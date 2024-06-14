//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

extension URL {
    static func githubRepo(githubUserName org: String, repoName name: String) throws -> URL {
        guard let url = URL(string: "https://github.com/\(org)/\(name)") else {
            throw RemoteDepenencyManager.Error.invalidUrl
        }
        return url
    }

    static func githubReleases(
        githubUserName org: String,
        repoName name: String
    ) throws -> URL {
        guard let url = URL(string: "https://api.github.com/repos/\(org)/\(name)/releases") else {
            throw RemoteDepenencyManager.Error.invalidUrl
        }
        return url
    }

    static func githubContributors(
        githubUserName org: String,
        repoName name: String
    ) throws -> URL {
        guard let url = URL(string: "https://api.github.com/repos/\(org)/\(name)/contributors") else {
            throw RemoteDepenencyManager.Error.invalidUrl
        }
        return url
    }
}
