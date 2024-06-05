//  Created by Axel Ancona Esselmann on 5/31/24.
//

import Foundation
import XProjParser

struct SpmFileManager {

    private let fileManager = FileManager.default

    enum Error: Swift.Error {
        case invalidSpmFile
        case couldNotOpenFile(String)
        case fileDoesNotExist(String)
    }

    func spmFile(in spmfile: String?, isVerbose verbose: Bool) throws -> JsonSpmFile {
        if let spmfile = spmfile {
            vPrint("Using spm file \"\(spmfile)\"", verbose)
        }
        let spmFileDir = try spmfile ?? (try spmfileDir())
        guard fileManager.fileExists(atPath: spmFileDir) else {
            throw Error.fileDoesNotExist(spmFileDir)
        }
        guard let spmFileData = fileManager.contents(atPath: spmFileDir) else {
            throw Error.couldNotOpenFile(spmFileDir)
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try decoder.decode(JsonSpmFile.self, from: spmFileData)
    }

    func targets(in spmfile: String?, isVerbose verbose: Bool) async throws -> [String: (id: UUID, dependencies: [JsonSpmDependency])] {
        let spmFileJson = try spmFile(in: spmfile, isVerbose: verbose)

        let dependencyNamesUsedByTargets: Set<String> = spmFileJson.targets.reduce(into: []) {
            let targetName = $1.name
            $0 = $0.union(Set($1.dependencies))
        }
        let resolvedDependencyNames = Set((spmFileJson.dependencies ?? []).map { $0.name })
        let uresolvedDependencyNames = dependencyNamesUsedByTargets.subtracting(resolvedDependencyNames)

        var dependencies: [String: JsonSpmDependency] = (spmFileJson.dependencies ?? [])
            .reduce(into: [:]) {
                $0[$1.name] = $1
            }

        if !uresolvedDependencyNames.isEmpty {
            let configManager = ConfigManager()
            var dependenciesFile = try configManager.dependenciesFile()
            let globalDependencies: [String: JsonSpmDependency] = dependenciesFile
                .dependencies.reduce(into: [:]) {
                    $0[$1.name] = $1
                }
            vPrint("Unresolved dependencies", verbose)
            let sorted = uresolvedDependencyNames.sorted()
            for dependencyName in sorted {
                vPrint("\t\(dependencyName)", verbose)
            }
            vPrint("Resolving global dependencies", verbose)
            for dependencyName in sorted {
                if let resolvedDependency = globalDependencies[dependencyName] {
                    dependencies[dependencyName] = resolvedDependency
                    vPrint("\t\(dependencyName) resolved", verbose)
                } else {
                    print("Could not resolve dependency \(dependencyName)")
                    print("Enter the url for a repository where the \(dependencyName) dependency can be found:")
                    guard let urlString = readLine() else {
                        fatalError()
                    }
                    guard 
                        let result = try /github\.com[\/|:](?<org>[^\/]+)\/(?<dependency>[^\/\s\.]+)/
                            .firstMatch(in: urlString)
                    else {
                        fatalError()
                    }
                    let org = String(result.output.org)
                    let dependencyName = String(result.output.dependency)

                    guard let releasesUrl = URL(string: "https://api.github.com/repos/\(org)/\(dependencyName)/releases") else {
                        fatalError()
                    }

                    let (data, _) = try await URLSession.shared.data(from: releasesUrl)

                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    decoder.dateDecodingStrategy = .iso8601
                    let releases = try decoder.decode([GithubRelease].self, from: data)
                        .filter { $0.draft == false && $0.prerelease == false}
                    guard let latestVersion = releases.first?.tagName else {
                        fatalError()
                    }
                    vPrint("\tUsing latest release version: \(latestVersion)", verbose)
                    let new = JsonSpmDependency(
                        id: UUID(),
                        name: dependencyName,
                        url: urlString,
                        version: latestVersion,
                        localPath: nil
                    )
                    dependencies[dependencyName] = new
                    vPrint("\t\(dependencyName) resolved", verbose)
                    dependenciesFile.dependencies = (dependenciesFile.dependencies + [new])
                        .sorted { $0.name < $1.name }
                    try configManager.save(dependenciesFile)
                }
            }
        }

        let targetIds: [String: UUID] = spmFileJson.targets.reduce(into: [:]) {
            $0[$1.name] = $1.id
        }

        return spmFileJson.targets
            .reduce(into: [String: (id: UUID, dependencies: [JsonSpmDependency])]()) {
                let depencencies = $1.dependencies.compactMap { dependencyName in
                    dependencies[dependencyName]
                }
                $0[$1.name] = (id: targetIds[$1.name] ?? UUID(), dependencies: depencencies)
            }
    }

    func packagesToRemove(in targets: [String: (id: UUID, dependencies: [JsonSpmDependency])]) throws -> [(packageName: String, relativePath: String?, targetName: String)] {
        targets.flatMap { (targetName, target) in
            target.dependencies.map {
                (
                    packageName: $0.name,
                    relativePath: $0.localPath,
                    targetName: targetName
                )
            }
        }
    }

    func packagesToAdd(in targets: [String: (id: UUID, dependencies: [JsonSpmDependency])]) throws -> [(dependency: XProjDependency, isLocal: Bool, targetName: String)] {
        try targets.flatMap { (targetName, target) in
            try target.dependencies.map { value -> (dependency: XProjDependency, isLocal: Bool, targetName: String) in
                let targetId = target.id
                let dependencyId = value.id ?? UUID()
                let start = targetId.uuidString.startIndex
                let center = targetId.uuidString.index(start, offsetBy: 8)
                let end = targetId.uuidString.endIndex
                let id = UUID(uuidString: String(targetId.uuidString[start..<center]) + String(dependencyId.uuidString[center..<end])) ?? UUID()
                if let url = value.url, let version = value.version, let localPath = value.localPath {
                    return (
                        dependency: XProjDependency(
                            id: id,
                            name: value.name,
                            url: url,
                            version: version,
                            localPath: localPath
                        ),
                        isLocal: value.useLocal ?? false,
                        targetName: targetName
                    )
                } else if let url = value.url, let version = value.version {
                    return (
                        dependency: XProjDependency(
                            id: id,
                            name: value.name,
                            url: url,
                            version: version
                        ),
                        isLocal: value.useLocal ?? false,
                        targetName: targetName
                    )
                } else if let localPath = value.localPath {
                    return (
                        dependency: XProjDependency(
                            id: id,
                            name: value.name,
                            localPath: localPath
                        ),
                        isLocal: true,
                        targetName: targetName
                    )
                } else if let useLocal = value.useLocal, useLocal == true {
                    return (
                        dependency: XProjDependency(
                            id: id,
                            name: value.name
                        ),
                        isLocal: true,
                        targetName: targetName
                    )
                } else if value.useLocal == nil, value.url == nil, value.version == nil {
                    return (
                        dependency: XProjDependency(
                            id: id,
                            name: value.name
                        ),
                        isLocal: true,
                        targetName: targetName
                    )
                } else {
                    print("Dependency with missing entries:")
                    print(value.name)
                    print("URL: ", value.url ?? "none")
                    print("Version: ", value.version ?? "none")
                    print("Local: ", value.localPath ?? "none")
                    throw Error.invalidSpmFile
                }
            }
        }
    }

    func save(_ spfJson: JsonSpmFile, to spmfile: String?, isVerbose verbose: Bool) throws {
        let dir = try spmfile ?? (try spmfileDir())
        vPrint("Saving spm file \"\(dir)\"", verbose)
        let url = URL(fileURLWithPath: dir)
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes, .sortedKeys]
        try encoder.encode(spfJson)
            .write(to: url)
    }

    private func spmfileDir() throws -> String {
        let currentPath = fileManager.currentDirectoryPath
        return "\(currentPath)/spmfile"
    }
}
