//  Created by Axel Ancona Esselmann on 6/11/24.
//

import XCTest

final class Rest_config_Tests: XCTestCase {

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

    func testDeleteConfig_noLocalFlag() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveGlobalConfigFile()
        let configmanager = ConfigManager(fileManager: fileManager)
        let localConfigUrl = try configmanager.configUrl(global: false, create: false)
        let globalConfigUrl = try configmanager.configUrl(global: true, create: false)
        XCTAssertTrue(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
        sut.config = true
        try sut.run(fileManager: fileManager)
        XCTAssertFalse(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
    }

    func testDeleteConfig_localFlag() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveGlobalConfigFile()
        let configmanager = ConfigManager(fileManager: fileManager)
        let localConfigUrl = try configmanager.configUrl(global: false, create: false)
        let globalConfigUrl = try configmanager.configUrl(global: true, create: false)
        XCTAssertTrue(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
        sut.local = true
        sut.config = true
        try sut.run(fileManager: fileManager)
        XCTAssertFalse(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
    }

    func testDeleteConfig_globlFlag() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveGlobalConfigFile()
        let configmanager = ConfigManager(fileManager: fileManager)
        let localConfigUrl = try configmanager.configUrl(global: false, create: false)
        let globalConfigUrl = try configmanager.configUrl(global: true, create: false)
        XCTAssertTrue(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
        sut.global = true
        sut.config = true
        try sut.run(fileManager: fileManager)
        XCTAssertTrue(fileManager.fileExists(at: localConfigUrl))
        XCTAssertFalse(fileManager.fileExists(at: globalConfigUrl))
    }

    func testDeleteConfig_localAndGlobalFlag() throws {
        try myApp.moveLocalConfigFile()
        try myApp.moveGlobalConfigFile()
        let configmanager = ConfigManager(fileManager: fileManager)
        let localConfigUrl = try configmanager.configUrl(global: false, create: false)
        let globalConfigUrl = try configmanager.configUrl(global: true, create: false)
        XCTAssertTrue(fileManager.fileExists(at: localConfigUrl))
        XCTAssertTrue(fileManager.fileExists(at: globalConfigUrl))
        sut.local = true
        sut.global = true
        sut.config = true
        try sut.run(fileManager: fileManager)
        XCTAssertFalse(fileManager.fileExists(at: localConfigUrl))
        XCTAssertFalse(fileManager.fileExists(at: globalConfigUrl))
    }

}
