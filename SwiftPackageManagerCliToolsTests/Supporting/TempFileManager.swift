//  Created by Axel Ancona Esselmann on 6/7/24.
//

import Foundation

class TempFileManager: FileManagerProtocol {

    fileprivate let _fileManager = FileManager()

    var homeDirectoryForCurrentUser: URL

    var currentDirectoryPath: String

    fileprivate let uuid = UUID(uuidString: "4bfcdd0e-df3c-48df-b58e-1828a1189160")!
    fileprivate let uniqueId = UUID()
    let testDir: String
    let testUrl: URL

    init(home: String? = nil, current: String? = nil) throws {
        testDir = "/private/tmp/\(uuid.uuidString)/\(uniqueId.uuidString)"
        testUrl = URL(filePath: testDir, directoryHint: .isDirectory)
        let homeString = "\(testDir)/home"
        let homeUrl = URL(fileURLWithPath: homeString)
        let currentString = "\(testDir)/\(current ?? "current")"
        let currentUrl = URL(fileURLWithPath: currentString)

        homeDirectoryForCurrentUser = homeUrl
        currentDirectoryPath = currentString
        try? removeItem(at: testUrl)
        try createDirectory(at: homeUrl, withIntermediateDirectories: true)
        try createDirectory(at: currentUrl, withIntermediateDirectories: true)
    }

    func fileExists(atPath path: String) -> Bool {
        _fileManager.fileExists(atPath: path)
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

    func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey : Any]?) -> Bool {
        _fileManager.createFile(atPath: path, contents: data, attributes: attr)
    }

    func createDirectory(
        at url: URL,
        withIntermediateDirectories createIntermediates: Bool,
        attributes: [FileAttributeKey : Any]?
    ) throws {
        try _fileManager.createDirectory(
            at: url,
            withIntermediateDirectories: createIntermediates,
            attributes: attributes
        )
    }

    func moveItem(at srcURL: URL, to dstURL: URL) throws {
        try _fileManager.moveItem(at: srcURL, to: dstURL)
    }
}

extension TempFileManager {
    func cleanup() throws {
        try removeItem(at: testUrl)
    }

    enum TestError: Swift.Error {
        case fileNotIndBundle(String)
        case couldReadFile(String)
        case invalidFileName(String)
        case invalidData
    }

    enum RootDirectory {
        case home
        case current
    }

    func copy(from bundle: Bundle, _ testName: String, to dir: String, in root: RootDirectory = .current) throws {
        let parts = testName.split(separator: ".")
        guard
            parts.count == 2,
            let originalFileName = parts.first,
            let originalFileExtension = parts.last
        else {
            throw TestError.invalidFileName(testName)
        }
        guard let urlInBundle = bundle.url(forResource: String(originalFileName), withExtension: String(originalFileExtension)) else {
            throw TestError.fileNotIndBundle(testName)
        }
        let data = try Data(contentsOf: urlInBundle)
        let copyUrl = url(dir: dir, in: root)
        try data.write(to: copyUrl)
    }

    func copy(
        _ content: String,
        to dir: String,
        in root: RootDirectory = .current
    ) throws {
        guard let data = content.data(using: .utf8) else {
            throw TestError.invalidData
        }
        let copyUrl = url(dir: dir, in: root)
        try data.write(to: copyUrl)
    }

    private func url(dir: String, in root: RootDirectory) -> URL {
        var copyUrl: URL
        switch root {
        case .home:
            copyUrl = homeDirectoryForCurrentUser
        case .current:
            copyUrl = URL(fileURLWithPath: currentDirectoryPath)
        }
        var dirComponents = dir.split(separator: "/")
        let name = dirComponents.removeLast()
        for path in dirComponents {
            copyUrl.append(path: path)
        }
        try? _fileManager.createDirectory(at: copyUrl, withIntermediateDirectories: true)

        copyUrl.append(path: name)
        return copyUrl
    }
}
