//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation
import ArgumentParser

struct Install: AsyncParsableCommand {

    public static let configuration = CommandConfiguration(
        abstract: "Install dependencies from an spmfile"
    )

    @Option(
        name: .shortAndLong,
        help: "The path to a custom spmfile"
    )
    var spmfile: String?

    @Option(
        name: .shortAndLong,
        help: "An override list of packages to be used locally"
    )
    var local: [String] = []

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    var verbose: Bool = false

    @Flag(
        name: .long,
        help: "Packages are cloned to a local DerivedData directory inside .swiftclpm"
    )
    var cloneToClspmDir: Bool = false

    @Option(
        name: .long,
        help: "Location remote packages get cloned to"
    )
    var packageCacheDir: String?

    func run() async throws {
        try await self.run(fileManager: FileManager.default)
    }

    func run(fileManager: FileManagerProtocol) async throws {
        let view = InstallView(verbose: verbose)

        let manager = SpmFileManager(fileManager: fileManager)
        let configManager = ConfigManager(fileManager: fileManager)

        let localRoot = try configManager
            .combinedConfigFile()
            .localRoot

        view.installingPackages()

        let targets = try await manager
            .targets(in: spmfile)
            .mapUsingLocalDependencies(for: local)

        view.packageSources(targets)

        let location = PackageLocation(
            packageCacheDir: packageCacheDir,
            cloneToClspmDir: cloneToClspmDir
        )

        let remove = try manager.packagesToRemove(in: targets)
        let add = try manager.packagesToAdd(in: targets)

        let packagesNeedingToResolveLocalPath = add
            .filter { $0.isLocal && !$0.dependency.hasLocalPath }
            .map { $0.dependency.name }

        if !packagesNeedingToResolveLocalPath.isEmpty, localRoot == nil {
            view.packagesWithoutLocalPaths(packagesNeedingToResolveLocalPath)
            let path = try view.getPath()
            guard configManager.directoryExistsAtPath(path) else {
                throw InstallError.invalidDirectoryPath(path)
            }
            let usePathForAllProjects = view.getYesNo("Use \(path) for all projects (y/n)")
            try configManager.setLocalRoot(path, global: usePathForAllProjects)
        }
        try Project(fileManager: fileManager)
            .removed(remove, verbose: verbose)
            .added(add, verbose: verbose)
            .save()
            .reloadPackages(location)
    }
}
