//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

class RemoteDepenencyManager {

    private let fileManager: FileManagerProtocol
    private let service: ServiceProtocol

    enum Error: Swift.Error {
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
                let config = try ConfigManager(fileManager: fileManager).combinedConfigFile()
                return config.orgs ?? []
            } catch {
                print(error)
                return []
            }
        }
    }

    func addOrg(_ newValue: String, global: Bool) throws {
        let manager = ConfigManager(fileManager: fileManager)
        var config = try manager.configFile(global: global)
        config.orgs = ((config.orgs ?? []) + [newValue]).sorted()
        try manager.save(config, global: global)
    }

    init(fileManager: FileManagerProtocol, service: ServiceProtocol) {
        self.fileManager = fileManager
        self.service = service
    }

    func resolve(name: String, localPath: String? = nil) async -> JsonSpmDependency? {
        guard !orgs.isEmpty else {
            return nil
        }
        for org in orgs {
            do {
                let version = try await service.fetchVersion(
                    forOrg: org,
                    dependencyName: name
                )
                let url: URL = try .githubRepo(githubUserName: org, repoName: name)
                let new = JsonSpmDependency(
                    id: UUID(),
                    name: name,
                    url: url.absoluteString,
                    version: version,
                    localPath: localPath
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
        name: String,
        org: String?,
        global: Bool
    ) async throws {
        let remoteUrl: URL
        var remoteVersion: String
        if let org = org {
            try addOrg(org, global: global)
        }
        switch input {
        case .versionedDependency(url: let url, version: let version):
            remoteUrl = url
            remoteVersion = version
        case .dependency(url: let url) where org != nil:
            remoteUrl = url
            remoteVersion = try await service.fetchVersion(
                forOrg: org!,
                dependencyName: name
            )
        default:
            throw Error.invalidInput
        }
        let new = JsonSpmDependency(
            id: UUID(),
            name: name,
            url: remoteUrl.absoluteString,
            version: remoteVersion,
            localPath: nil
        )
        let configManager = ConfigManager(fileManager: fileManager)
        try configManager.saveDependency(new)
    }

    func resolve(repoUrl: URL, localPath: String?, name: String) async throws  -> JsonSpmDependency {
        let remoteVersion = try await service.fetchVersion(
            forRepo: repoUrl
        )
        let new = JsonSpmDependency(
            id: UUID(),
            name: name,
            url: repoUrl.absoluteString,
            version: remoteVersion,
            localPath: localPath
        )
        print("debug new", new)
        let configManager = ConfigManager(fileManager: fileManager)
        try configManager.saveDependency(new)
        return new
    }
}
