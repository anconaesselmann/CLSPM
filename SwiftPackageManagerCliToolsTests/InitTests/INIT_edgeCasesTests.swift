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
        try myApp.moveProjectFile("d\(0)")
        try myApp.moveCsvSpmFile(with: ["Test"])
        sut.force = true
        sut.csv = true

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(
            fileManager.spmFileDir,
            ""
        )
    }

    func test_csvAndGlobalDependencies() throws {
        sut.globalDependencies = true
        sut.csv = true

        do {
            try sut.run(fileManager: fileManager)
        } catch InitError.globalDependenciesNotSupportedForCsv {
            return
        }
        XCTFail("CSV and global-dependencies is not supported")
    }
}
