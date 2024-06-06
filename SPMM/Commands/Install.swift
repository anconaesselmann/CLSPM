//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation
import ArgumentParser

struct Install: AsyncParsableCommand {

    enum Error: Swift.Error {
        case invalidLocalOverrides([String])
        case invalidUserInput
        case invalidDirectoryPath(String)
    }

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

    @Flag(
        name: .long,
        help: "Packages are cloned to a local DerivedData directory inside .swiftspmm"
    )
    private var cloneToSpmmDir: Bool = false

    @Option(
        name: .long,
        help: "Location remote packages get cloned to"
    )
    private var packageCacheDir: String?

    func run() async throws {
        let manager = SpmFileManager()

        vPrint("Installing packages from spmfile", verbose)

        var targets = try await manager.targets(in: spmfile, isVerbose: verbose)

        vPrint("Targets: \(targets.names.joined(separator: ", "))", verbose)

        try useLocalDependencies(Set(local), for: &targets)

        let location = PackageLocation(
            packageCacheDir: packageCacheDir,
            cloneToSpmmDir: cloneToSpmmDir
        )

        let remove = try manager.packagesToRemove(in: targets)
        let add = try manager.packagesToAdd(in: targets)

        let packagesNeedingToResolveLocalPath = add
            .filter { $0.isLocal && !$0.dependency.hasLocalPath }
            .map { $0.dependency.name }

        if !packagesNeedingToResolveLocalPath.isEmpty {
            let configManager = ConfigManager()
            let localRoot = try configManager
                .combinedConfigFile()
                .localRoot
            if localRoot == nil {
                print("The following packages do not have a local path:")
                for packageName in packagesNeedingToResolveLocalPath {
                    print("\t\(packageName)")
                }
                print("Enter a common local path:")
                guard let path = readLine() else {
                    throw Error.invalidUserInput
                }
                guard configManager.directoryExistsAtPath(path) else {
                    throw Error.invalidDirectoryPath(path)
                }
                print("Use \(path) for all projects (y/n)")
                let response = readLine() ?? "n"
                let global = Bool(extendedMeaningString: response)
                try configManager.setLocalRoot(path, global: global)
            }
        }
        try Project()
            .removed(remove, verbose: verbose)
            .added(add, verbose: verbose)
            .save()
            .reloadPackages(location)
    }

    func useLocalDependencies(
        _ dependencyNamesToUseLocal: Set<String>,
        for targets: inout [String : Target]
    ) throws {
        if !dependencyNamesToUseLocal.isEmpty {
            var found: Set<String> = []
            vPrint("Override to use local packages", verbose)
            targets = targets.reduce(into: [:]) {
                var (targetName, target) = $1
                let foundInTarget = target.useLocal(for: dependencyNamesToUseLocal)
                if foundInTarget.isEmpty {
                    vPrint("Target \(targetName) had no local dependencies", verbose)
                } else {
                    found = found.union(foundInTarget)
                    vPrint("Using local dependencies in \(targetName):", verbose)
                    for dependencyName in found.sorted() {
                        vPrint("\t\(dependencyName)", verbose)
                    }
                }
                $0[targetName] = target
            }
            let notFound = dependencyNamesToUseLocal.subtracting(found)
            if !notFound.isEmpty {
                throw Error.invalidLocalOverrides(notFound.sorted())
            }
        }
    }
}
