//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation
import ArgumentParser

struct SPMM: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A command-line tool for managing Xcode project dependencies",
        subcommands: [
            Install.self,
            Init.self,
            Config.self
        ]
    )

    init() { }

//    func run() throws {
//        var config = Config()
//        config.localRoot = "../AxelPods"
//        config.global = true
//        config.verbose = true
//        try config.run()
//    }
}

SPMM.main()
