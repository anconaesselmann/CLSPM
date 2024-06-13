//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

class RemoteDepenencyManager {

    private let fileManager: FileManagerProtocol

    enum Error: Swift.Error {
        case noReleaseVersionFound
        case invalidUrl
        case invalidInput
    }

    private enum Input {
        case dependency(url: String, version: String)
        case githubOrg(url: String, name: String)
    }

    var hasOrgs: Bool {
        !orgs.isEmpty
    }

    var orgs: [String] {
        get {
            do {
                let config = try ConfigManager(fileManager: fileManager).configFile(global: true)
                return config.orgs ?? []
            } catch {
                print(error)
                return []
            }
        }
        set {
            let manager = ConfigManager(fileManager: fileManager)
            do {
                var config = try manager.configFile(global: true)
                config.orgs = newValue.sorted()
                try manager.save(config, global: true)
            } catch {
                print(error)
            }
        }
    }

    init(fileManager: FileManagerProtocol) {
        self.fileManager = fileManager
    }

    func resolve(name: String) async -> JsonSpmDependency? {
        guard !orgs.isEmpty else {
            return nil
        }
        for org in orgs {
            do {
                let version = try await fetchVersion(for: org, dependencyName: name)
                let orgUrl = "https://github.com/\(org)"
                let url = "\(orgUrl)/\(name)"
                let new = JsonSpmDependency(
                    id: UUID(),
                    name: name,
                    url: url,
                    version: version,
                    localPath: nil
                )
                let configManager = ConfigManager(fileManager: fileManager)
                try configManager.saveDependency(new)
                return new
            } catch {
                continue
            }
        }
        return nil
    }

    func resolve(
        input: DependencyResolutionInput,
        name: String
    ) async throws {
        let remoteUrl: String
        let remoteVersion: String
        switch input {
        case .versionedDependency(url: let url, version: let version):
            remoteUrl = url
            remoteVersion = version
        case .dependency(url: let url):
            remoteUrl = url
            remoteVersion = try await fetchVersion(
                for: url,
                dependencyName: name
            )
        case .githubOrg(url: let url, org: let org):
            orgs.append(org)
            remoteUrl = url
            remoteVersion = try await fetchVersion(
                for: url,
                dependencyName: name
            )
        }
        let new = JsonSpmDependency(
            id: UUID(),
            name: name,
            url: remoteUrl,
            version: remoteVersion,
            localPath: nil
        )
        let configManager = ConfigManager(fileManager: fileManager)
        try configManager.saveDependency(new)
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
