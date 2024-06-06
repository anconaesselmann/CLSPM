//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class InstallTests: XCTestCase {

    var sut: Install!

    var bundle: Bundle {
        Bundle(for: Self.self)
    }

    override func setUpWithError() throws {
        try FileManager.test_setup(current: "MyApp")
        VPrintTestObserver.test_setup()
        sut = Install()
    }

    override func tearDownWithError() throws {
        sut = nil
        try FileManager.test_cleanup()
        VPrintTestObserver.test_cleanup()
    }

    func testExample() throws {
        do {
            try sut.run()
        } catch {
            print(error)
        }
    }
}
