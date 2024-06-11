//  Created by Axel Ancona Esselmann on 6/11/24.
//

import XCTest

final class Rest_all_Tests: XCTestCase {

    var sut: Reset!
    var myApp: MyApp!

    var fileManager: TempFileManager!

    var bundle: Bundle {
        Bundle(for: Self.self)
    }

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        myApp = MyApp(fileManager)
        Output.test_setup()
        sut = Reset().setup_testing()
        sut.verbose = true
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testNothingToReset() throws {
        do {
            try sut.run(fileManager: fileManager)
        } catch Reset.Error.nothingToReset {
            return
        }
        XCTFail("Error should have been thrown")
    }

    func testDeleteAll_local() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveGlobalConfigFile()
        try myApp.moveDependenciesFile()
        try myApp.moveJsonSpmFile(with: ["LoadableView"])
        let configmanager = ConfigManager(fileManager: fileManager)
        let spmManager = SpmFileManager(fileManager: fileManager)
        // Local
        let spmDir = spmManager.spmfileDir()
        let localConfigUrl = try configmanager.configUrl(global: false, create: false)
        let localDirectory = try configmanager.swiftClpmDirUrl(global: false, create: false)
        // Global
        let globalConfigUrl = try configmanager.configUrl(global: true, create: false)
        let dependenciesUrl = try configmanager.dependenciesUrl()
        let globalDirectory = try configmanager.swiftClpmDirUrl(global: true, create: false)
        // Local
        XCTAssertTrue(fileManager.fileExists(atPath: spmDir))
        XCTAssertTrue(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: localDirectory))
        // Global
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: dependenciesUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalDirectory))
        sut.local = true
        sut.all = true
        try sut.run(fileManager: fileManager)
        // Local
        XCTAssertFalse(fileManager.fileExists(atPath: spmDir))
        XCTAssertFalse(fileManager.fileExists(at: localConfigUrl))
        XCTAssertFalse(fileManager.fileExists(at: localDirectory))
        // Global
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: dependenciesUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalDirectory))
    }

    func testDeleteAll_global() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveGlobalConfigFile()
        try myApp.moveDependenciesFile()
        try myApp.moveJsonSpmFile(with: ["LoadableView"])
        let configmanager = ConfigManager(fileManager: fileManager)
        let spmManager = SpmFileManager(fileManager: fileManager)
        // Local
        let spmDir = spmManager.spmfileDir()
        let localConfigUrl = try configmanager.configUrl(global: false, create: false)
        let localDirectory = try configmanager.swiftClpmDirUrl(global: false, create: false)
        // Global
        let globalConfigUrl = try configmanager.configUrl(global: true, create: false)
        let dependenciesUrl = try configmanager.dependenciesUrl()
        let globalDirectory = try configmanager.swiftClpmDirUrl(global: true, create: false)
        // Local
        XCTAssertTrue(fileManager.fileExists(atPath: spmDir))
        XCTAssertTrue(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: localDirectory))
        // Global
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: dependenciesUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalDirectory))
        sut.global = true
        sut.all = true
        try sut.run(fileManager: fileManager)
        // Local
        XCTAssertTrue(fileManager.fileExists(atPath: spmDir))
        XCTAssertTrue(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: localDirectory))
        // Global
        XCTAssertFalse(fileManager.fileExists(at: globalConfigUrl))
        XCTAssertFalse(fileManager.fileExists(at: dependenciesUrl))
        XCTAssertFalse(fileManager.fileExists(at: globalDirectory))
    }

    func testDeleteAll_localAndGlobal() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveGlobalConfigFile()
        try myApp.moveDependenciesFile()
        try myApp.moveJsonSpmFile(with: ["LoadableView"])
        let configmanager = ConfigManager(fileManager: fileManager)
        let spmManager = SpmFileManager(fileManager: fileManager)
        // Local
        let spmDir = spmManager.spmfileDir()
        let localConfigUrl = try configmanager.configUrl(global: false, create: false)
        let localDirectory = try configmanager.swiftClpmDirUrl(global: false, create: false)
        // Global
        let globalConfigUrl = try configmanager.configUrl(global: true, create: false)
        let dependenciesUrl = try configmanager.dependenciesUrl()
        let globalDirectory = try configmanager.swiftClpmDirUrl(global: true, create: false)
        // Local
        XCTAssertTrue(fileManager.fileExists(atPath: spmDir))
        XCTAssertTrue(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: localDirectory))
        // Global
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: dependenciesUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalDirectory))
        sut.local = true
        sut.global = true
        sut.all = true
        try sut.run(fileManager: fileManager)
        // Local
        XCTAssertFalse(fileManager.fileExists(atPath: spmDir))
        XCTAssertFalse(fileManager.fileExists(at: localConfigUrl))
        XCTAssertFalse(fileManager.fileExists(at: localDirectory))
        // Global
        XCTAssertFalse(fileManager.fileExists(at: globalConfigUrl))
        XCTAssertFalse(fileManager.fileExists(at: dependenciesUrl))
        XCTAssertFalse(fileManager.fileExists(at: globalDirectory))
    }



}
