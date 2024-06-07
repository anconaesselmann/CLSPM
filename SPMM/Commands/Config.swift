//  Created by Axel Ancona Esselmann on 6/4/24.
//

import Foundation
import ArgumentParser

struct Config: ParsableCommand {

    public static let configuration = CommandConfiguration(
        abstract: ""
    )

    @Option(
        name: .shortAndLong,
        help: ""
    )
    var localRoot: String?

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    var verbose: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Global configurations get stored in ~/.swiftpmm"
    )
    var global: Bool = false

    func run() throws {
        let output = Output.shared
        output.verboseFlagIsSet(verbose)
        
        let manager = ConfigManager()
        output.send("Setting configurations", .verbose)
        try manager.setLocalRoot(localRoot, global: global)
    }
}