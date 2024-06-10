//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class INIT_JSON_OPT_T1_Tests: XCTestCase {

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

    // https://github.com/anconaesselmann/CLSPM/wiki/Tests#init_json_t1_d0
    func test_INIT_JSON_T1_D0() throws {
        try myApp.moveLocalConfigFile()

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: []),
            encoder: SpmFileManager.encoder
        )
    }

    // https://github.com/anconaesselmann/CLSPM/wiki/Tests#init_json_opt_t1_r1r2
    func test_INIT_JSON_OPT_T1_R1() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveProjectFile()
        try myApp.moveDependenciesFile()

        let dependencies = ["LoadableView"]
        sut.dependency = dependencies

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: dependencies),
            encoder: SpmFileManager.encoder
        )
    }

    // https://github.com/anconaesselmann/CLSPM/wiki/Tests#init_json_opt_t1_r1r2
    func test_INIT_JSON_OPT_T1_R2() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveProjectFile()
        try myApp.moveDependenciesFile()

        let dependencies = ["LoadableView", "DebugSwiftUI"]
        sut.dependency = dependencies

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(with: dependencies),
            encoder: SpmFileManager.encoder
        )
    }
}
