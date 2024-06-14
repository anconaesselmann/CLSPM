//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class INST_JSPM_T1_G_Tests: XCTestCase {

    var sut: Install!
    var myApp: MyApp!

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
        sut = Install().setup_testing()
        sut.verbose = true
        try myApp.moveProjectFile()
        try myApp.moveDependenciesFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    // MARK: - INST-JSPM-T1-GD1
    func testMicroSpmFileOneDependency() throws {
        let dependencyNames = ["LoadableView"]
        try myApp.moveJsonSpmFile(with: dependencyNames, globalDependencies: true)

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

    // MARK: - INST-JSPM-T1-GD2
    func testMicroSpmFileTwoDependency() throws {
        let dependencyNames = ["LoadableView", "DebugSwiftUI"]
        try myApp.moveJsonSpmFile(with: dependencyNames, globalDependencies: true)

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
}
