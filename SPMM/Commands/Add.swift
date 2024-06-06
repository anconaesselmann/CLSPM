//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation
import ArgumentParser
import XProjParser

struct Add: AsyncParsableCommand {

    enum Error: Swift.Error {
        case couldNotResolveDependencyNames([String])
    }

    public static let configuration = CommandConfiguration(
        abstract: "Add a dependency to an spmfile"
    )

    @Option(
        name: .shortAndLong,
        help: "The path to a custom spmfile"
    )
    private var spmfile: String?

    @Option(
        name: .shortAndLong,
        help: "Dependency name"
    )
    var name: [String] = []

    @Option(
        name: .shortAndLong,
        help: "The target of the dependency should be added to"
    )
    var target: [String] = []

    @Flag(
        name: .shortAndLong,
        help: "Show extra logging"
    )
    private var verbose: Bool = false

    @Flag(
        name: .shortAndLong,
        help: "Does not add dependencies to the spmfile. On install dependencies are resolved from a global list of dependencies. For existing spmfiles --global-dependencies does not remove dependencies."
    )
    private var globalDependencies: Bool = false

    func run() async throws {

    }
}
