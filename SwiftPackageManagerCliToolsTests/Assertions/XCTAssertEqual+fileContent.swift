//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

func XCTAssertEqual(_ url: URL, _ expected: String, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) throws {
    let data = try Data(contentsOf: url)
    guard let content = String(data: data, encoding: .utf8) else {
        XCTFail()
        return
    }
    XCTAssertEqual(content, expected, message(), file: file, line: line)
}
