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

    func test_INIT_JSON_T1_F_spmfile_D0() throws {
        try myApp.moveLocalConfigFile()

        let spmfileDir = fileManager.homeDirectoryForCurrentUser.appending(path: "alternate_spmfile")

        sut.spmfile = spmfileDir.path()
        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            spmfileDir,
            myApp.application(with: []),
            encoder: SpmFileManager.encoder
        )
    }

    func test_INIT_JSON_T1_F_testTargets() throws {
        try myApp.moveLocalConfigFile()

        sut.testTargets = true
        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            myApp.application(
                with: [],
                testTargets: [
                    ("MyAppTests", UUID(uuidString: "151A2DBC-9FD8-4C3C-8EB4-E13711B476C2")!),
                    ("MyAppUITests", UUID(uuidString: "6A5F613D-E8DD-415E-938C-E8DF41981A5E")!)
                ]
            ),
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
