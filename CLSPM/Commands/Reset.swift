//  Created by Axel Ancona Esselmann on 6/11/24.
//

import Foundation
import ArgumentParser

struct Reset: ParsableCommand {

    enum Error: Swift.Error {
        case nothingToReset
    }

    public static let configuration = CommandConfiguration(
        abstract: "Deletes configurations"
    )

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    var verbose: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Command will affect the global config file stored in ~/.swiftclpm"
    )
    var global: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Command will affect the local config file stored in .swiftclpm"
    )
    var local: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Deletes the config file"
    )
    var config: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Deletes the dependencies file"
    )
    var dependencies: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Deletes spmfile"
    )
    var spmfile: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Deletes all files and directories"
    )
    var all: Bool = false

    func run() throws {
        try self.run(fileManager: FileManager.default)
    }

    func run(fileManager: FileManagerProtocol) throws {
        let output = Output.shared
        output.verboseFlagIsSet(verbose)

        let manager = ConfigManager(fileManager: fileManager)
        let spmManager = SpmFileManager(fileManager: fileManager)

        let deleteConfig = config || all
        let deleteDependencies = dependencies || all
        let deleteSpmfile = spmfile || all
        let deleteDirectory = all

        let somethingGetsDeleted = deleteConfig || deleteDependencies || deleteSpmfile
        guard somethingGetsDeleted else {
            throw Error.nothingToReset
        }

        let deleteLocal = local || !global
        let deleteGlobal = global

        if deleteConfig {
            if deleteLocal {
                try manager.deleteConfig(global: false)
            }
            if deleteGlobal {
                try manager.deleteConfig(global: true)
            }
        }
        if deleteDependencies {
            if deleteGlobal {
                try manager.deleteDependencies()
            }
        }
        if deleteDirectory {
            if deleteLocal {
                try manager.deleteDirectory(global: false)
            }
            if deleteGlobal {
                try manager.deleteDirectory(global: true)
            }
        }
        if deleteSpmfile {
            if deleteLocal {
                try spmManager.removeSpmFile()
            }
        }
    }
}
