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
        vPrint("Installing packages from spmfile", verbose)

        let manager = SpmFileManager()
        var targets = try await manager.targets(in: spmfile, isVerbose: verbose)

        vPrint("Targets: \(targets.keys.joined(separator: ", "))", verbose)

        let local = Set(local)
        if !local.isEmpty {
            var notUsed = local
            vPrint("Override to use local packages", verbose)
            targets = targets.reduce(into: [:]) {
                let dependencies = $1.value
                let targetName = $1.key
                $0[targetName] = (
                    id: dependencies.id,
                    dependencies: dependencies.dependencies.map {
                        guard local.contains($0.name) else {
                            return $0
                        }
                        var copy = $0
                        copy.useLocal = true
                        notUsed.remove($0.name)
                        vPrint("\tUsing local package: \(targetName) - \($0.name)", verbose)
                        return copy
                    }
                )
            }
            if !notUsed.isEmpty {
                throw Error.invalidLocalOverrides(notUsed.sorted())
            }
        }
        let location: PackageLocation
        if let packageCacheDir = packageCacheDir {
            location = .custom(packageCacheDir)
        } else if cloneToSpmmDir {
            location = .spmmDerivedData
        } else {
            location = .defaultLocation
        }

        let remove = try manager.packagesToRemove(in: targets)
        let add = try manager.packagesToAdd(in: targets)
        let namesOfLocalPackagesMissingLocalPaths = add
            .filter { $0.isLocal && !$0.dependency.hasLocalPath }
            .map { $0.dependency.name }
        if !namesOfLocalPackagesMissingLocalPaths.isEmpty {
            let configManager = ConfigManager()
            let localRoot = try configManager
                .combinedConfigFile()
                .localRoot
            if localRoot == nil {
                print("The following packages do not have a local path:")
                for packageName in namesOfLocalPackagesMissingLocalPaths {
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
}
