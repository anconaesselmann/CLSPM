//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation
import GithubApi

protocol ServiceProtocol {
    func fetchVersion(forOrg org: String, dependencyName: String) async throws -> String
    func fetchVersion(forRepo url: URL) async throws -> String
    func fetchRepoInfo(repoUrl: URL) async throws -> (RepoResponse, RateLimitResponse?, Int)
}

struct Service: ServiceProtocol {

    enum Error: Swift.Error {
        case noReleaseVersionFound
        case notAGithubReop(URL)
        case error(Swift.Error, rateLimit: RateLimitResponse?, statusCode: Int)
        case notAnHttpUrlResponse
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

    func fetchRepoInfo(repoUrl: URL) async throws -> (RepoResponse, RateLimitResponse?, Int) {
        let repo = try repoUrl.githubRepo()
        let apiUrl = try URL.githubProjectInfo(githubUserName: repo.org, repoName: repo.reop)
        let (data, response) = try await URLSession.shared.data(from: apiUrl)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        guard let httpUrlResponse = (response as? HTTPURLResponse) else {
            throw Error.notAnHttpUrlResponse
        }
        let statusCode = httpUrlResponse.statusCode
        var rateLimitResponse: RateLimitResponse?
        let headers = httpUrlResponse.allHeaderFields
        if
            let rateLimitString = headers["x-ratelimit-limit"] as? String,
            let rateLimit = Int(rateLimitString),
            let rateLimitRemainingString = headers["x-ratelimit-remaining"] as? String,
            let rateLimitRemaining = Int(rateLimitRemainingString)
        {
            var rateLimitReset: Date?
            if
                let rateLimitResetString = headers["x-ratelimit-reset"] as? String,
                let rateLimitResetEpoch = Double(rateLimitResetString)
            {
                rateLimitReset = Date(timeIntervalSince1970: rateLimitResetEpoch)
            }
            rateLimitResponse = RateLimitResponse(
                limit: rateLimit,
                remaining: rateLimitRemaining,
                resets: rateLimitReset
            )
        }
        do {
            let repo = try decoder.decode(RepoResponse.self, from: data)
            return (
                repo,
                rateLimitResponse,
                statusCode
            )
        } catch {
            throw Error.error(error, rateLimit: rateLimitResponse, statusCode: statusCode)
        }
    }
}

struct RateLimitResponse {
    let limit: Int
    let remaining: Int
    let resets: Date?

    var resetSecondsRemaining: TimeInterval? {
        guard let date = resets else {
            return nil
        }
        return Date.now.distance(to: date)
    }

    var formattedTimeRemaining: String? {
        guard let resetSecondsRemaining = resetSecondsRemaining else {
            return nil
        }
        return Duration.seconds(resetSecondsRemaining).formatted()
    }
}

enum GithubApiError: Error {
    case rateLimmitError(RateLimitResponse)
}
