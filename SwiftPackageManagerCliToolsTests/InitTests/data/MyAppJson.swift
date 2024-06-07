//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation

class MyApp {

    private static var bundle: Bundle { Bundle(for: MyApp.self) }

    static var fileManager = FileManager.default

    static let noDependencies = JsonSpmFile(
        targets: [
            JsonSpmTarget(
                id: UUID(uuidString: "9D6FC795-45A9-457C-919F-D8CE20A9DFDA")!,
                name: "MyApp",
                dependencies: []
            )
        ],
        dependencies: []
    )

    static func moveProjectFile() throws {
        try fileManager.copy(
            from: bundle, "MyAppProject.test",
            to: "MyApp.xcodeproj/project.pbxproj"
        )
    }

    static func moveDependenciesFile() throws {
        try fileManager.copy(
            from: bundle, "dependencies.test",
            to: ".swiftpmm/dependencies",
            in: .home
        )
    }

    static func moveLocalConfigFile() throws {
        try fileManager.copy(
            from: bundle, "config.test",
            to: ".swiftpmm/config",
            in: .current
        )
    }
}

extension FileManager {
    var spmFileDir: URL {
        currentDirectory
            .appending(path: "spmfile")
    }
}
