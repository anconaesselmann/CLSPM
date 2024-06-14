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

    var bundle: Bundle {
        Bundle(for: Self.self)
    }

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        service = TestService()
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Create().setup_testing()
        sut.verbose = true
        try myApp.moveProjectFile()
        try myApp.moveConfigFile(isGlobal: true, localRootDirectoryName: "LocalSwiftPackages")
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testMicroSpmFileOneDependency() throws {
        let dependencyNames = ["LoadableView"]
        try myApp.moveCsvSpmFile(with: dependencyNames)
        guard let localRoot = try fileManager.configFile(global: true)?.localRoot else {
            throw Error.noConfigFile
        }
        
        let myAppDir = URL(fileURLWithPath: fileManager.currentDirectoryPath).appending(path: "MyApp")
        let myPackageInProjectDir = myAppDir.appending(path: "MyPackage")
        try fileManager.copy("Hello World", to: "MyApp/MyPackage/HelloWorld.swift", in: .current)
        try fileManager.createDirectory(at: URL(fileURLWithPath: localRoot), withIntermediateDirectories: false)

        sut.directory = myPackageInProjectDir.path()
        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )
        }
    }
}
