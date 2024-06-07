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
        sut = Install()
    }

    override func tearDownWithError() throws {
        sut = nil
        try fileManager.cleanup()
    }

//    func testExample() async throws {
//        do {
//            try await sut.run(fileManager: fileManager)
//        } catch {
//            print(error)
//        }
//    }
}
