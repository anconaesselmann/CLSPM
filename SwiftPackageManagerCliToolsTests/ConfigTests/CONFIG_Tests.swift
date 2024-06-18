//  Created by Axel Ancona Esselmann on 6/17/24.
//

import XCTest

final class CONFIG_Tests: XCTestCase {

    var sut: Config!
    var myApp: MyApp!

    var fileManager: TempFileManager!
    var configManager: ConfigManager!

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        configManager = ConfigManager(fileManager: fileManager)
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Config().setup_testing()
        sut.verbose = true
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testSetListOutputFile_relativePath() throws {
        sut.listOutputFile = "output"

        try sut.run(fileManager: fileManager)
        guard let listConfig = try configManager.listConfig() else {
            XCTFail("No list config")
            return
        }
        XCTAssertEqual(
            listConfig.output?.path?.absoluteString,
            fileManager.currentDirectory
                .appending(path: "output")
                .absoluteString
        )
    }

    func testSetListOutputFile_outsideRelativePath() throws {
        sut.listOutputFile = "../output"

        try sut.run(fileManager: fileManager)
        guard let listConfig = try configManager.listConfig() else {
            XCTFail("No list config")
            return
        }
        XCTAssertEqual(
            listConfig.output?.path?.absoluteString,
            fileManager.currentDirectory
                .deletingLastPathComponent()
                .appending(path: "output")
                .absoluteString
        )
    }

    func testSetListOutputFile_AbsolutePath() throws {
        sut.listOutputFile = "/output"

        try sut.run(fileManager: fileManager)
        guard let listConfig = try configManager.listConfig() else {
            XCTFail("No list config")
            return
        }
        XCTAssertEqual(
            listConfig.output?.path?.absoluteString,
            URL(filePath: "/output").absoluteString
        )
    }
}
