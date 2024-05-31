//  Created by Axel Ancona Esselmann on 5/31/24.
//

import Foundation
import XProjParser

struct SpmFileManager {

    enum Error: Swift.Error {
        case invalidSpmFile
        case couldNotOpenFile(String)
    }

    func targets(in spmfile: String?, isVerbose verbose: Bool) throws -> [String: (id: UUID, dependencies: [JsonSpmDependency])] {
        if let spmfile = spmfile {
            vPrint("Using spm file \"\(spmfile)\"", verbose)
        }
        let spmFileDir = try spmfile ?? (try spmfileDir())
        guard let spmFileData = FileManager.default.contents(atPath: spmFileDir) else {
            throw Error.couldNotOpenFile(spmFileDir)
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let spmFileJson = try decoder.decode(JsonSpmFile.self, from: spmFileData)

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
                        isLocal: value.useLocal ?? false,
                        targetName: targetName
                    )
                } else {
                    throw Error.invalidSpmFile
                }
            }
        }
    }

    private func spmfileDir() throws -> String {
        let currentPath = FileManager.default.currentDirectoryPath
        return "\(currentPath)/spmfile"
    }
}
