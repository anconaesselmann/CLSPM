//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class CREATE_Tests: XCTestCase {

    enum Error: Swift.Error {
        case noConfigFile
    }

    var sut: Create!
    var myApp: MyApp!

    var fileManager: TempFileManager!
    var service: TestService!

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        service = TestService()
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Create().setup_testing()
        sut.verbose = true
        try myApp.moveConfigFile(isGlobal: true, localRootDirectoryName: "LocalSwiftPackages")
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testCreate() throws {
        try myApp.moveProjectFile("groups")
        let dependencyNames: [String] = []
        try myApp.moveCsvSpmFile(with: dependencyNames)
        guard let localRoot = try fileManager.configFile(global: true)?.localRoot else {
            throw Error.noConfigFile
        }

        try fileManager.copy("Hello World", to: "MyApp/MyPackage/HelloWorld.swift", in: .current)
        try fileManager.createDirectory(at: URL(fileURLWithPath: localRoot), withIntermediateDirectories: false)

        sut.group = "MyPackage"
        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )

            let project = try ProjectInspector(self.fileManager)

            try XCTAssertDependencies(
                .local,
                in: project,
                dependencyNames + ["MyPackage"]
            )
        }
    }

    func testCreate_whitespaces() throws {
        try myApp.moveProjectFile("groups_whitespace")
        let dependencyNames: [String] = []
        try myApp.moveCsvSpmFile(with: dependencyNames)
        guard let localRoot = try fileManager.configFile(global: true)?.localRoot else {
            throw Error.noConfigFile
        }

        try fileManager.copy("Hello World", to: "MyApp/Turn into library/My Package/File 1.swift", in: .current)
        try fileManager.createDirectory(at: URL(fileURLWithPath: localRoot), withIntermediateDirectories: false)

        sut.group = "My Package"
        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )

            let project = try ProjectInspector(self.fileManager)

            try XCTAssertDependencies(
                .local,
                in: project,
                dependencyNames + ["MyPackage"]
            )
        }
    }
}
