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
        case directoryDoesNotExist(URL)
        case invalidDirectory
        case missingGroupNameOrDirectory
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
    var directory: String?

    @Option(
        name: .shortAndLong,
        help: "The name of the Xcode group from which to create a Swift Package"
    )
    var group: String?

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
        output.verboseFlagIsSet(verbose)
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
        let (name, groupName, directoryUrl) = try getDirecotry(
            from: directory,
            group: group,
            in: project,
            fileManager: fileManager
        )
        let packageUrl = localRootUrl.appending(path: name)
        try fileManager.createDirectory(at: packageUrl, withIntermediateDirectories: false)

        let packagePath = packageUrl.path()
        output.send("Creating Swift Package named \(name) at", .verbose)
        output.send(packagePath.indented(), .verbose)

        let result = shell("cd \"\(packagePath)\"; swift package init --type library")

        output.send(result, .verbose)

        let newPackageSourceDir = packageUrl.appending(path: "Sources").appending(path: name)

        try fileManager.removeItem(at: newPackageSourceDir)

        output.send("Moving", .verbose)
        output.send(directoryUrl.path().indented(), .verbose)
        output.send("To", .verbose)
        output.send(newPackageSourceDir.path().indented(), .verbose)

        try fileManager.moveItem(at: directoryUrl, to: newPackageSourceDir)

        let spmFileManager = SpmFileManager(fileManager: fileManager)

        var spmfile = try spmFileManager.spmFile(in: spmfile)

        var dependencies = spmfile.dependencies ?? []

        let newDependency = JsonSpmDependency(
            id: UUID(),
            name: name,
            useLocal: true
        )

        dependencies.append(newDependency)

        spmfile.dependencies = dependencies.sorted()

        output.send("Adding \(name) dependnecy to targets in spmfile", .verbose)
        let targetsByName = targetNames.reduce(into: spmfile.targets.byName) {
            guard var target = $0[$1] else {
                assertionFailure()
                // TODO: This should be an error and caught earlier
                return
            }
            let dependencies = target.dependencies + [newDependency.name]
            target.dependencies = dependencies.sorted()
            $0[$1] = target
            output.send("Added \(name) to \(target.name)".indented(), .verbose)
        }
        spmfile.targets = targetsByName.values.sorted()

        output.send("Saving updated spmfile", .verbose)
        try spmFileManager.save(spmfile, to: self.spmfile, isCsv: false)

        output.send("Removing \"\(groupName)\" group from Xcode project", .verbose)
        try Project(fileManager: fileManager)
            .remove(group: groupName)
            .save()

        output.send("Installing from spmfile", .verbose)
        var installCommand = Install()
        installCommand.spmfile = self.spmfile
        installCommand.local = [name]
        installCommand.verbose = self.verbose
        installCommand.cloneToClspmDir = self.cloneToClspmDir
        installCommand.packageCacheDir = self.packageCacheDir
        try await installCommand.run(fileManager: fileManager, service: service)
    }

    private func getDirecotry(from directory: String?, group: String?, in project: Project, fileManager: FileManagerProtocol) throws -> (name: String, groupName: String, directoryUrl: URL) {
        let directoryUrl: URL
        let groupName: String
        if let directory = directory {
            directoryUrl = URL(fileURLWithPath: directory)
            groupName = directoryUrl.lastPathComponent
        } else if let group = group {
            groupName = group
            directoryUrl = try project.url(forGroup: group)

        } else {
            throw Error.missingGroupNameOrDirectory
        }
        guard fileManager.directoryExists(at: directoryUrl) else {
            throw Error.directoryDoesNotExist(directoryUrl)
        }
        guard !groupName.isEmpty else {
            throw Error.invalidDirectory
        }
        return (
            name: groupName.replacing(" ", with: ""),
            groupName: groupName,
            directoryUrl: directoryUrl
        )
    }
}
