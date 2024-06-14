//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class INST_CSPM_T1_Tests: XCTestCase {

    var sut: Install!
    var myApp: MyApp!

    var fileManager: TempFileManager!
    var service: TestService!

    var bundle: Bundle {
        Bundle(for: Self.self)
    }

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        service = TestService()
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Install().setup_testing()
        sut.verbose = true
        try myApp.moveProjectFile()
        try myApp.moveDependenciesFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    // MARK: - INST-CSPM-T1-D1
    func testMicroSpmFileOneDependency() throws {
        let dependencyNames = ["LoadableView"]
        try myApp.moveCsvSpmFile(with: dependencyNames)
        
        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )

            let project = try ProjectInspector(self.fileManager)

            try XCTAssertDependencies(
                .remote,
                in: project,
                dependencyNames
            )
        }
    }

    // MARK: - INST-CSPM-T1-D2
    func testMicroSpmFileTwoDependency() throws {
        let dependencyNames = ["LoadableView", "DebugSwiftUI"]
        try myApp.moveCsvSpmFile(with: dependencyNames)

        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager, 
                service: self.service
            )

            let project = try ProjectInspector(self.fileManager)

            try XCTAssertDependencies(
                .remote,
                in: project,
                dependencyNames
            )
        }
    }
}
