//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class INIT_JSONC_OPT_T1_Tests: XCTestCase {

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
        try myApp.moveProjectFile("d\(0)")
        try myApp.moveLocalConfigFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func test_INIT_JSONC_T1_D0() throws {

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: [], globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }

    func test_INIT_JSONC_OPT_T1_R1() throws {
        try myApp.moveDependenciesFile()

        let dependencies = ["LoadableView"]
        sut.dependency = dependencies

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: dependencies, globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }

    func test_INIT_JSONC_OPT_T1_R2() throws {
        try myApp.moveDependenciesFile()

        let dependencies = ["LoadableView", "DebugSwiftUI"]
        sut.dependency = dependencies

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: dependencies, globalDependencies: true),
            encoder: SpmFileManager.encoder
        )
    }
}
