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
}
