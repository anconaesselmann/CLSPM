//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation
import ArgumentParser

struct SPMM: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A command-line tool for managing Xcode project dependencies",
        subcommands: [
            Install.self,
            Init.self
        ]
    )

    init() { }
}

enum Error: Swift.Error {
    case couldNotOpenFile(String)
    case couldNotReadFile(String)
    case invalidSpmFile
    case invalidProjectFileDir
}

SPMM.main()
