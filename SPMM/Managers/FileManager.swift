//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation

class FileManager {

    #if DEBUG
    static var `default` = FileManager()
    #else
    static let `default` = FileManager()
    #endif

    #if DEBUG

    enum TestError: Swift.Error {
        case fileNotIndBundle(String)
        case couldReadFile(String)
        case invalidFileName(String)
    }
    init(test_home home: URL, test_current current: String) {
        homeDirectoryForCurrentUser = home
        currentDirectoryPath = current
    }
    static func test_setup(current: String? = nil) throws {
        let uuid = UUID(uuidString: "4bfcdd0e-df3c-48df-b58e-1828a1189160")!
        let testDir = "/private/tmp/\(uuid.uuidString)"
        let testUrl = URL(filePath: testDir, directoryHint: .isDirectory)
        let homeString = "\(testDir)/home"
        let homeUrl = URL(fileURLWithPath: homeString)
        let currentString = "\(testDir)/\(current ?? "current")"
        let currentUrl = URL(fileURLWithPath: currentString)
        FileManager.default = FileManager(
            test_home: homeUrl,
            test_current: currentString
        )
        try? FileManager.default.removeItem(at: testUrl)
        try FileManager.default.createDirectory(at: homeUrl, withIntermediateDirectories: true)
        try FileManager.default.createDirectory(at: currentUrl, withIntermediateDirectories: true)
    }

    static func test_cleanup() throws {
        let uuid = UUID(uuidString: "4bfcdd0e-df3c-48df-b58e-1828a1189160")!
        let testDir = "/private/tmp/\(uuid.uuidString)"
        let testUrl = URL(filePath: testDir, directoryHint: .isDirectory)
        try FileManager.default.removeItem(at: testUrl)
    }

    func copy(from bundle: Bundle, _ testName: String, to dir: String) throws {
        let parts = testName.split(separator: ".")
        guard
            parts.count == 2,
            let originalFileName = parts.first,
            let originalFileExtension = parts.last
        else {
            throw TestError.invalidFileName(testName)
        }
        guard let url = bundle.url(forResource: String(originalFileName), withExtension: String(originalFileExtension)) else {
            throw TestError.fileNotIndBundle(testName)
        }
        let data = try Data(contentsOf: url)

        var copyUrl = URL(fileURLWithPath: currentDirectoryPath)
        var dirComponents = dir.split(separator: "/")
        let name = dirComponents.removeLast()
        for path in dirComponents {
            copyUrl.append(path: path)
        }
        try? _fileManager.createDirectory(at: copyUrl, withIntermediateDirectories: true)
        copyUrl.append(path: name)
        try data.write(to: copyUrl)
        print(copyUrl)
    }
    #endif


    init() {
        homeDirectoryForCurrentUser = _fileManager.homeDirectoryForCurrentUser
        currentDirectoryPath = _fileManager.currentDirectoryPath
    }

    private let _fileManager = Foundation.FileManager()

    private(set)
    var homeDirectoryForCurrentUser: URL

    private(set)
    var currentDirectoryPath: String

    var currentDirectory: URL {
        URL(fileURLWithPath: currentDirectoryPath)
    }

    func createDirectory(
        at url: URL,
        withIntermediateDirectories createIntermediates: Bool,
        attributes: [FileAttributeKey : Any]? = nil
    ) throws {
        try _fileManager.createDirectory(at: url, withIntermediateDirectories: createIntermediates, attributes: attributes)
    }

    func fileExists(atPath path: String) -> Bool {
        _fileManager.fileExists(atPath: path)
    }

    @discardableResult
    func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey : Any]? = nil) -> Bool {
        _fileManager.createFile(atPath: path, contents: data, attributes: attr)
    }

    func contents(atPath path: String) -> Data? {
        _fileManager.contents(atPath: path)
    }

    func fileExists(atPath path: String, isDirectory: UnsafeMutablePointer<ObjCBool>?) -> Bool {
        _fileManager.fileExists(atPath: path, isDirectory: isDirectory)
    }

    func removeItem(at url: URL) throws {
        try _fileManager.removeItem(at: url)
    }
}
