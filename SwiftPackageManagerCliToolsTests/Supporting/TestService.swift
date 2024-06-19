//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation
import GithubApi

struct TestService: ServiceProtocol {

    var version: [String: String] = [
        "LoadableView": "0.3.9",
        "DebugSwiftUI": "0.0.1"
    ]

    var versionForRepoUrl: [URL: String] = [:]

    func fetchVersion(
        forOrg org: String,
        dependencyName: String
    ) async throws -> String {
        version[dependencyName] ?? "9.9.9"
    }

    func fetchVersion(forRepo url: URL) async throws -> String {
        versionForRepoUrl[url] ?? "9.9.9"
    }

    func fetchRepoInfo(repoUrl: URL, pat: String?) async throws -> (RepoResponse, RateLimitResponse?, Int) {
        fatalError("not implemented")
    }
}
