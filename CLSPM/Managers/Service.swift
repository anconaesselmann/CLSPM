//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

protocol ServiceProtocol {
    func fetchVersion(forOrg org: String, dependencyName: String) async throws -> String
    func fetchVersion(forRepo url: URL) async throws -> String
}

struct Service: ServiceProtocol {

    enum Error: Swift.Error {
        case noReleaseVersionFound
        case notAGithubReop(URL)
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

    func fetchVersion(forRepo url: URL) async throws -> String {
        if
            let result = try /github\.com[\/|:](?<org>[^\/]+)\/(?<dependency>[^\/\s\.]+)/
                .firstMatch(in: url.absoluteString)
        {
            let org = String(result.output.org)
            let dependencName = String(result.output.dependency)
            print("debug", org, dependencName)
            let version = try await fetchVersion(
                forOrg: org,
                dependencyName: dependencName
            )
            return version
        } else {
            print("debug", Error.notAGithubReop(url))
            throw Error.notAGithubReop(url)
        }
    }
}
