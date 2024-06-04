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

    func targets(in spmfile: String?, isVerbose verbose: Bool) throws -> [String: (id: UUID, dependencies: [JsonSpmDependency])] {
        let spmFileJson = try spmFile(in: spmfile, isVerbose: verbose)

        let dependencies = spmFileJson.dependencies.reduce(into: [String: JsonSpmDependency]()) {
            $0[$1.name] = $1
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
