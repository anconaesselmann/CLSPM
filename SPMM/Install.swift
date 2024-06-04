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

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    private var verbose: Bool = false

    func run() throws {
        vPrint("Installing packages from spmfile", verbose)

        let manager = SpmFileManager()
        let targets = try manager.targets(in: spmfile, isVerbose: verbose)

        vPrint("Targets: \(targets.keys.joined(separator: ", "))", verbose)

        let remove = try manager.packagesToRemove(in: targets)
        let add = try manager.packagesToAdd(in: targets)
        try Project()
            .removed(remove, verbose: verbose)
            .added(add, verbose: verbose)
            .save()
            .reloadPackages()
    }
}

