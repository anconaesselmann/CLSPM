//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InitMicroSpmFileTests: XCTestCase {

    var sut: Init!

    var fileManager: FileManager!

    private var bundle: Bundle { Bundle(for: Self.self) }

    private var spmFileDir: URL {
        fileManager.currentDirectory
            .appending(path: "spmfile")
    }

    override func setUpWithError() throws {
        try FileManager.test_setup(current: "MyApp")
        fileManager = FileManager.default
        Output.test_setup()
        sut = Init().setup_testing()
//        sut.verbose = true
        sut.microSpmfile = true
        try moveProjectFile()
    }

    override func tearDownWithError() throws {
        sut = nil
        try FileManager.test_cleanup()
        fileManager = nil
    }

    func testEmptyMicroSpmFileCreatedExample() throws {
        try sut.run()

//        print(try Output.text())

        try XCTAssertEqual(spmFileDir, "")
    }

    func testMicroSpmFileWithOneCachedDependencyExample() throws {
        try moveDependenciesFile()

        sut.cached = ["LoadableView"]

        try sut.run()

//        print(try Output.text())

        try XCTAssertEqual(spmFileDir, "LoadableView")
    }

    func testMicroSpmFileWithTwoCachedDependencyExample() throws {
        try moveDependenciesFile()

        sut.cached = ["LoadableView", "DebugSwiftUI"]

        try sut.run()

//        print(try Output.text())

        try XCTAssertEqual(spmFileDir, "DebugSwiftUI, LoadableView")
    }

    private func moveProjectFile() throws {
        try fileManager.copy(
            from: bundle, "MyAppProject.test",
            to: "MyApp.xcodeproj/project.pbxproj"
        )
    }

    private func moveDependenciesFile() throws {
        try fileManager.copy(
            from: bundle, "dependencies.test",
            to: ".swiftpmm/dependencies",
            in: .home
        )
    }
}
