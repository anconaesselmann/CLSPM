//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation
import ArgumentParser
import XProjParser

struct Init: ParsableCommand {

    enum Error: Swift.Error {
        case invalidCachedDependencies([String])
    }

    public static let configuration = CommandConfiguration(
        abstract: "Initialize an spmfile"
    )

    @Option(
        name: .shortAndLong,
        help: "The path to a custom spmfile"
    )
    private var spmfile: String?

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
    private var verbose: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Force reinitialization of all targets"
    )
    private var force: Bool = false

    func run() throws {
        let project = try Project()
        let root = try project.root()
        let targets = try project.targets(in: root)
        var targetDependencies = try project.dependencies(in: root, verbose: verbose)
        let cached = Set(cached)
        if !cached.isEmpty {
            let configManager = ConfigManager()
            let cachedDependencies = try configManager
                .dependenciesFile().dependencies
                .filter {
                    cached.contains($0.name)
                }
            let used = Set(cachedDependencies.map { $0.name })
            let notUsed = cached.subtracting(used)
            guard notUsed.isEmpty else {
                throw Error.invalidCachedDependencies(notUsed.sorted())
            }
            for var (targetName, dependencies) in targetDependencies {
                if let target = target {
                    if targetName != target {
                        vPrint("Ignoring target \(targetName)", verbose)
                        continue
                    }
                } else {
                    if targetName.hasSuffix("Tests") {
                        vPrint("Ignoring \(targetName). To add cached dependencies to test files provied the target name with --target", verbose)
                        continue
                    }
                }
                for cachedDependency in cachedDependencies {
                    let newValue = (
                        name: cachedDependency.name,
                        url: cachedDependency.url,
                        version: cachedDependency.version,
                        local: cachedDependency.localPath
                    )
                    if let index = dependencies.firstIndex(where: { cached.contains($0.name) }) {
                        vPrint("Overwriting dependency \(newValue.name) from cache in \(targetName)", verbose)
                        dependencies[index] = newValue
                    } else {
                        vPrint("Using cached dependency \(newValue.name) in \(targetName)", verbose)
                        dependencies.append(newValue)
                    }
                }
                targetDependencies[targetName] = dependencies
            }
        }

        let dependencies = targetDependencies
            .flatMap { $0.value }
            .reduce(into: [:]) {
                $0[$1.name] = $1
            }.values
            .sorted { $0.name < $1.name }

        let targetNames = targets.map { $0.name }

        vPrint("Targets in project: \(targetNames.joined(separator: ", "))", verbose)

        let manager = SpmFileManager()
        var jsonSpmFile: JsonSpmFile
        do {
            if force {
                throw SpmFileManager.Error.fileDoesNotExist("")
            }
            jsonSpmFile = try manager.spmFile(in: spmfile, isVerbose: verbose)
            let existingTargetNames = jsonSpmFile.targets.map { $0.name }
            let missingTargets = Set(targetNames)
                .subtracting(Set(existingTargetNames))
                .map { targetName in
                    JsonSpmTarget(
                        id: UUID(),
                        name: targetName,
                        dependencies: targetDependencies[targetName]?.map { $0.name } ?? []
                    )
                }
            vPrint("Initializing targets:", verbose)
            if verbose {
                if !missingTargets.isEmpty {
                    vPrint("\t\(missingTargets.map { $0.name }.joined(separator: ", "))", verbose)
                } else {
                    vPrint("\tNo new targets", verbose)
                }
            }
            if !jsonSpmFile.targets.isEmpty {
                vPrint("The following targets have not been updated:", verbose)
                if verbose {
                    vPrint("\t\(jsonSpmFile.targets.map { $0.name }.joined(separator: ", "))", verbose)
                }
                vPrint("To reinitialize all targets pass the -f flag", verbose)
            }
            jsonSpmFile.targets = (jsonSpmFile.targets + missingTargets)
                .sorted { $0.name < $1.name}
        } catch SpmFileManager.Error.fileDoesNotExist {
            jsonSpmFile = JsonSpmFile(
                targets: targetNames.map { targetName in
                    JsonSpmTarget(
                        id: UUID(),
                        name: targetName,
                        dependencies: targetDependencies[targetName]?.map { $0.name } ?? []
                    )
                },
                dependencies: dependencies.map {
                    JsonSpmDependency(
                        id: UUID(),
                        name: $0.name,
                        url: $0.url,
                        version: $0.version,
                        localPath: $0.local,
                        useLocal: ($0.url == nil && $0.local != nil) ? true : nil
                    )
                }
            )
        }
        try manager.save(jsonSpmFile, to: spmfile, isVerbose: verbose)
    }
}
