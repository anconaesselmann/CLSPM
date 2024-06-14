//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

enum DependencyResolutionInput {
    case dependency(url: URL)
    case versionedDependency(url: URL, version: String)
}

class UserPackageResolutionManager {

    private let fileManager: FileManagerProtocol
    private let remoteManager: RemoteDepenencyManager
    private let spmFileManager: SpmFileManager
    private let input: Input

    init(
        fileManager: FileManagerProtocol,
        service: ServiceProtocol,
        input: Input
    ) {
        self.input = input
        self.fileManager = fileManager
        self.remoteManager = RemoteDepenencyManager(
            fileManager: fileManager,
            service: service
        )
        self.spmFileManager = SpmFileManager(fileManager: fileManager)
    }

    func userResolve(dependencyName: String, in spmfile: String?) async throws {
        guard let userInput = input.readLine() else {
            throw SpmFileManager.Error.invalidUserInput
        }
        let (org, input) = try parseUserInput(userInput, dependencyName: dependencyName)
        try await remoteManager.resolve(
            input: input,
            name: dependencyName,
            org: org
        )
    }

    private func parseUserInput(_ line: String, dependencyName: String) throws -> (org: String?, dependency: DependencyResolutionInput) {
        let line = line.trimmingCharacters(in: .whitespaces)
        let components = line.split(separator: " ")
        if components.count == 2 {
            guard let url = URL(string: String(components[0])) else {
                throw RemoteDepenencyManager.Error.invalidUrl
            }
            let version = String(components[1])
            return (
                org: nil,
                dependency: .versionedDependency(
                    url: url,
                    version: version
                )
            )
        } else if
            let result = try /github\.com[\/|:](?<org>[^\/]+)\/(?<dependency>[^\/\s\.]+)/
                .firstMatch(in: line)
        {
            let org = String(result.output.org)
            let url: URL = try .githubRepo(
                githubUserName: org,
                repoName: String(result.output.dependency)
            )
            return (
                org: org,
                dependency: .dependency(url: url)
            )
        } else if
            let result = try /github\.com[\/|:](?<org>[^\/\s]+)/
                .firstMatch(in: line)
        {
            let org = String(result.output.org)
            let url: URL = try .githubRepo(githubUserName: org, repoName: dependencyName)
            return (
                org: org,
                dependency: .dependency(url: url)
            )
        } else if
            let result = try /^\s*(?<org>[a-zA-A0-9\-]+)\s*$/
                .firstMatch(in: line)
        {
            let org = String(result.output.org)
            let url: URL = try .githubRepo(githubUserName: org, repoName: dependencyName)
            return (
                org: org,
                dependency: .dependency(url: url)
            )
        } else {
            throw RemoteDepenencyManager.Error.invalidInput
        }
    }
}
