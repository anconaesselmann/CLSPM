//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InstallTests: XCTestCase {

    var sut: Install!

    var fileManager: TempFileManager!

    var bundle: Bundle {
        Bundle(for: Self.self)
    }

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        FileManager.default = fileManager
        Output.test_setup()
        sut = Install()
    }

    override func tearDownWithError() throws {
        sut = nil
        try fileManager.cleanup()
    }

    func testExample() throws {
        do {
            try sut.run()
        } catch {
            print(error)
        }
    }
}
