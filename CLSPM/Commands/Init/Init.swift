//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation
import ArgumentParser
import XProjParser

struct Init: ParsableCommand {

    public static let configuration = CommandConfiguration(
        abstract: "Initialize an spmfile"
    )

    @Option(
        name: .shortAndLong,
        help: "The path to a custom spmfile"
    )
    var spmfile: String?

    @Option(
        name: .shortAndLong,
        parsing: .upToNextOption,
        help: "Name of a SPM (Swift Package Manager) dependency."
    )
    var dependency: [String] = []

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    var verbose: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Force reinitialization of all targets"
    )
    var force: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Creates an spmfile that includes the project's test-targets"
    )
    var testTargets: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Does not add dependencies to the spmfile. On install dependencies are resolved from a global list of dependencies."
    )
    var globalDependencies: Bool = false

    @Flag(
        name: .long,
        help: "Simplified spmfile of comma-separated dependencies."
    )
    var csv: Bool = false

    func run() throws {
        try self.run(fileManager: FileManager.default)
    }

    func run(fileManager: FileManagerProtocol) throws {
        let view = InitView(verbose: verbose)
        guard !(csv && globalDependencies) else {
            // TODO: give more info to user
            throw InitError.globalDependenciesNotSupportedForCsv
        }
        let configManager = ConfigManager(fileManager: fileManager)
        let manager = SpmFileManager(fileManager: fileManager)
        if force {
            try? manager.removeSpmFile()
        } else {
            guard !manager.hasSpmFile else {
                // TODO: Let user know that they can add dependencies with `add` and update targets with `update --targets`
                throw InitError.projectHasBeenInitialized
            }
        }
        let project = try Project(fileManager: fileManager)
        let root = try project.root()
        let targets = try project.targets(in: root)
        var targetDependencies = try project.dependencies(in: root, verbose: verbose)
        let passedIn = Set(dependency)

        var targetNames = targets.map { $0.name }

        let cachedDependencies = try configManager
            .dependenciesFile()
            .dependencies

        let chachedDependencyIds: [String: UUID] = cachedDependencies.reduce(into: [:]) {
            $0[$1.name] = $1.id ?? UUID()
        }

        var ignored: Set<String> = []
        if !testTargets {
            ignored = Set(targetNames.filter { $0.hasSuffix("Tests") })
        }
        targetNames = targetNames.filter { !ignored.contains($0) }
        view.ignoredTargets(ignored)

        for ignore in ignored {
            targetDependencies.removeValue(forKey: ignore)
        }

        let configFile = try configManager.combinedConfigFile()
        let targetIds: [String: UUID] = configFile.targetIds ?? [:]
        var newTargetIds: [String: UUID] = [:]

        if !passedIn.isEmpty {
            view.dependenciesToResolve(passedIn)
            targetDependencies = try targetDependencies.resolve(passedIn, using: cachedDependencies)
        }

        let spmTargets = targetDependencies.targetsFor(
            targetNames: targetNames,
            targetIds: targetIds,
            newTargetIds: &newTargetIds
        )

        let dependencies = targetDependencies
            .flatMap { $0.value }
            .byName.values
            .sorted()
            .map { $0.withUpdatedId(chachedDependencyIds[$0.name]) }

        view.dependenciesAcrossAllTargets(dependencies)

        let spmFileDependencies: [JsonSpmDependency]? = globalDependencies
            ? nil
            : dependencies
        let jsonSpmFile = JsonSpmFile(
            targets: spmTargets,
            dependencies: spmFileDependencies
        )
        if !newTargetIds.isEmpty {
            var localConfigFile = try configManager.configFile(global: false)
            let existing = localConfigFile.targetIds ?? [:]
            localConfigFile.targetIds = newTargetIds
                .reduce(into: existing) {
                    $0[$1.key] = $1.value
                }
            try configManager.save(localConfigFile, global: false)
        }
        try manager.save(jsonSpmFile, to: spmfile, isCsv: csv)
    }
}

fileprivate extension Dictionary where Key == String, Value == [JsonSpmDependency] {
    func targetsFor(
        targetNames: [String],
        targetIds: [String: UUID],
        newTargetIds: inout [String: UUID]
    ) -> [JsonSpmTarget] {
        targetNames.map { targetName in
            let targetId: UUID
            if let existing = targetIds[targetName] {
                targetId = existing
            } else {
                targetId = UUID()
                newTargetIds[targetName] = targetId
            }
            return JsonSpmTarget(
                id: targetId,
                name: targetName,
                dependencies: (self[targetName]?.names ?? []).sorted()
            )
        }
    }

    func resolve(
        _ cached: Set<String>,
        using cachedDependencies: [JsonSpmDependency]
    ) throws -> Self {
        var copy = self
        let filteredCachedDependencies = cachedDependencies
            .filter { cached.contains($0.name) }
        let used = Set(filteredCachedDependencies.names)
        let notUsed = cached.subtracting(used)
        guard notUsed.isEmpty else {
            throw InitError.couldNotResolveDependencyNames(notUsed.sorted())
        }
        copy = copy.reduce(into: copy) {
            var dependencies = $1.value
            for dependency in filteredCachedDependencies {
                if let index = dependencies.firstIndex(where: { $0.name == dependency.name }) {
                    dependencies[index] = dependency
                } else {
                    dependencies.append(dependency)
                }
            }
            $0[$1.key] = dependencies.sorted()
        }
        return copy
    }
}
