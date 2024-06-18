//  Created by Axel Ancona Esselmann on 6/18/24.
//

import XCTest

final class LIST_Tests: XCTestCase {

    var sut: List!
    var myApp: MyApp!

    var fileManager: TempFileManager!
    var configManager: ConfigManager!

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        myApp = MyApp(fileManager)
        configManager = ConfigManager(fileManager: fileManager)
        Output.test_setup()
        sut = List().setup_testing()
        sut.verbose = true
        try myApp.moveProjectFile("d\(2)")
        try myApp.moveLocalConfigFile()
        try configManager.setListOutputFile("listOutput", fileManager: fileManager)
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testOutputsSimpleTextToListOutputFile() throws {
        runAsyncTest {
            try await self.sut.run(fileManager: self.fileManager)
            let expected = """
DebugSwiftUI
LoadableView

"""
            try XCTAssertEqual(self.fileManager.currentDirectory.appending(path: "listOutput"), expected)
        }
    }

}
