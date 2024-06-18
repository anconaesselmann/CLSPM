//  Created by Axel Ancona Esselmann on 5/30/24.
//

import Foundation
import ArgumentParser

@main
struct CLSPM: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A command-line tool for managing Xcode project dependencies",
        subcommands: [
            Install.self,
            Init.self,
            Config.self,
            DependencyCache.self,
//            Add.self,
            Reset.self,
            List.self,
            Create.self
        ]
    )

    init() { }
}
