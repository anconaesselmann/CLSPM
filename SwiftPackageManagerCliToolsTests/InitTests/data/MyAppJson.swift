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

    static func application(with dependencies: [String]) -> JsonSpmFile {
        let sorted = dependencies.sorted()
        var copy = Self.noDependencies
        for i in 0..<copy.targets.count {
            copy.targets[i].dependencies = sorted
        }
        copy.dependencies = sorted.compactMap {
            self.dependencies[$0]
        }.sorted { $0.name < $1.name }
        return copy
    }

    static var dependencies: [String: JsonSpmDependency] = [
        "LoadableView": JsonSpmDependency(
            id: UUID(uuidString: "AA39C307-0F4C-4482-916E-23D715D7BE8A")!,
            name: "LoadableView",
            url: "https://github.com/anconaesselmann/LoadableView",
            version: "0.3.9",
            localPath: nil
        ),
        "DebugSwiftUI": JsonSpmDependency(
            id: UUID(uuidString: "8918A5F9-4693-4285-A10B-D702E877E9B4")!,
            name: "DebugSwiftUI",
            url: "https://github.com/anconaesselmann/DebugSwiftUI",
            version: "0.0.1",
            localPath: nil
        )
    ]

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
