//  Created by Axel Ancona Esselmann on 5/31/24.
//

import Foundation
import XProjParser

struct SpmFileManager {

    enum Error: Swift.Error {
        case invalidSpmFile
        case couldNotOpenFile(String)
        case fileDoesNotExist(String)
        case invalidUserInput
        case notMicroSpmfileCompatible
        case unresovedDependencies([String])
    }

    private let output = Output.shared
    private let fileManager: FileManagerProtocol

    init(fileManager: FileManagerProtocol) {
        self.fileManager = fileManager
    }

    func spmFile(in spmfile: String?) throws -> JsonSpmFile {
        if let spmfile = spmfile {
            output.send("Using spmfile \"\(spmfile)\"", .verbose)
        }
        let spmFileDir = spmfile ?? spmfileDir()
        guard fileManager.fileExists(atPath: spmFileDir) else {
            throw Error.fileDoesNotExist(spmFileDir)
        }
        guard let spmFileData = fileManager.contents(atPath: spmFileDir) else {
            throw Error.couldNotOpenFile(spmFileDir)
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            return try decoder.decode(JsonSpmFile.self, from: spmFileData)
        } catch {
            guard let string = String(data: spmFileData, encoding: .utf8) else {
                throw Error.invalidSpmFile
            }
            let dependencyNames = string
                .split(separator: ",")
                .map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
            for dependencyName in dependencyNames {
                if dependencyName.contains(/[^a-zA-Z0-9]/) {
                    throw Error.invalidSpmFile
                }
            }
            let project = try Project(fileManager: fileManager)
            let root = try project.root()
            let targets = try project.targets(in: root)
                .filter {
                    !$0.name.hasSuffix("Tests")
                }
            guard targets.count == 1, let target = targets.first else {
                throw Error.invalidSpmFile
            }
            return JsonSpmFile(targets: [
                JsonSpmTarget(id: UUID(), name: target.name, dependencies: dependencyNames)
            ])
        }

    }

    func unresolvableDependencies(in spmfile: String?) throws -> [String]? {
        let spmFileJson = try spmFile(in: spmfile)

        let dependencyNames: Set<String> = spmFileJson.targets
            .reduce(into: []) {
                $0 = $0.union(Set($1.dependencies))
            }

        let configManager = ConfigManager(fileManager: fileManager)
        let dependenciesFile = try configManager.dependenciesFile()
        let cachedDependencyNames = Set(dependenciesFile.dependencies.names)

        let resolvedDependencyNames = Set(spmFileJson.dependencyNames)
        let uresolvedDependencyNames = dependencyNames.subtracting(resolvedDependencyNames)
        let resolvableByDependenciesFile = uresolvedDependencyNames.intersection(cachedDependencyNames)
        let unresolvable = uresolvedDependencyNames.subtracting(resolvableByDependenciesFile).sorted()
        guard !unresolvable.isEmpty else {
            return nil
        }
        return unresolvable
    }

    func targets(in spmfile: String?) throws -> [String: Target] {
        let spmFileJson = try spmFile(in: spmfile)

        let dependencyNamesUsedByTargets: Set<String> = spmFileJson.targets
            .reduce(into: []) {
                $0 = $0.union(Set($1.dependencies))
            }

        let configManager = ConfigManager(fileManager: fileManager)
        let dependenciesFile = try configManager.dependenciesFile()

        let resolvedDependencyNames = Set(spmFileJson.dependencyNames)
        let uresolvedDependencyNames = dependencyNamesUsedByTargets.subtracting(resolvedDependencyNames)

        var dependencies = spmFileJson.dependencies?.byName ?? [:]

        if !uresolvedDependencyNames.isEmpty {
            let resolved = dependenciesFile.dependencies
                .filter { uresolvedDependencyNames.contains($0.name) }
            let unresolved = uresolvedDependencyNames.subtracting(Set(resolved.names))
            guard unresolved.isEmpty else {
                throw Error.unresovedDependencies(unresolved.sorted())
            }
            for dependency in resolved {
                dependencies[dependency.name] = dependency
            }
        }

        let targetIds: [String: UUID] = spmFileJson.targets
            .reduce(into: [:]) {
                $0[$1.name] = $1.id
            }

        return spmFileJson.targets
            .reduce(into: [String: Target]()) {
                let depencencies = $1.dependencies
                    .compactMap { dependencyName in
                        dependencies[dependencyName]
                    }
                $0[$1.name] = Target(id: targetIds[$1.name], dependencies: depencencies)
            }
    }

