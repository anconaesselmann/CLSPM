//  Created by Axel Ancona Esselmann on 5/31/24.
//

import Foundation
import XProjParser

struct Project {

    enum Error: Swift.Error {
        case invalidProjectDir
        case couldNotOpenFile(String)
        case couldNotReadFile(String)
    }

    var content: String

    init() throws {
        content = try Self.projectContent()
    }

    func removed(_ remove: [(packageName: String, relativePath: String?, targetName: String)]) throws -> Self {
        var copy = self
        copy.content = try root()
            .removePackages(in: copy.content, remove)
        return copy
    }

    func added(_ add: [(dependency: XProjDependency, isLocal: Bool, targetName: String)]) throws -> Self {
        var copy = self
        copy.content = try root()
            .addPackages(in: copy.content, add)
        return copy
    }

    @discardableResult
    func save() throws -> Self {
        let projectFileDir = try Self.projectFileDir()
        let url = URL(fileURLWithPath: projectFileDir)
        try content.write(to: url, atomically: true, encoding: .utf8)
        return self
    }

    @discardableResult
    func reloadPackages() -> Self {
        let result = shell("xcodebuild -resolvePackageDependencies")
        print(result)
        return self
    }

    private func root() throws -> XProjRoot {
        try XProjParser()
            .parse(content: content)
            .root()
    }

    private static func projectContent() throws -> String {
        let dir = try projectFileDir()
        guard let data = FileManager.default.contents(atPath: dir) else {
            throw Error.couldNotOpenFile(dir)
        }
        guard let content = String(data: data, encoding: .utf8) else {
            throw Error.couldNotReadFile(dir)
        }
        return content
    }

    private static func projectFileDir() throws -> String {
        let currentPath = FileManager.default.currentDirectoryPath
        guard let projectName = currentPath.split(separator: "/").last else {
            throw Error.invalidProjectDir
        }
        return "\(currentPath)/\(projectName).xcodeproj/project.pbxproj"
    }
}
