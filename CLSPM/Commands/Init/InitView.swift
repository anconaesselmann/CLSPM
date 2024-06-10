//  Created by Axel Ancona Esselmann on 6/9/24.
//

import Foundation

struct InitView {
    private let output: Output
    let verbose: Bool

    init(output: Output = Output.shared, verbose: Bool) {
        self.output = output
        output.verboseFlagIsSet(verbose)
        self.verbose = verbose
    }

    func targetsNotUpdated( _ jsonSpmFile: JsonSpmFile) {
        if !jsonSpmFile.targets.isEmpty {
            output.send("The following targets have not been updated:", .verbose)
            if verbose {
                output.send("\t\(jsonSpmFile.targets.map { $0.name }.joined(separator: ", "))", .verbose)
            }
            output.send("To reinitialize all targets pass the -f flag", .verbose)
        }
    }

    func ignoredTargets(_ ignored: Set<String>) {
        output.send("Ignoring targets:", .verbose)
        output.send("\t\(ignored.sorted().joined(separator: ", "))", .verbose)
    }

    func dependenciesToResolve(_ cached: Set<String>) {
        output.send("Resolving dependencies \(cached.sorted().joined(separator: ", "))", .verbose)
    }

    func dependenciesForTarget(_ dependenciesFound: [String: [(name: String, passedIn: Bool)]] ) {
        let targets = dependenciesFound.keys.sorted()
        for targetName in targets {
            output.send("Dependencies for target \(targetName):", .verbose)
            let dependencies = dependenciesFound[targetName] ?? []
            guard !dependencies.isEmpty else {
                output.send("\tnone", .verbose)
                continue
            }
            for dependency in dependencies {
                if dependency.passedIn {
                    output.send("\tOverwriting dependency \(dependency.name) from cache in \(targetName)", .verbose)
                } else {
                    output.send("\tUsing cached dependency \(dependency.name) in \(targetName)", .verbose)
                }
            }
        }
    }

    func dependenciesAcrossAllTargets(_ dependencies: [JsonSpmDependency]) {
        output.send("Dependencies across all targets:", .verbose)
        if dependencies.isEmpty {
            output.send("\tnone", .verbose)
        } else {
            for dependency in dependencies {
                output.send("\t\(dependency.name)", .verbose)
            }
        }
    }

    func showError(_ error: Error) {
        // TODO
    }
}
