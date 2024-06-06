//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

final class SwiftPackageManagerCliToolsTests: XCTestCase {

    var sut: Install!

    override func setUpWithError() throws {
        try FileManager.test_setup()
        sut = Install()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        
    }
}
