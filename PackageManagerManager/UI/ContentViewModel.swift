//  Created by Axel Ancona Esselmann on 5/20/24.
//

import Foundation
import XProjParser

class ContentViewModel: ObservableObject {
    private let targetManager = AppState.shared.targetManager

    @Published
    var project: XProjProject?

    func addPackagesToTest22(content: String) throws -> String {
        try XProjParser()
            .parse(content: content)
            .root()
            .addRemotePackages(
                in: content,
                (
                    packageName: "LoadableView",
                    url: "https://github.com/anconaesselmann/LoadableView/",
                    version: "0.3.9",
                    targetName: "test22"
                ),
                (
                    packageName: "CoreDataStored",
                    url: "https://github.com/anconaesselmann/CoreDataStored/",
                    version: "0.0.7",
                    targetName: "test22"
                ),
                (
                    packageName: "ProgrammaticCoreData",
                    url: "https://github.com/anconaesselmann/ProgrammaticCoreData/",
                    version: "0.0.4",
                    targetName: "test22"
                )
            )
    }

    func removePackagesFromTest22(content: String) throws -> String {
        try XProjParser()
            .parse(content: content)
            .root()
            .removeRemotePackages(
                in: content,
                (packageName: "LoadableView", relativePath: nil, targetName: "test22"),
                (packageName: "CoreDataStored", relativePath: nil, targetName: "test22"),
                (packageName: "ProgrammaticCoreData", relativePath: nil, targetName: "test22")
            )
    }

    func addAndRemoveTest22() throws {
        let mock = mockProject
        let added = try addPackagesToTest22(content: mock)
        print(added)
        let removed = try removePackagesFromTest22(content: added)
        print(removed)
        print(mock == removed)
    }

    func doSomething() throws {
        try addAndRemoveTest22()
    }

    func update() {
        do {
            try doSomething()
        } catch {
            print(error)
        }
    }

    func loadProject() {
//        project = try? XProjProject(content: mockProject)
    }
}
