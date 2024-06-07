//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation

class FileManager: FileManagerProtocol {

    #if DEBUG
    static var `default`: FileManagerProtocol = FileManager()
    #else
    static let `default` = FileManager()
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
