//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class I_JSPM_T1_DEP_G_Tests: XCTestCase {

    var sut: Init!
    var myApp: MyApp!

    var fileManager: TempFileManager!

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Init().setup_testing()
        sut.verbose = true
        sut.globalDependencies = true
        try myApp.moveProjectFile()
        try myApp.moveLocalConfigFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    // MARK: - I-JSPM-T1-DEP-GD0
    func testEmptySpmFileCreatedExample() throws {

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: [], globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }

    // MARK: - I-JSPM-T1-DEP-GD1
    func testSpmFileWithOneCachedDependencyExample() throws {
        try myApp.moveDependenciesFile()

        let dependencies = ["LoadableView"]
        sut.cached = dependencies

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: dependencies, globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }

    // MARK: - I-JSPM-T1-DEP-DEP-GD2
    func testSpmFileWithTwoCachedDependencyExample() throws {
        try myApp.moveDependenciesFile()

        let dependencies = ["LoadableView", "DebugSwiftUI"]
        sut.cached = dependencies

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: dependencies, globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }
}
