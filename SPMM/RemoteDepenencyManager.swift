//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

class RemoteDepenencyManager {

    enum Error: Swift.Error {
        case noReleaseVersionFound
        case invalidUrl
        case invalidInput
    }

    private enum Input {
        case dependency(url: String, version: String)
        case githubOrg(url: String, name: String)
    }

    var orgs: [String] = []

    func resolve(
        name: String,
        verbose: Bool
    ) async throws -> JsonSpmDependency? {
        guard !orgs.isEmpty else {
            return nil
        }
        for org in orgs {
            do {
                let version = try await fetchVersion(for: org, dependencyName: name)
                let orgUrl = "https://github.com/\(org)"
                let url = "\(orgUrl)/\(name)"
                vPrint("Found depenency at \(orgUrl):", verbose)
                vPrint("\tUrl: \(url)", verbose)
                vPrint("\tversion: \(version)", verbose)
                return JsonSpmDependency(
                    id: UUID(),
                    name: name,
                    url: url,
                    version: version,
                    localPath: nil
                )
            } catch {
                continue
            }
        }
        return nil
    }

    func resolve(
        input line: String,
        name: String,
        verbose: Bool
    ) async throws -> JsonSpmDependency {
        let input = try await parseUserInput(line, name: name)
        switch input {
        case .dependency(url: let url, version: let version):
            vPrint("Found depenency:", verbose)
            vPrint("\tUrl: \(url)", verbose)
            vPrint("\tversion: \(version)", verbose)
            return JsonSpmDependency(
                id: UUID(),
                name: name,
                url: url,
                version: version,
                localPath: nil
            )
        case .githubOrg(url: let url, name: let name):
            return try await resolve(input: url + "/\(name)", name: name, verbose: verbose)
        }
    }

    private func parseUserInput(_ line: String, name: String) async throws -> Input {
        let line = line.trimmingCharacters(in: .whitespaces)
        let components = line.split(separator: " ")
        if components.count == 2 {
            let url = String(components[0])
            let version = String(components[1])
            return .dependency(url: url, version: version)
        } else if
            let result = try /github\.com[\/|:](?<org>[^\/]+)\/(?<dependency>[^\/\s\.]+)/
                .firstMatch(in: line)
        {
            let org = String(result.output.org)
            let dependency = String(result.output.dependency)
            let version = try await fetchVersion(
                for: org,
                dependencyName: dependency
            )
            return .dependency(url: "https://github.com/\(org)/\(dependency)", version: version)
        } else if
            let result = try /github\.com[\/|:](?<org>[^\/\s]+)/
                .firstMatch(in: line)
        {
            let org = String(result.output.org)
            orgs.append(org)
            return .githubOrg(url: "https://github.com/\(org)", name: name)
        } else {
            throw Error.invalidInput
        }
    }

    private func fetchVersion(for org: String, dependencyName: String) async throws -> String {
        guard let releasesUrl = URL(string: "https://api.github.com/repos/\(org)/\(dependencyName)/releases") else {
            throw Error.invalidUrl
        }

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
