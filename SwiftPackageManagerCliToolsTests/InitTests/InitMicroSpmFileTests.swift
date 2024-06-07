//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InitMicroSpmFileTests: XCTestCase {

    var sut: Init!

    var fileManager: FileManager!

    private var bundle: Bundle { Bundle(for: Self.self) }

    override func setUpWithError() throws {
        try FileManager.test_setup(current: "MyApp")
        fileManager = FileManager.default
        Output.test_setup()
        sut = Init().setup_testing()
//        sut.verbose = true
        sut.microSpmfile = true
        try MyApp.moveProjectFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try FileManager.test_cleanup()
    }

    func testEmptyMicroSpmFileCreatedExample() throws {
        try sut.run()
        
        try XCTAssertEqual(fileManager.spmFileDir, "")
    }

    func testMicroSpmFileWithOneCachedDependencyExample() throws {
        try MyApp.moveDependenciesFile()
        sut.cached = ["LoadableView"]

        try sut.run()

        try XCTAssertEqual(fileManager.spmFileDir, "LoadableView")
    }

    func testMicroSpmFileWithTwoCachedDependencyExample() throws {
        try MyApp.moveDependenciesFile()
        sut.cached = ["LoadableView", "DebugSwiftUI"]
        
        try sut.run()

        try XCTAssertEqual(fileManager.spmFileDir, "DebugSwiftUI, LoadableView")
    }
}
