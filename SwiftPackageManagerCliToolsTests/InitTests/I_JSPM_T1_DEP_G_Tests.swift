//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class I_JSPM_T1_DEP_G_Tests: XCTestCase {

    var sut: Init!

    var fileManager: TempFileManager!

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        FileManager.default = fileManager
        Output.test_setup()
        sut = Init().setup_testing()
        sut.verbose = true
        sut.globalDependencies = true
        try MyApp.moveProjectFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    // MARK: - I-JSPM-T1-DEP-GD0
    func testEmptySpmFileCreatedExample() throws {
        try MyApp.moveLocalConfigFile()

        try sut.run()

        try XCTAssertEqual(
            fileManager.spmFileDir,
            MyApp.application(with: [], globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }

    // MARK: - I-JSPM-T1-DEP-GD1
    func testSpmFileWithOneCachedDependencyExample() throws {
        try MyApp.moveLocalConfigFile()
        try MyApp.moveProjectFile()
        try MyApp.moveDependenciesFile()

        let dependencies = ["LoadableView"]
        sut.cached = dependencies

        try sut.run()

        try XCTAssertEqual(
            fileManager.spmFileDir,
            MyApp.application(with: dependencies, globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }

    // MARK: - I-JSPM-T1-DEP-DEP-GD2
    func testSpmFileWithTwoCachedDependencyExample() throws {
        try MyApp.moveLocalConfigFile()
        try MyApp.moveProjectFile()
        try MyApp.moveDependenciesFile()

        let dependencies = ["LoadableView", "DebugSwiftUI"]
        sut.cached = dependencies

        try sut.run()

        try XCTAssertEqual(
            fileManager.spmFileDir,
            MyApp.application(with: dependencies, globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }
}
