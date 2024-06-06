//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest

func XCTAssertEqual(_ url: URL, _ expected: String, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) throws {
    let data = try Data(contentsOf: url)
    guard let content = String(data: data, encoding: .utf8) else {
        XCTFail(message(), file: file, line: line)
        return
    }
    XCTAssertEqual(content, expected, message(), file: file, line: line)
}

func XCTAssertEqual<Element>(
    _ url: URL,
    _ element: Element,
    encoder: JSONEncoder,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) throws
    where Element: Codable
{
    let data = try Data(contentsOf: url)
    guard let content = String(data: data, encoding: .utf8) else {
        XCTFail(message(), file: file, line: line)
        return
    }
    let elementData = try encoder.encode(element)
    guard let expected = String(data: elementData, encoding: .utf8) else {
        XCTFail(message(), file: file, line: line)
        return
    }
    XCTAssertEqual(content, expected, message(), file: file, line: line)
}
