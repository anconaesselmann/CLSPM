//  Created by Axel Ancona Esselmann on 6/14/24.
//

import Foundation
import ArgumentParser
import XProjParser

struct List: AsyncParsableCommand {

    enum Error: Swift.Error {
        case invalidTargetNames([String])
        case noTargets
        case noOutput
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
    var verbose: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Output to console even when an output file is specified"
    )
    var console: Bool = false

    func run() async throws {
        try await self.run(fileManager: FileManager.default)
    }

    func run(fileManager: FileManagerProtocol) async throws {
        let service: ServiceProtocol = Service()
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
        if
            let config = try configManager.listConfig(),
            let outputFile = config.output,
            let outputUrl = outputFile.path
        {
            try fileManager.createFileIfNotAFile(outputUrl)
            switch outputFile.format {
            case .simplePlainText:
                try simplePlainTextOutput(targetNames, targetDependencies, file: outputUrl, console: console)
            case .githubMD:
                try await githubMDOutput(
                    targetNames,
                    targetDependencies,
                    service: service,
                    file: outputUrl,
                    console: console
                )
            }
        } else {
            consoleSimpleOutput(targetNames, targetDependencies)
        }
    }

    private func simplePlainTextOutput(_ targetNames: [String], _ targetDependencies: [String : [JsonSpmDependency]], file: URL, console: Bool) throws {
        let output = TextOutput()
        let dependencyIndent = targetNames.count > 1 ? 1 : 0
        for target in targetNames {
            if targetNames.count > 1 {
                output.send("Target: \(target)")
            }
            guard let dependencies = targetDependencies[target] else {
                continue
            }
            if dependencies.isEmpty {
                output.send("No dependencies".indented(dependencyIndent))
            }
            for dependency in dependencies {
                output.send(dependency.name.indented(dependencyIndent))
            }
        }
        if console {
            Output.shared.send(output.output)
        } else {
            guard let data = output.output.data(using: .utf8) else {
                throw Error.noOutput
            }

            try data.write(to: file)
        }
    }

    private func githubMDOutput(
        _ targetNames: [String],
        _ targetDependencies: [String : [JsonSpmDependency]],
        service: ServiceProtocol,
        file: URL,
        console: Bool
    ) async throws {
        let output = TextOutput()
        for target in targetNames {
            if targetNames.count > 1 {
                output.send("Target: \(target)")
            }
            guard let dependencies = targetDependencies[target] else {
                continue
            }
            var document = McDocument()
            for dependency in dependencies {
                guard
                    let urlString = dependency.url,
                    let url = URL(string: urlString)
                else {
                    continue
                }
                let repoInfo = try await service.fetchRepoInfo(repoUrl: url)
                guard repoInfo.visibility == .public else {
                    continue
                }
                document.append(repoInfo.name, .header(2))
                if let description = repoInfo.description {
                    document.append(description)
                }
            }
            if let attributionLink = URL(string: "https://github.com/anconaesselmann/CLSPM") {
                document.append("Generated with \("clspm".l(attributionLink)))")
            }
            output.send(document.content)
        }
        if console {
            Output.shared.send(output.output)
        } else {
            guard let data = output.output.data(using: .utf8) else {
                throw Error.noOutput
            }
            try data.write(to: file)
        }
    }

    private func consoleSimpleOutput(_ targetNames: [String], _ targetDependencies: [String : [JsonSpmDependency]]) {
        let output = Output.shared
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
