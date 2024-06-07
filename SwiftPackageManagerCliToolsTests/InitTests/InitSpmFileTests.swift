//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InitSpmFileTests: XCTestCase {

    var sut: Init!

    var fileManager: FileManager!

    override func setUpWithError() throws {
        try FileManager.test_setup(current: "MyApp")
        fileManager = FileManager.default
        Output.test_setup()
        sut = Init().setup_testing()
        sut.verbose = true
        try MyApp.moveProjectFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try FileManager.test_cleanup()
    }

    func testEmptySpmFileCreatedExample() throws {
        try MyApp.moveLocalConfigFile()

        try sut.run()

        try XCTAssertEqual(
            fileManager.spmFileDir,
            MyApp.noDependencies,
            encoder: SpmFileManager.encoder
        )
    }

    func testSpmFileWithOneCachedDependencyExample() throws {
        try MyApp.moveLocalConfigFile()
        try MyApp.moveProjectFile()
        try MyApp.moveDependenciesFile()

        let dependencies = ["LoadableView"]
        sut.cached = dependencies

        try sut.run()

        try XCTAssertEqual(
            fileManager.spmFileDir,
            MyApp.application(with: ["LoadableView"]),
            encoder: SpmFileManager.encoder
        )
    }

    func testSpmFileWithTwoCachedDependencyExample() throws {
        try MyApp.moveLocalConfigFile()
        try MyApp.moveProjectFile()
        try MyApp.moveDependenciesFile()

        let dependencies = ["LoadableView", "DebugSwiftUI"]
        sut.cached = dependencies

        try sut.run()

        try XCTAssertEqual(
            fileManager.spmFileDir,
            MyApp.application(with: dependencies),
            encoder: SpmFileManager.encoder
        )
    }
}
