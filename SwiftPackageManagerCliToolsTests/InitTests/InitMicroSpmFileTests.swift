//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InitMicroSpmFileTests: XCTestCase {

    var sut: Init!
    var myApp: MyApp!

    var fileManager: TempFileManager!

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Init().setup_testing()
//        sut.verbose = true
        sut.csv = true
        try myApp.moveProjectFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testEmptyMicroSpmFileCreatedExample() throws {
        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(fileManager.spmFileDir, "")
    }

    func testMicroSpmFileWithOneCachedDependencyExample() throws {
        try myApp.moveDependenciesFile()
        sut.dependencies = ["LoadableView"]

        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(fileManager.spmFileDir, "LoadableView")
    }

    func testMicroSpmFileWithTwoCachedDependencyExample() throws {
        try myApp.moveDependenciesFile()
        sut.dependencies = ["LoadableView", "DebugSwiftUI"]
        
        try sut.run(fileManager: fileManager)

        try XCTAssertEqual(fileManager.spmFileDir, "DebugSwiftUI, LoadableView")
    }
}
