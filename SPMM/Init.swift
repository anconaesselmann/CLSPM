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
    private var spmfile: String?

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    private var verbose: Bool = false

    func run() throws {
        let project = try Project()
        let root = try project.root()
        let targets = try project.targets(in: root)
        let targetDependencies = try project.dependencies(in: root, verbose: verbose)
        let dependencies = targetDependencies
            .flatMap { $0.value }
            .reduce(into: [:]) {
                $0[$1.name] = $1
            }.values

        let targetNames = targets.map { $0.name }

        vPrint("Targets in project: \(targetNames.joined(separator: ", "))", verbose)

        let manager = SpmFileManager()
        var jsonSpmFile: JsonSpmFile
        do {
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
                        useLocal: nil
                    )
                }
            )
        }
        try manager.save(jsonSpmFile, to: spmfile, isVerbose: verbose)
    }
}