    func packagesToRemove(in targets: [String: Target]) throws -> [(packageName: String, relativePath: String?, targetName: String)] {
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

    func packagesToAdd(
        in targets: [String: Target]
    ) -> [
        (
            dependency: XProjDependency,
            isLocal: Bool,
            needsVersion: Bool,
            targetName: String
        )
    ]
    {
        targets.flatMap { (targetName, target) in
            target.dependencies.map { value -> (dependency: XProjDependency, isLocal: Bool, needsVersion: Bool, targetName: String) in
                let targetId = target.id
                let dependencyId = value.id ?? UUID()
                let start = targetId.uuidString.startIndex
                let center = targetId.uuidString.index(start, offsetBy: 8)
                let end = targetId.uuidString.endIndex
                let id = UUID(uuidString: String(targetId.uuidString[start..<center]) + String(dependencyId.uuidString[center..<end])) ?? UUID()
                return (
                    dependency: XProjDependency(
                        id: id,
                        name: value.name,
                        url:  value.url,
                        version: value.version,
                        localPath: value.localPath
                    ),
                    isLocal: value.useLocal ?? false,
                    needsVersion: value.localPath == nil && value.version == nil,
                    targetName: targetName
                )
            }
        }
    }

    func updateSpmFileDepenency(_ depenency: JsonSpmDependency, in spmfileDir: String?) throws {
        var spmfile = try self.spmFile(in: spmfileDir)
        let dependencyNames = Set(spmfile.dependencyNames)
        guard dependencyNames.contains(depenency.name) else {
            return
        }
        var dependencies = spmfile.dependencies ?? []
        guard let index = dependencies.firstIndex(where: { $0.name == depenency.name}) else {
            return
        }
        var updated = dependencies[index]
        updated.id = updated.id ?? depenency.id ?? UUID()
        updated.url = updated.url ?? depenency.url
        updated.localPath = updated.localPath ?? depenency.localPath
        updated.version = updated.version ?? depenency.version
        dependencies[index] = updated
        spmfile.dependencies = dependencies
        try save(spmfile, to: spmfileDir, isCsv: false)
    }

    func save(_ jsonFile: JsonSpmFile, to spmfile: String?, isCsv: Bool) throws {
        let dir = spmfile ?? spmfileDir()
        output.send("Saving spmfile:", .verbose)
        output.send("\t\(dir)", .verbose)
        let url = URL(fileURLWithPath: dir)
        if isCsv {
            guard jsonFile.microCompatible else {
                output.send("Incompatible targets", .verbose)
                throw Error.notMicroSpmfileCompatible
            }
            guard let target = jsonFile.targets
                .first(where: { !$0.name.hasSuffix("Tests")} )
            else {
                output.send("No none-test targets", .verbose)
                throw Error.notMicroSpmfileCompatible
            }
            guard let data = target.dependencies.joined(separator: ", ").data(using: .utf8) else {
                output.send("Could not save micro spmfile", .verbose)
                throw Error.notMicroSpmfileCompatible
            }
            try data
                .write(to: url)
        } else {
            try Self.encoder.encode(jsonFile)
                .write(to: url)
        }
    }

    var hasSpmFile: Bool {
        fileManager.fileExists(atPath: spmfileDir())
    }

    func removeSpmFile() throws {
        let url = URL(fileURLWithPath: spmfileDir())
        try fileManager.removeItem(at: url)
    }

    func spmfileDir() -> String {
        let currentPath = fileManager.currentDirectoryPath
        return "\(currentPath)/spmfile"
    }

    static var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes, .sortedKeys]
        return encoder
    }

    static var decoder: JSONDecoder {
        let encoder = JSONDecoder()
        encoder.keyDecodingStrategy = .convertFromSnakeCase
        return encoder
    }
}
