//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class INIT_JSPM_T1_DEP_L_Tests: XCTestCase {

    var sut: Init!
    var myApp: MyApp!

    var fileManager: TempFileManager!

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Init().setup_testing()
        sut.verbose = true
        try myApp.moveProjectFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    // MARK: - INIT-JSPM-T1-DEP-LD0
    func testEmptySpmFileCreatedExample() throws {
        try myApp.moveLocalConfigFile()

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: []),
            encoder: SpmFileManager.encoder
        )
    }

    // MARK: - INIT-JSPM-T1-DEP-LD1
    func testSpmFileWithOneCachedDependencyExample() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveProjectFile()
        try myApp.moveDependenciesFile()

        let dependencies = ["LoadableView"]
        sut.cached = dependencies

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: dependencies),
            encoder: SpmFileManager.encoder
        )
    }

    // MARK: - INIT-JSPM-T1-DEP-LD2
    func testSpmFileWithTwoCachedDependencyExample() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveProjectFile()
        try myApp.moveDependenciesFile()

        let dependencies = ["LoadableView", "DebugSwiftUI"]
        sut.cached = dependencies

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: dependencies),
            encoder: SpmFileManager.encoder
        )
    }
}
