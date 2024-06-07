//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class I_JSPM_T1_XPROJ_DL_L_Tests: XCTestCase {

    var sut: Init!

    var fileManager: FileManager!

    override func setUpWithError() throws {
        try FileManager.test_setup(current: "MyApp")
        fileManager = FileManager.default
        Output.test_setup()
        sut = Init().setup_testing()
        sut.verbose = true
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try FileManager.test_cleanup()
    }

    // MARK: - I-JSPM-T1-XPROJ-DL-LD1
    func testSpmFileWithOneCachedDependencyExample() throws {
        try MyApp.moveProjectFile(1, local: true)
        try MyApp.moveLocalConfigFile()
        try MyApp.moveDependenciesFile()

        let dependencies = ["LoadableView"]

        try sut.run()

        try XCTAssertEqual(
            fileManager.spmFileDir,
            MyApp.application(with: dependencies, local: Set(dependencies)),
            encoder: SpmFileManager.encoder
        )
    }

    // MARK: - I-JSPM-T1-XPROJ-DL-LD2
    func testSpmFileWithTwoCachedDependencyExample() throws {
        try MyApp.moveProjectFile(2, local: true)
        try MyApp.moveLocalConfigFile()
        try MyApp.moveDependenciesFile()

        let dependencies = ["LoadableView", "DebugSwiftUI"]

        try sut.run()

        try XCTAssertEqual(
            fileManager.spmFileDir,
            MyApp.application(with: dependencies, local: Set(dependencies)),
            encoder: SpmFileManager.encoder
        )
    }
}
