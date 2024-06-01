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

    func targets(in root: XProjRoot? = nil) throws -> [(id: XProjId, name: String)] {
        let root = try (root ?? (try self.root()))
        return try root.elements(withIsa: .PBXNativeTarget).map { object in
            (
                id: XProjId(stringValue: object.key),
                name: try object.string(for: "name")
            )
        }
    }

    func dependencies(in root: XProjRoot? = nil, verbose: Bool) throws -> [String: [(name: String, url: String?, version: String?, local: String?)]] {
        let root = try (root ?? (try self.root()))
        let targets = root.elements(withIsa: .PBXNativeTarget)
        let targetNames: [XProjId: String] = try targets.reduce(into: [:]) {
            $0[XProjId(stringValue: $1.key)] = String(try $1.stringValue(for: "name"))
        }
        vPrint("Targets found: \(targetNames.values.sorted().joined(separator: ", "))", verbose)
        let dependencies: [XProjId: XProjObject] = root.elements(withIsa: .XCSwiftPackageProductDependency)
            .reduce(into: [:]) {
                $0[XProjId(stringValue: $1.key)] = $1
            }
        let targetPackageIds: [XProjId: [XProjId]] = targets.reduce(into: [:]) {
            $0[XProjId(stringValue: $1.key)] = (try? $1.array(for: "packageProductDependencies"))?.ids ?? []
        }
        let targetPackages: [XProjId: [XProjObject]] = targetPackageIds.reduce(into: [:]) {
            $0[$1.key] = $1.value.compactMap { packageId in
                dependencies[packageId]
            }
        }

        let remotePackages: [XProjId: XProjObject] = root
            .elements(withIsa: .XCRemoteSwiftPackageReference)
            .reduce(into: [:]) {
                $0[XProjId(stringValue: $1.key)] = $1
            }


        let localPackages: [String: XProjObject] = try root
            .elements(withIsa: .XCLocalSwiftPackageReference)
            .reduce(into: [:]) {
                let relativePath = try $1.string(for: "relativePath")
                guard let name = relativePath.split(separator: "/").last, !name.isEmpty else {
                    assertionFailure()
                    return
                }
                $0[String(name)] = $1
            }

        let packages: [String: [(name: String, url: String?, version: String?, local: String?)]]  = try targetPackages.reduce(into: [:]) {
            let targetId = $1.key
            let dependencies = $1.value
            guard let targetName = targetNames[targetId] else {
                return
            }
            $0[targetName] = try dependencies.compactMap {
                let name = try $0.string(for: "productName")
                var url: String?
                var version: String?
                var localPath: String?
                if let packageId = try? $0.id(for: "package"), let package = remotePackages[packageId] {
                    if let packageUrl = try? package.string(for: "repositoryURL") {
                        url = String(packageUrl[packageUrl.index(after: packageUrl.startIndex)..<packageUrl.index(before: packageUrl.endIndex)])
                    }
                    if
                        let requirement = package.object(for: "requirement"),
                        let minimumVersion = try? requirement.string(for: "minimumVersion")
                    {
                        version = minimumVersion
                    }
                }
                if
                    let localPackage = localPackages[name], 
                    let path = try? localPackage.string(for: "relativePath")
                {
                    localPath = path
                }
                return (
                    name: name,
                    url: url,
                    version: version,
                    local: localPath
                )
            }
        }
        return packages
    }

    func root() throws -> XProjRoot {
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
