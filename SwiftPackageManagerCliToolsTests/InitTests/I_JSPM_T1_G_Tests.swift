//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class I_JSPM_T1_G_Tests: XCTestCase {

    var sut: Init!

    var fileManager: FileManager!

    override func setUpWithError() throws {
        try FileManager.test_setup(current: "MyApp")
        fileManager = FileManager.default
        Output.test_setup()
        sut = Init().setup_testing()
        sut.verbose = true
        sut.globalDependencies = true
        try MyApp.moveProjectFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try FileManager.test_cleanup()
    }

    // MARK: - I-JSPM-T1-GD0
    func testEmptySpmFileCreatedExample() throws {
        try MyApp.moveLocalConfigFile()

        try sut.run()

        try XCTAssertEqual(
            fileManager.spmFileDir,
            MyApp.application(with: [], globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }

    // MARK: - I-JSPM-T1-GD1
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

    // MARK: - I-JSPM-T1-GD2
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
