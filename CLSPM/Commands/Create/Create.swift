//  Created by Axel Ancona Esselmann on 6/14/24.
//

import Foundation
import ArgumentParser
import XProjParser

struct Create: AsyncParsableCommand {

    enum Error: Swift.Error {
        case invalidTargetNames([String])
        case noTargets
        case noLocalRoot
        case localPathDoesNotExist(String)
        case directoryDoesNotExist(String)
        case invalidDirectory
    }


    public static let configuration = CommandConfiguration(
        abstract: "Creates a local Swift Package from a directory"
    )

    @Flag(
        name: .shortAndLong,
        help: "Adds the new Swift Package to test targets"
    )
    var testTargets: Bool = false

    @Option(
        name: .shortAndLong,
        help: "The source directory from which to create a Swift Package"
    )
    var directory: String

    @Option(
        name: .shortAndLong,
        parsing: .upToNextOption,
        help: "The target to which the new package should be added"
    )
    var target: [String] = []

    @Option(
        name: .shortAndLong,
        help: "The path to a custom spmfile"
    )
    var spmfile: String?

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
        try await self.run(
            fileManager: FileManager.default,
            service: Service()
        )
    }

    func run(fileManager: FileManagerProtocol, service: ServiceProtocol) async throws {
        let output = Output.shared
        let configManager = ConfigManager(fileManager: fileManager)
        let project = try Project(fileManager: fileManager)
        let root = try project.root()
        let targetDependencies = try project.dependencies(in: root, verbose: verbose)
        var targetNames = targetDependencies.keys.sorted()
        if !self.target.isEmpty {
            let allTargets = Set(targetNames)
            let selectedTargets = Set(self.target)
            guard allTargets.union(selectedTargets).count == allTargets.count else {
                throw Error.invalidTargetNames(selectedTargets.subtracting(allTargets).sorted())
            }
            targetNames = targetNames.filter { selectedTargets.contains($0) }
        }
        var ignored: Set<String> = []
        if !testTargets {
            ignored = Set(targetNames.filter { $0.hasSuffix("Tests") })
        }
        targetNames = targetNames.filter { !ignored.contains($0) }
        guard !targetNames.isEmpty else {
            throw Error.noTargets
        }
        let localRoot: String
        if let path = try configManager.combinedConfigFile().localRoot {
            localRoot = path
        } else {
            throw Error.noLocalRoot
        }
        let localRootUrl = URL(fileURLWithPath: localRoot)
        guard fileManager.directoryExists(atPath: localRoot) else {
            throw Error.localPathDoesNotExist(localRoot)
        }
        guard fileManager.directoryExists(atPath: directory) else {
            throw Error.directoryDoesNotExist(localRoot)
        }
        let directoryUrl = URL(fileURLWithPath: directory)
        let name = directoryUrl.lastPathComponent
        guard !name.isEmpty else {
            throw Error.invalidDirectory
        }
        let packageUrl = localRootUrl.appending(path: name)
        try fileManager.createDirectory(at: packageUrl, withIntermediateDirectories: false)
        let result = shell("cd \"\(packageUrl.path())\"; swift package init --type library")

        output.send(result, .verbose)

        let newPackageSourceDir = packageUrl.appending(path: "Sources").appending(path: name)

        try fileManager.removeItem(at: newPackageSourceDir)

        try fileManager.moveItem(at: directoryUrl, to: newPackageSourceDir)

        let spmFileManager = SpmFileManager(fileManager: fileManager)

        var spmfile = try spmFileManager.spmFile(in: spmfile)

        var dependencies = spmfile.dependencies ?? []

        let newDependency = JsonSpmDependency(
            id: UUID(),
            name: name
        )

        dependencies.append(newDependency)

        spmfile.dependencies = dependencies.sorted()

        let targetsByName = targetNames.reduce(into: spmfile.targets.byName) {
            guard var target = $0[$1] else {
                assertionFailure()
                // TODO: This should be an error and caught earlier
                return
            }
            let dependencies = target.dependencies + [newDependency.name]
            target.dependencies = dependencies.sorted()
            $0[$1] = target
        }
        spmfile.targets = targetsByName.values.sorted()
        try spmFileManager.save(spmfile, to: self.spmfile, isCsv: false)

        var installCommand = Install()
        installCommand.spmfile = self.spmfile
        installCommand.local = []
        installCommand.verbose = self.verbose
        installCommand.cloneToClspmDir = self.cloneToClspmDir
        installCommand.packageCacheDir = self.packageCacheDir
        try await installCommand.run(fileManager: fileManager, service: service)
    }
}
