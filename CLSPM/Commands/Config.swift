//  Created by Axel Ancona Esselmann on 6/4/24.
//

import Foundation
import ArgumentParser

struct Config: ParsableCommand {

    public static let configuration = CommandConfiguration(
        abstract: "Set preferences in the project .swiftclpm directory or the global ~/.swiftclpm directory"
    )

    @Option(
        name: .shortAndLong,
        help: "A default directory for local Swift Packages"
    )
    var localRoot: String?

    @Option(
        name: .long,
        help: "Launch browser on create with new github repo"
    )
    var setCreateGithubRepo: Bool?

    @Option(
        name: .long,
        help: "When a list-output-file is specified `list` will save to specified"
    )
    var listOutputFile: String?

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    var verbose: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Global configurations get stored in ~/.swiftclpm"
    )
    var global: Bool = false

    func run() throws {
        try self.run(fileManager: FileManager.default)
    }

    func run(fileManager: FileManagerProtocol) throws {
        let output = Output.shared
        output.verboseFlagIsSet(verbose)
        
        let manager = ConfigManager(fileManager: fileManager)
        output.send("Setting configurations", .verbose)
        if let localRoot = localRoot {
            if localRoot == "nil" {
                try manager.setLocalRoot(localRoot, global: global)
            } else {
                try manager.setLocalRoot(nil, global: global)
            }
        }
        if let setCreateGithubRepo = setCreateGithubRepo {
            output.send("Setting browser behavior after creating a local repo:", .verbose)
            output.send("Open browser: \(setCreateGithubRepo ? "yes" : "no")".indented(), .verbose)
            try manager.setCreateGithubRepo(setCreateGithubRepo, global: global)
        }
        if let outputDir = listOutputFile {
            try manager.setListOutputFile(outputDir, fileManager: fileManager)
            return
        }
    }


}
