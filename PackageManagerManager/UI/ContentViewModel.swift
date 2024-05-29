//  Created by Axel Ancona Esselmann on 5/20/24.
//

import Foundation
import XProjParser

class ContentViewModel: ObservableObject {
    private let targetManager = AppState.shared.targetManager

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

    func multipProject() throws {
        let mock = multiTargetMockProject
        let removed = try removePackagesFromMultiTargetProject(content: mock)
        print(removed)
        let added = try addPackagesToMultiTargetProject(content: removed)
        print(added)
    }

    func removePackagesFromMultiTargetProject(content: String) throws -> String {
        try XProjParser()
            .parse(content: content)
            .root()
            .removeRemotePackages(
                in: content,
                (packageName: "LoadableView", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "LoadingManager", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "ToolbarManager", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "FileUrlExtensions", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "ID3TagEditor", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "CoreDataStored", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "AppRoving", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "WindowManager", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "UserPreferences", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "FirebaseAnalytics", relativePath: nil, targetName: "\"Audiosaic Desktop\""),
                (packageName: "FirebaseCrashlytics", relativePath: nil, targetName: "\"Audiosaic Desktop\""),

                (packageName: "KeyPressEventManager", relativePath: "../AxelPods/KeyPressEventManager", targetName: "\"Audiosaic Desktop\""),
                (packageName: "ProgrammaticCoreData", relativePath: "../AxelPods/ProgrammaticCoreData", targetName: "\"Audiosaic Desktop\""),
                (packageName: "SwiftUISettings", relativePath: "../AxelPods/SwiftUISettings", targetName: "\"Audiosaic Desktop\""),
                (packageName: "NestedTable", relativePath: "../AxelPods/NestedTable", targetName: "\"Audiosaic Desktop\""),

                
                (packageName: "LoadableView", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "LoadingManager", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "ToolbarManager", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "FileUrlExtensions", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "ID3TagEditor", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "CoreDataStored", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "AppRoving", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "WindowManager", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "UserPreferences", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "FirebaseAnalytics", relativePath: nil, targetName: "Audiosaic"),
                (packageName: "FirebaseCrashlytics", relativePath: nil, targetName: "Audiosaic"),

                (packageName: "KeyPressEventManager", relativePath: "../AxelPods/KeyPressEventManager", targetName: "Audiosaic"),
                (packageName: "ProgrammaticCoreData", relativePath: "../AxelPods/ProgrammaticCoreData", targetName: "Audiosaic"),
                (packageName: "SwiftUISettings", relativePath: "../AxelPods/SwiftUISettings", targetName: "Audiosaic"),
                (packageName: "NestedTable", relativePath: "../AxelPods/NestedTable", targetName: "Audiosaic")
            )
    }

    func addPackagesToMultiTargetProject(content: String) throws -> String {
        try XProjParser()
            .parse(content: content)
            .root()
            .addRemotePackages(
                in: content,
                (
                    packageName: "LoadableView",
                    url: "https://github.com/anconaesselmann/LoadableView/",
                    version: "0.3.9",
                    targetName: "\"Audiosaic Desktop\""
                ),
                (
                    packageName: "LoadableView",
                    url: "https://github.com/anconaesselmann/LoadableView/",
                    version: "0.3.9",
                    targetName: "Audiosaic"
                ),
                (
                    packageName: "CoreDataStored",
                    url: "https://github.com/anconaesselmann/CoreDataStored/",
                    version: "0.0.7",
                    targetName: "\"Audiosaic Desktop\""
                ),
                (
                    packageName: "CoreDataStored",
                    url: "https://github.com/anconaesselmann/CoreDataStored/",
                    version: "0.0.7",
                    targetName: "Audiosaic"
                ),
                (
                    packageName: "ProgrammaticCoreData",
                    url: "https://github.com/anconaesselmann/ProgrammaticCoreData/",
                    version: "0.0.4",
                    targetName: "\"Audiosaic Desktop\""
                ),
                (
                    packageName: "ProgrammaticCoreData",
                    url: "https://github.com/anconaesselmann/ProgrammaticCoreData/",
                    version: "0.0.4",
                    targetName: "Audiosaic"
                )
            )
    }

    func doSomething() throws {
//        try addAndRemoveTest22()
        try multipProject()
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
