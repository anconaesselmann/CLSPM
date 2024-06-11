//  Created by Axel Ancona Esselmann on 6/11/24.
//

import XCTest

final class Rest_dependencies_Tests: XCTestCase {

    var sut: Reset!
    var myApp: MyApp!

    var fileManager: TempFileManager!

    var bundle: Bundle {
        Bundle(for: Self.self)
    }

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Reset().setup_testing()
        sut.verbose = true
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testNothingToReset() throws {
        do {
            try sut.run(fileManager: fileManager)
        } catch Reset.Error.nothingToReset {
            return
        }
        XCTFail("Error should have been thrown")
    }

    func testDeleteDependencies() throws {
        try myApp.moveDependenciesFile()
        let configmanager = ConfigManager(fileManager: fileManager)
        let url = try configmanager.dependenciesUrl(create: false)
        XCTAssertTrue(fileManager.fileExists(at: url))
        sut.dependencies = true
        sut.global = true
        try sut.run(fileManager: fileManager)
        XCTAssertFalse(fileManager.fileExists(at: url))
    }

}
