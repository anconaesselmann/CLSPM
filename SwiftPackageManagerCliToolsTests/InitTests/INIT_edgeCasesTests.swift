//  Created by Axel Ancona Esselmann on 6/9/24.
//

import XCTest

final class INIT_edgeCasesTests: XCTestCase {

    var sut: Init!
    var myApp: MyApp!

    var fileManager: TempFileManager!

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Init().setup_testing()
        sut.verbose = true
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func test_errorWhenSpmfileExists() throws {
        try myApp.moveCsvSpmFile(with: [])
        do {
            try sut.run(fileManager: fileManager)
        } catch InitError.projectHasBeenInitialized {
            return
        }
        XCTFail("Init should fail when an spmfile is present")
    }

    func test_deletesSpmFileWithForce() throws {
        try myApp.moveProjectFile()
        try myApp.moveCsvSpmFile(with: ["Test"])
        sut.force = true
        sut.csv = true
        let manager = SpmFileManager(fileManager: fileManager)
        let spmFilePath = fileManager.spmFileDir

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            ""
        )
    }

    func test_errorPassingInTestsTarget() throws {
        do {
            sut.target = "MyAppTests"
            try sut.run(fileManager: fileManager)
        } catch InitError.passingATestTargetIntoInitIsNotSupported {
            return
        }
        XCTFail("Init can not be called with a test target")
    }
}
