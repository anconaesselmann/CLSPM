//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation
import ArgumentParser

struct Install: ParsableCommand {

    public static let configuration = CommandConfiguration(
        abstract: "Install dependencies from an spmfile"
    )

    @Option(
        name: .shortAndLong,
        help: "The path to a custom spmfile"
    )
    private var spmfile: String?

    @Option(
        name: .shortAndLong,
        help: "An override list of packages to be used locally"
    )
    private var local: [String] = []

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    private var verbose: Bool = false

    func run() throws {
        vPrint("Installing packages from spmfile", verbose)

        let manager = SpmFileManager()
        var targets = try manager.targets(in: spmfile, isVerbose: verbose)

        vPrint("Targets: \(targets.keys.joined(separator: ", "))", verbose)

        if !local.isEmpty {
            vPrint("Override to use local packages: \(local.sorted { $0 < $1 }.joined(separator: ", "))", verbose)
            targets = targets.reduce(into: [:]) {
                var dependencies = $1.value
                $0[$1.key] = (
                    id: dependencies.id,
                    dependencies: dependencies.dependencies.map {
                        guard local.contains($0.name) else {
                            return $0
                        }
                        var copy = $0
                        copy.useLocal = true
                        return copy
                    }
                )
            }
        }

        let remove = try manager.packagesToRemove(in: targets)
        let add = try manager.packagesToAdd(in: targets)
        try Project()
            .removed(remove, verbose: verbose)
            .added(add, verbose: verbose)
            .save()
            .reloadPackages()
    }
}
