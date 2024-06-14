//  Created by Axel Ancona Esselmann on 6/7/24.
//

import Foundation

extension FileManagerProtocol {
    var spmFileDir: URL {
        currentDirectory
            .appending(path: "spmfile")
    }

    var dependenciesFileDir: URL {
        swiftclpmDir(global: true)
            .appending(path: "dependencies")
    }

    func dependencyFile() throws -> DependenciesFile? {
        guard let data = contents(at: dependenciesFileDir) else {
            return nil
        }
        return try SpmFileManager.decoder.decode(DependenciesFile.self, from: data)
    }

    func swiftclpmDir(global: Bool) -> URL {
        let root = global ? homeDirectoryForCurrentUser : currentDirectory
        return root.appending(path: ".swiftclpm")
    }

    func configFileUrl(global: Bool) -> URL {
        swiftclpmDir(global: global)
            .appending(path: "config")
    }

    func configFile(global: Bool) throws -> ConfigFile? {
        guard let data = contents(at: configFileUrl(global: global)) else {
            return nil
        }
        return try SpmFileManager.decoder.decode(ConfigFile.self, from: data)
    }
}

extension DependenciesFile {
    func hasDependency(where predicate: (JsonSpmDependency) -> Bool) -> Bool {
        dependencies.first(where: predicate) != nil
    }
}
