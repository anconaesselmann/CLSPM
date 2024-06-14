//  Created by Axel Ancona Esselmann on 6/7/24.
//

import Foundation

extension FileManagerProtocol {
    var spmFileDir: URL {
        currentDirectory
            .appending(path: "spmfile")
    }

    var dependenciesFileDir: URL {
        homeDirectoryForCurrentUser
            .appending(component: ".swiftclpm")
            .appending(path: "dependencies")
    }

    func dependencyFile() throws -> DependenciesFile? {
        guard let data = contents(at: dependenciesFileDir) else {
            return nil
        }
        print("deconding dependencyFile in tests")
        return try SpmFileManager.decoder.decode(DependenciesFile.self, from: data)
    }
}

extension DependenciesFile {
    func hasDependency(where predicate: (JsonSpmDependency) -> Bool) -> Bool {
        dependencies.first(where: predicate) != nil
    }
}
