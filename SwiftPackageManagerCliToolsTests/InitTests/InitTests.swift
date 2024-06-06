//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InitTests: XCTestCase {

    var sut: Init!

    var bundle: Bundle {
        Bundle(for: Self.self)
    }

    override func setUpWithError() throws {
        try FileManager.test_setup(current: "MyApp")
        VPrintTestObserver.test_setup()
        sut = Init().test_setup()
    }

    override func tearDownWithError() throws {
        sut = nil
        try FileManager.test_cleanup()
        VPrintTestObserver.test_cleanup()
    }

    func emptyMicroSpmFileCreatedExample() throws {
        do {
            try FileManager.default.copy(
                from: bundle, "MyAppProject.test",
                in: "MyApp.xcodeproj",
                name: "project.pbxproj"
            )
            sut.verbose = true
            sut.noTestTargets = true
            try sut.run()
        } catch {
            print(error)
        }
        print(VPrintTestObserver.shared.output)

        let spmFileDir = FileManager.default.currentDirectory
            .appending(path: "spmfile")
        let spmFileData = try Data(contentsOf: spmFileDir)
        guard let spmFileContent = String(data: spmFileData, encoding: .utf8) else {
            XCTFail()
            return
        }
        XCTAssertEqual(spmFileContent, "")
    }
}
