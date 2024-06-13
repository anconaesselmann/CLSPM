//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

enum DependencyResolutionInput {
    case dependency(url: String)
    case versionedDependency(url: String, version: String)
    case githubOrg(url: String, org: String)
}

class UserPackageResolutionManager {

    private let fileManager: FileManagerProtocol
    private let remoteManager: RemoteDepenencyManager
    private let spmFileManager: SpmFileManager

    init(fileManager: FileManagerProtocol) {
        self.fileManager = fileManager
        self.remoteManager = RemoteDepenencyManager(fileManager: fileManager)
        self.spmFileManager = SpmFileManager(fileManager: fileManager)
    }

    func userResolve(dependencyName: String, in spmfile: String?) async throws {
        let configManager = ConfigManager(fileManager: fileManager)
        guard let userInput = readLine() else {
            throw SpmFileManager.Error.invalidUserInput
        }
        let input = try parseUserInput(userInput, name: dependencyName)
        try await remoteManager.resolve(
            input: input,
            name: dependencyName
        )
    }

    private func parseUserInput(_ line: String, name: String) throws -> DependencyResolutionInput {
        let line = line.trimmingCharacters(in: .whitespaces)
        let components = line.split(separator: " ")
        if components.count == 2 {
            let url = String(components[0])
            let version = String(components[1])
            return .versionedDependency(url: url, version: version)
        } else if
            let result = try /github\.com[\/|:](?<org>[^\/]+)\/(?<dependency>[^\/\s\.]+)/
                .firstMatch(in: line)
        {
            let org = String(result.output.org)
            let dependency = String(result.output.dependency)
            return .dependency(url: "https://github.com/\(org)/\(dependency)")
        } else if
            let result = try /github\.com[\/|:](?<org>[^\/\s]+)/
                .firstMatch(in: line)
        {
            let org = String(result.output.org)
            return .githubOrg(url: "https://github.com/\(org)", org: org)
        } else if
            let result = try /^\s*(?<org>[a-zA-A0-9\-]+)\s*$/
                .firstMatch(in: line)
        {
            let org = String(result.output.org)
            return .githubOrg(url: "https://github.com/\(org)", org: org)
        } else {
            throw RemoteDepenencyManager.Error.invalidInput
        }
    }
}
