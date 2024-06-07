//  Created by Axel Ancona Esselmann on 6/6/24.
//

import XCTest
import XProjParser

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

enum DependencyType {
    case local, remote, either

    init(isLocal: Bool) {
        if isLocal {
            self = .local
        } else {
            self = .remote
        }
    }

    func matches(_ other: Self) -> Bool {
        switch self {
        case .local: return other == .local
        case .remote: return other == .remote
        case .either: return true
        }
    }
}

enum XCTAssertError: Error {
    case missingTarget
}

func XCTAssertDependencies(
    _ dependencyType: DependencyType,
    in inspector: ProjectInspector,
    for targetName: String? = nil,
    _ dependencyNames: [String],
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) throws {
    let project = inspector.project
    let root = inspector.root

    guard let targetName = try targetName ?? (try project.noneTestTargets(in: root).first?.name) else {
        throw XCTAssertError.missingTarget
    }

    let targetDependencies = try project.dependencies(in: root, verbose: false)
    let dependencies = (targetDependencies[targetName] ?? [])
        .map { (name: $0.name, type: DependencyType(isLocal: $0.useLocal ?? false)) }
        .filter { dependencyType.matches($0.type) }
        .map { $0.name }
    XCTAssertEqual(
        dependencyNames.sorted().joined(separator: ", "),
        dependencies.sorted().joined(separator: ", "),
        message(),
        file: file,
        line: line
    )
}
