//  Created by Axel Ancona Esselmann on 6/4/24.
//

import Foundation
import ArgumentParser

struct DependencyCache: ParsableCommand {

    enum Error: Swift.Error {
        case invalidDependencyNames([String])
    }

    public static let configuration = CommandConfiguration(
        abstract: ""
    )

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    var verbose: Bool = false

    @Option(
        name: .shortAndLong,
        help: "Dependencies from the current project to be cached in ~/.swiftpmm/dependencies to later be passed into init by name"
    )
    var dependencyName: [String] = []

    @Option(
        name: .shortAndLong,
        help: "The path to a custom spmfile"
    )
    var spmfile: String?

    func run() throws {
        let dependencyNames = Set(dependencyName)
        let configManager = ConfigManager()
        let spmFileManager = SpmFileManager()
        vPrint("Adding dependencies to cache at \(try configManager.dependenciesUrl())", verbose)
        let spmFile = try spmFileManager.spmFile(in: spmfile, isVerbose: verbose)
        var dependenciesFile = try configManager.dependenciesFile()
        var notUsed = dependencyNames

        let cachedDependencies: [String: JsonSpmDependency] = dependenciesFile
            .dependencies
            .reduce(into: [:]) { $0[$1.name] = $1 }

        let combined: [String: JsonSpmDependency] = spmFile.dependencies
            .reduce(into: cachedDependencies) {
                let name = $1.name
                let dependency = $1
                if dependencyNames.isEmpty || dependencyNames.contains(name) {
                    $0[name] = dependency
                    notUsed.remove(name)
                    vPrint("\tcaching \(name)", verbose)
                }
            }
        if !notUsed.isEmpty {
            throw Error.invalidDependencyNames(notUsed.sorted())
        }
        dependenciesFile.dependencies = combined.values.sorted {
            $0.name < $1.name
        }
        try configManager.save(dependenciesFile)
        vPrint("All cached dependencies:", verbose)
        if verbose {
            for dependency in dependenciesFile.dependencies {
                vPrint("\t\(dependency.name)", verbose)
            }
        }
    }
}
