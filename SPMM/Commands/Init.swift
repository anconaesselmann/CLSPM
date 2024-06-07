//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation
import ArgumentParser
import XProjParser

struct Init: ParsableCommand {

    enum Error: Swift.Error {
        case couldNotResolveDependencyNames([String])
    }

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
        help: "Dependency names for dependencies cached with `dependency-cache`"
    )
    var cached: [String] = []

    @Option(
        name: .shortAndLong,
        help: "Only perform command on a given target"
    )
    var target: String?

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
        help: "Creates an spmfile without test targets"
    )
    var testTargets: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Does not add dependencies to the spmfile. On install dependencies are resolved from a global list of dependencies. For existing spmfiles --global-dependencies does not remove dependencies."
    )
    var globalDependencies: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "For projects that have only one none-test target a plaintext spmfile that has a comma-separated list of dependencies can be created."
    )
    var microSpmfile: Bool = false

    func run() throws {
        let output = Output.shared
        output.verboseFlagIsSet(verbose)
        
        let project = try Project()
        let root = try project.root()
        let targets = try project.targets(in: root)
        var targetDependencies = try project.dependencies(in: root, verbose: verbose)
        let cached = Set(cached)
        let configManager = ConfigManager()

        var targetNames = targets.map { $0.name }
        if !testTargets {
            let ignored = targetNames.filter { $0.hasSuffix("Tests") }
            output.send("Ignoring targets:", .verbose)
            output.send("\t\(ignored.joined(separator: ", "))", .verbose)
            targetNames = targetNames.filter { !$0.hasSuffix("Tests") }
        }

        if !cached.isEmpty {
            output.send("Resolving dependencies \(cached.sorted().joined(separator: ", "))", .verbose)
            let cachedDependencies = try configManager
                .dependenciesFile().dependencies
                .filter {
                    cached.contains($0.name)
                }
            let used = Set(cachedDependencies.map { $0.name })
            let notUsed = cached.subtracting(used)
            guard notUsed.isEmpty else {
                throw Error.couldNotResolveDependencyNames(notUsed.sorted())
            }
            for (targetName, dependencies) in targetDependencies {
                var dependencies = dependencies
                if let target = target {
                    if targetName != target {
                        output.send("Ignoring target \(targetName)", .verbose)
                        continue
                    }
                } else {
                    if targetName.hasSuffix("Tests") {
                        if !testTargets {
                            output.send("Ignoring target \(targetName)", .verbose)
                            targetDependencies.removeValue(forKey: targetName)
                        } else {
                            output.send("Ignoring \(targetName). To add cached dependencies to test files first run `install` for all none-test targets and re-run `init` with the option --target and the test target's name", .verbose)
                        }
                        continue
                    } else {
                        output.send("Dependencies for target \(targetName):", .verbose)
                    }
                }
                for cachedDependency in cachedDependencies {
                    if let index = dependencies.firstIndex(where: { $0.name == cachedDependency.name }) {
                        output.send("\tOverwriting dependency \(cachedDependency.name) from cache in \(targetName)", .verbose)
                        dependencies[index] = cachedDependency
                    } else {
                        output.send("\tUsing cached dependency \(cachedDependency.name) in \(targetName)", .verbose)
                        dependencies.append(cachedDependency)
                    }
                }
                targetDependencies[targetName] = dependencies
                output.send("All dependencies in \(targetName):", .verbose)
                for dependency in dependencies {
                    output.send("\t\(dependency.name)", .verbose)
                }
            }
        }

        let dependencies = targetDependencies
            .flatMap { $0.value }
            .reduce(into: [:]) {
                $0[$1.name] = $1
            }.values
            .sorted { $0.name < $1.name }

        output.send("Dependencies across all targets:", .verbose)
        if dependencies.isEmpty {
            output.send("\tnone", .verbose)
        } else {
            for dependency in dependencies {
                output.send("\t\(dependency.name)", .verbose)
            }
        }
        let configFile = try configManager.combinedConfigFile()
        let targetIds: [String: UUID] = configFile.targetIds ?? [:]
        var newTargetIds: [String: UUID] = [:]

        let manager = SpmFileManager()
        var jsonSpmFile: JsonSpmFile
        do {
            if force {
                throw SpmFileManager.Error.fileDoesNotExist("")
            }
            jsonSpmFile = try manager.spmFile(in: spmfile)
            let existingTargetNames = jsonSpmFile.targets.map { $0.name }
            let missingTargets = Set(targetNames)
                .subtracting(Set(existingTargetNames))
                .map { targetName in
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
                        dependencies: targetDependencies[targetName]?.map { $0.name } ?? []
                    )
                }
            output.send("Initializing targets:", .verbose)
            if verbose {
                if !missingTargets.isEmpty {
                    output.send("\t\(missingTargets.map { $0.name }.joined(separator: ", "))", .verbose)
                } else {
                    output.send("\tNo new targets", .verbose)
                }
            }
            if !jsonSpmFile.targets.isEmpty {
                output.send("The following targets have not been updated:", .verbose)
                if verbose {
                    output.send("\t\(jsonSpmFile.targets.map { $0.name }.joined(separator: ", "))", .verbose)
                }
                output.send("To reinitialize all targets pass the -f flag", .verbose)
            }
            jsonSpmFile.targets = (jsonSpmFile.targets + missingTargets)
                .sorted { $0.name < $1.name}
        } catch SpmFileManager.Error.fileDoesNotExist {
            let spmFileDependencies: [JsonSpmDependency]? = globalDependencies
                ? nil
                : dependencies
            jsonSpmFile = JsonSpmFile(
                targets: targetNames.map { targetName in
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
                        dependencies: (targetDependencies[targetName]?.map { $0.name } ?? []).sorted()
                    )
                },
                dependencies: spmFileDependencies
            )
        }
        if !newTargetIds.isEmpty {
            var localConfigFile = try configManager.configFile(global: false)
            let existing = localConfigFile.targetIds ?? [:]
            localConfigFile.targetIds = newTargetIds.reduce(into: existing) {
                $0[$1.key] = $1.value
            }
            try configManager.save(localConfigFile, global: false)
        }
        try manager.save(jsonSpmFile, to: spmfile, microSpmfile: microSpmfile)
    }
}
