//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InitTests: XCTestCase {

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
    }

    override func tearDownWithError() throws {
        sut = nil
        try FileManager.test_cleanup()
        fileManager = nil
    }

    func testEmptyMicroSpmFileCreatedExample() throws {
        try moveProjectFile()

        sut.verbose = true
        sut.noTestTargets = true
        sut.microSpmfile = true

        try sut.run()

//        print(try Output.text())

        try XCTAssertEqual(spmFileDir, "")
    }

    private func moveProjectFile() throws {
        try fileManager.copy(
            from: bundle, "MyAppProject.test",
            to: "MyApp.xcodeproj/project.pbxproj"
        )
    }
}
