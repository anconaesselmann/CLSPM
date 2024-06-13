//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

struct InstallView {
    private let output: Output
    let verbose: Bool

    init(output: Output = Output.shared, verbose: Bool) {
        self.output = output
        output.verboseFlagIsSet(verbose)
        self.verbose = verbose
    }

    func installingPackages() {
        output.send("Installing packages from spmfile", .verbose)
    }

    func packagesWithoutLocalPaths(_ packagesNeedingToResolveLocalPath: [String]) {
        output.send("The following packages do not have a local path:")
        for packageName in packagesNeedingToResolveLocalPath {
            output.send(packageName.indented())
        }
    }

    func getPath() throws -> String {
        output.send("Enter a common local path:")
        guard let path = readLine() else {
            throw InstallError.invalidUserInput
        }
        return path
    }

    func getYesNo(_ prompt: String) -> Bool {
        output.send(prompt)
        let response = readLine() ?? "n"
        return Bool(extendedMeaningString: response)
    }

    func packageSources(_ targets: [String : Target]) {
        let targetNames = targets.keys.sorted()
        for targetName in targetNames {
            output.send("Target \(targetName):", .verbose)
            let dependencies = targets[targetName]?.dependencies
                .sorted() ?? []
            if dependencies.isEmpty {
                output.send("no local dependencies".indented(), .verbose)
            } else {
                for dependency in dependencies {
                    let useLocal = dependency.useLocal ?? false
                    let sourceString = useLocal ? "local" : "remote"
                    output.send("\(dependency.name) - \(sourceString)".indented(), .verbose)
                    if useLocal {
                        if let localPath = dependency.localPath {
                            output.send("Local path: \(localPath)".indented(2), .verbose)
                        }
                    } else {
                        if let url = dependency.url {
                            output.send("Repository: \(url)".indented(2), .verbose)
                        }
                        if let version = dependency.version {
                            output.send("Version: \(version)".indented(2), .verbose)
                        }
                    }
                }
            }
        }
    }
}
