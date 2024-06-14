//  Created by Axel Ancona Esselmann on 6/13/24.
//

import XCTest

final class INST_cashedOrgsResolution_Tests: XCTestCase {
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
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testResolveFromOrgAndGetsInstalled_oneDependency_global() throws {
        let dependencyNames = ["LoadableView"]
        try myApp.moveCsvSpmFile(with: dependencyNames)

        try myApp.moveConfigFile(isGlobal: true, orgs: ["anconaesselmann"])

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

    func testResolveFromOrgAndGetsAddedToDependenciesFile_oneDependency_global() throws {
        let dependencyNames = ["LoadableView"]
        try myApp.moveCsvSpmFile(with: dependencyNames)
        let dependencies = dependencyNames.compactMap { myApp.dependencies[$0] }
        let dependency = dependencies[0]

        try myApp.moveConfigFile(isGlobal: true, orgs: ["anconaesselmann"])

        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )

            guard let dependencyFile = try self.fileManager.dependencyFile() else {
                XCTFail("Dependencies file does not exist")
                return
            }
            XCTAssertTrue(dependencyFile.hasDependency {
                $0.name == dependency.name &&
                $0.version == dependency.version
            })
        }
    }

    func testResolveFromOrgAndGetsInstalled_oneDependency_local() throws {
        let dependencyNames = ["LoadableView"]
        try myApp.moveCsvSpmFile(with: dependencyNames)

        try myApp.moveConfigFile(isGlobal: false, orgs: ["anconaesselmann"])

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

    func testResolveFromOrgAndGetsAddedToDependenciesFile_oneDependency_local() throws {
        let dependencyNames = ["LoadableView"]
        try myApp.moveCsvSpmFile(with: dependencyNames)
        let dependencies = dependencyNames.compactMap { myApp.dependencies[$0] }
        let dependency = dependencies[0]

        try myApp.moveConfigFile(isGlobal: false, orgs: ["anconaesselmann"])

        runAsyncTest {
            try await self.sut.run(
                fileManager: self.fileManager,
                service: self.service
            )

            guard let dependencyFile = try self.fileManager.dependencyFile() else {
                XCTFail("Dependencies file does not exist")
                return
            }
            XCTAssertTrue(dependencyFile.hasDependency {
                $0.name == dependency.name &&
                $0.version == dependency.version
            })
        }
    }
}
