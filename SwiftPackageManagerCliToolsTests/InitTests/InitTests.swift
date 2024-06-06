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
        VPrintTestObserver.test_setup()
        sut = Init().test_setup()
    }

    override func tearDownWithError() throws {
        sut = nil
        try FileManager.test_cleanup()
        fileManager = nil
        VPrintTestObserver.test_cleanup()
    }

    func emptyMicroSpmFileCreatedExample() throws {
        try moveProjectFile()

        sut.verbose = true
        sut.noTestTargets = true

        try sut.run()

//        print(VPrintTestObserver.shared.output)

        try XCTAssertEqual(spmFileDir, "")
    }

    private func moveProjectFile() throws {
        try fileManager.copy(
            from: bundle, "MyAppProject.test",
            to: "MyApp.xcodeproj/project.pbxproj"
        )
    }
}
