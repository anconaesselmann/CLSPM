//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation

class MyApp {

    enum Error: Swift.Error {
        case invalidFileData
    }

    private let fileManager: TempFileManager

    init(_ fileManager: TempFileManager) {
        self.fileManager = fileManager
    }

    private var bundle: Bundle { Bundle(for: MyApp.self) }

    private func noDependencies() -> JsonSpmFile {
        JsonSpmFile(
            targets: [
                JsonSpmTarget(
                    id: UUID(uuidString: "9D6FC795-45A9-457C-919F-D8CE20A9DFDA")!,
                    name: "MyApp",
                    dependencies: []
                )
            ],
            dependencies: []
        )
    }

    func application(with dependencies: [String], globalDependencies: Bool = false, local: Set<String> = []) -> JsonSpmFile {
        let sorted = dependencies.sorted()
        var copy = noDependencies()
        for i in 0..<copy.targets.count {
            copy.targets[i].dependencies = sorted
        }
        if globalDependencies {
            copy.dependencies = nil
        } else {
            copy.dependencies = sorted.compactMap {
                guard var dependency = self.dependencies[$0] else {
                    return nil
                }
                if local.contains(dependency.name) {
                    dependency.useLocal = true
                    dependency.url = nil
                    dependency.version = nil
                } else {
                    dependency.localPath = nil
                }
                return dependency
            }.sorted { $0.name < $1.name }
        }
        return copy
    }

    var dependencies: [String: JsonSpmDependency] = [
        "LoadableView": JsonSpmDependency(
            id: UUID(uuidString: "AA39C307-0F4C-4482-916E-23D715D7BE8A")!,
            name: "LoadableView",
            url: "https://github.com/anconaesselmann/LoadableView",
            version: "0.3.9",
            localPath: "../Dependencies/LoadableView"
        ),
        "DebugSwiftUI": JsonSpmDependency(
            id: UUID(uuidString: "8918A5F9-4693-4285-A10B-D702E877E9B4")!,
            name: "DebugSwiftUI",
            url: "https://github.com/anconaesselmann/DebugSwiftUI",
            version: "0.0.1",
            localPath: "../Dependencies/DebugSwiftUI"
        )
    ]

    func moveProjectFile(_ dependencyCount: Int = 0, local: Bool = false) throws {
        try fileManager.copy(
            from: bundle, "MyAppProject_d\(dependencyCount)\(local ? "_l" : "").test",
            to: "MyApp.xcodeproj/project.pbxproj"
        )
    }

    func moveDependenciesFile() throws {
        try fileManager.copy(
            from: bundle, "dependencies.test",
            to: ".swiftclpm/dependencies",
            in: .home
        )
    }

    func moveLocalConfigFile() throws {
        try fileManager.copy(
            from: bundle, "config.test",
            to: ".swiftclpm/config",
            in: .current
        )
    }

    func moveCsvSpmFile(with dependencies: [String]) throws {
        try fileManager.copy(
            dependencies.sorted().joined(separator: ", "),
            to: "spmfile",
            in: .current
        )
    }

    func moveJsonSpmFile(with dependencies: [String], globalDependencies: Bool = false, local: Set<String> = []) throws {
        let jsonSpm = application(with: dependencies, globalDependencies: globalDependencies, local: local)
        let data = try SpmFileManager.encoder.encode(jsonSpm)
        guard let content = String(data: data, encoding: .utf8) else {
            throw Error.invalidFileData
        }
        try fileManager.copy(
            content,
            to: "spmfile",
            in: .current
        )
    }
}
