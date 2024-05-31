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
        let targets = try Project().targets()
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
                        dependencies: []
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
                        dependencies: []
                    )
                },
                dependencies: []
            )
        }
        try manager.save(jsonSpmFile, to: spmfile, isVerbose: verbose)
    }
}
