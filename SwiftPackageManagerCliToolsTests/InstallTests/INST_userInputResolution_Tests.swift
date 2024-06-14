//  Created by Axel Ancona Esselmann on 6/13/24.
//

import XCTest

final class INST_userInputResolution_Tests: XCTestCase {
    var sut: Install!
    var myApp: MyApp!
    var input: TestInput!

    var fileManager: TempFileManager!
    var service: TestService!

    var bundle: Bundle {
        Bundle(for: Self.self)
    }

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        service = TestService()
        myApp = MyApp(fileManager)
        Output.test_setup()
        input = Input.test_setup()
        sut = Install().setup_testing()
        sut.verbose = true
        try myApp.moveProjectFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testDependencyAndVersionFromUserGetsInstalled_oneDependency() throws {
        let dependencyNames = ["LoadableView"]
        try myApp.moveCsvSpmFile(with: dependencyNames)
        let dependencies = dependencyNames.compactMap { myApp.dependencies[$0] }
        let dependency = dependencies[0]

        let inputText = try dependency.consolTextForResolution(useVersion: true)
        input.send(inputText)

        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )
            let project = try ProjectInspector(self.fileManager)

            try XCTAssertDependencies(
                .remote,
                in: project,
                dependencyNames
            )
        }
    }

    func testDependencyAndVersionFromUserGetsAddedToDependenciesFile_oneDependency() throws {
        let dependencyNames = ["LoadableView"]
        try myApp.moveCsvSpmFile(with: dependencyNames)
        let dependencies = dependencyNames.compactMap { myApp.dependencies[$0] }
        let dependency = dependencies[0]

        let inputText = try dependency.consolTextForResolution(useVersion: true)
        input.send(inputText)
        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )

            guard let dependencyFile = try self.fileManager.dependencyFile() else {
                XCTFail("Dependencies file does not exist")
                return
            }
            XCTAssertTrue(dependencyFile.hasDependency {
                $0.name == dependency.name &&
                $0.version == dependency.version
            })
        }
    }

    func testDependencyAndVersionFromUserGetsInstalled_twoDependencies() throws {
        let dependencyNames = ["LoadableView", "DebugSwiftUI"]
        try myApp.moveCsvSpmFile(with: dependencyNames)
        let dependencies = dependencyNames.compactMap { myApp.dependencies[$0] }

        let inputText = try dependencies.map {
            try $0.consolTextForResolution(useVersion: true)
        }.joined(separator: "\n")

        input.send(inputText)

        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )
            let project = try ProjectInspector(self.fileManager)

            try XCTAssertDependencies(
                .remote,
                in: project,
                dependencyNames
            )
        }
    }

    func testDependencyAndVersionFromUserGetsAddedToDependenciesFile_twoDependencies() throws {
        let dependencyNames = ["LoadableView", "DebugSwiftUI"]
        try myApp.moveCsvSpmFile(with: dependencyNames)
        let dependencies = dependencyNames.compactMap { myApp.dependencies[$0] }

        let inputText = try dependencies.map {
            try $0.consolTextForResolution(useVersion: true)
        }.joined(separator: "\n")

        input.send(inputText)
        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )

            guard let dependencyFile = try self.fileManager.dependencyFile() else {
                XCTFail("Dependencies file does not exist")
                return
            }
            for dependency in dependencyFile.dependencies {
                XCTAssertTrue(dependencyFile.hasDependency {
                    $0.name == dependency.name &&
                    $0.version == dependency.version
                })
            }
        }
    }
}
