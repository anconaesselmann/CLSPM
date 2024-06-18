//  Created by Axel Ancona Esselmann on 6/14/24.
//

import Foundation
import ArgumentParser
import XProjParser

struct List: AsyncParsableCommand {

    enum Error: Swift.Error {
        case invalidTargetNames([String])
        case noTargets
    }

    public static let configuration = CommandConfiguration(
        abstract: "List dependencies in an Xcode project"
    )

    @Flag(
        name: .shortAndLong,
        help: "Creates an spmfile that includes the project's test-targets"
    )
    var testTargets: Bool = false

    @Option(
        name: .shortAndLong,
        parsing: .upToNextOption,
        help: "The target for which dependencies are listed"
    )
    var target: [String] = []

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    private var verbose: Bool = false

    func run() throws {
        try self.run(fileManager: FileManager.default)
    }

    func run(fileManager: FileManagerProtocol) throws {
        let output = Output.shared
        let project = try Project(fileManager: fileManager)
        let root = try project.root()
        var targetDependencies = try project.dependencies(in: root, verbose: verbose)
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
        let dependencyIndent = targetNames.count > 1 ? 1 : 0
        for target in targetNames {
            if targetNames.count > 1 {
                output.send("Target: \(target)", .normal)
            }
            guard let dependencies = targetDependencies[target] else {
                continue
            }
            if dependencies.isEmpty {
                output.send("No dependencies".indented(dependencyIndent), .normal)
            }
            for dependency in dependencies {
                output.send(dependency.name.indented(dependencyIndent), .normal)
            }
            output.send("")
        }
    }
}
