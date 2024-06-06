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
    init(test_home home: URL, test_current current: String) {
        homeDirectoryForCurrentUser = home
        currentDirectoryPath = current
    }
    static func test_setup() throws {
        let uuid = UUID(uuidString: "4bfcdd0e-df3c-48df-b58e-1828a1189160")!
        let testDir = "/private/tmp/\(uuid.uuidString)"
        let testUrl = URL(filePath: testDir, directoryHint: .isDirectory)
        let homeString = "\(testDir)/home"
        let homeUrl = URL(fileURLWithPath: homeString)
        let currentString = "\(testDir)/current"
        let currentUrl = URL(fileURLWithPath: currentString)
        FileManager.default = FileManager(
            test_home: homeUrl,
            test_current: currentString
        )
        try? FileManager.default.removeItem(at: testUrl)
        try FileManager.default.createDirectory(at: homeUrl, withIntermediateDirectories: true)
        try FileManager.default.createDirectory(at: currentUrl, withIntermediateDirectories: true)
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
