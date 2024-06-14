//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

protocol ServiceProtocol {
    func fetchVersion(forOrg org: String, dependencyName: String) async throws -> String
}

struct Service: ServiceProtocol {

    enum Error: Swift.Error {
        case noReleaseVersionFound
    }

    func fetchVersion(forOrg org: String, dependencyName: String) async throws -> String {
        let releasesUrl: URL = try .githubReleases(githubUserName: org, repoName: dependencyName)
        let (data, _) = try await URLSession.shared.data(from: releasesUrl)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        let releases = try decoder.decode([GithubRelease].self, from: data)
            .filter { $0.draft == false && $0.prerelease == false}
        guard let latestVersion = releases.first?.tagName else {
            throw Error.noReleaseVersionFound
        }
        return latestVersion
    }
}
