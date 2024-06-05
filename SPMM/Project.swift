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

    func removed(
        _ remove: [(packageName: String, relativePath: String?, targetName: String)]
        , verbose: Bool
    ) throws -> Self {
        var copy = self
        if verbose {
            print("Removing:")
            let targets: [String: [String]] = remove.reduce(into: [:]) {
                $0[$1.targetName] = ($0[$1.targetName] ?? []) + [$1.packageName]
            }
            for (targetName, dependencies) in targets.sorted(by: { $0.key < $1.key }) {
                print("\(targetName): \(dependencies.joined(separator: ","))")
            }
        }
        copy.content = try root()
            .removePackages(in: copy.content, remove)
        print("Packages removed")
        return copy
    }

    func added(
        _ add: [(dependency: XProjDependency, isLocal: Bool, targetName: String)],
        verbose: Bool
    ) throws -> Self {
        var copy = self
        let localRoot = try ConfigManager()
            .combinedConfigFile()
            .localRoot
        if verbose {
            print("Adding:")
            let targets: [String: [String]] = add.reduce(into: [:]) {
                $0[$1.targetName] = ($0[$1.targetName] ?? []) + [$1.dependency.name]
            }
            for (targetName, dependencies) in targets.sorted(by: { $0.key < $1.key }) {
                print("\(targetName): \(dependencies.joined(separator: ","))")
            }
        }
        var add = add
        if let localRoot = localRoot {
            for index in 0..<add.count {
                let element = add[index]
                if element.isLocal, !element.dependency.hasLocalPath {
                    add[index].dependency = add[index].dependency.withLocalRoot(localRoot)
                }
            }
        }
        copy.content = try root()
            .addPackages(in: copy.content, add)
        print("Packages added")
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
    func reloadPackages(_ location: PackageLocation) throws -> Self {
        let manager = ConfigManager()
        let clonedSourcePacagesOption: String
        switch location {
        case .defaultLocation:
            clonedSourcePacagesOption = ""
        case .spmmDerivedData:
            let packagesPath = try manager.packagesDir()
            clonedSourcePacagesOption = " -clonedSourcePackagesDirPath .swiftpmm/DerivedData/packages"
        case .custom(let location):
            clonedSourcePacagesOption = " -clonedSourcePackagesDirPath \(location)"
        }
        let result = shell("xcodebuild -resolvePackageDependencies\(clonedSourcePacagesOption)")
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
            let combined: [String: (name: String, url: String?, version: String?, local: String?)] = try dependencies.reduce(into: [:]) {
                let name = try $1.string(for: "productName")
                var url: String?
                var version: String?
                var localPath: String?
                let previous = $0[name]
                if let packageId = try? $1.id(for: "package"), let package = remotePackages[packageId] {
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
                    let path = try? localPackage
                        .string(for: "relativePath")
                {
                    localPath = path
                }
                $0[name] = (
                    name: name,
                    url: url ?? previous?.url,
                    version: version ?? previous?.version,
                    local: localPath ?? previous?.local
                )
            }
            $0[targetName] = combined.values.sorted {
                $0.name < $1.name
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
