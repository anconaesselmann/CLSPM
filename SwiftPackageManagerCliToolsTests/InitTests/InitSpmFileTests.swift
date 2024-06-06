//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InitSpmFileTests: XCTestCase {

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
        sut.verbose = true
    }

    override func tearDownWithError() throws {
        sut = nil
        try FileManager.test_cleanup()
    }

    func testEmptySpmFileCreatedExample() throws {
        try moveProjectFile()
        try moveLocalConfigFile()

        try sut.run()

//        print(try Output.text())

        let spmFile = JsonSpmFile(
            targets: [
                JsonSpmTarget(
                    id: UUID(uuidString: "9D6FC795-45A9-457C-919F-D8CE20A9DFDA")!,
                    name: "MyApp",
                    dependencies: []
                )
            ],
            dependencies: []
        )

        let encoder = SpmFileManager.encoder
        try XCTAssertEqual(spmFileDir, spmFile, encoder: encoder)
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

    private func moveLocalConfigFile() throws {
        try fileManager.copy(
            from: bundle, "config.test",
            to: ".swiftpmm/config",
            in: .current
        )
    }

}
