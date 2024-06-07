//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InstallTests: XCTestCase {

    var sut: Install!
    var myApp: MyApp!

    var fileManager: TempFileManager!

    var bundle: Bundle {
        Bundle(for: Self.self)
    }

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Install().setup_testing()
        sut.verbose = true
        try myApp.moveProjectFile()
        try myApp.moveProjectFile()
        try myApp.moveDependenciesFile()
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testMicroSpmFileOneDependency() throws {
        runAsyncTest {
            try self.myApp.moveSpmFile()
            try await self.sut.run(fileManager: self.fileManager)

            let project = try Project(fileManager: self.fileManager)
            let root = try project.root()
            let targetDependencies = try project.dependencies(in: root, verbose: false)
            let dependencyNames = ["LoadableView"]
                .sorted()
            let dependencies = (targetDependencies["MyApp"] ?? [])
                .map { $0.name }
                .sorted()
            XCTAssertEqual(
                dependencyNames.joined(separator: ", "),
                dependencies.joined(separator: ", ")
            )
        }
    }
}
