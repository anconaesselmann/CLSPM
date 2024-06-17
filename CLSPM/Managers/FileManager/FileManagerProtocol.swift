//  Created by Axel Ancona Esselmann on 6/7/24.
//

import Foundation

protocol FileManagerProtocol {
    var homeDirectoryForCurrentUser: URL { get }

    var currentDirectoryPath: String { get }

    var currentDirectory: URL { get }

    func createDirectory(
        at url: URL,
        withIntermediateDirectories createIntermediates: Bool,
        attributes: [FileAttributeKey : Any]?
    ) throws

    func fileExists(atPath path: String) -> Bool

    @discardableResult
    func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey : Any]?) -> Bool

    func contents(atPath path: String) -> Data?

    func fileExists(atPath path: String, isDirectory: UnsafeMutablePointer<ObjCBool>?) -> Bool

    func removeItem(at url: URL) throws

    func moveItem(at srcURL: URL, to dstURL: URL) throws
}

extension FileManagerProtocol {
    var currentDirectory: URL {
        URL(fileURLWithPath: currentDirectoryPath)
    }

    func createDirectory(
        at url: URL,
        withIntermediateDirectories createIntermediates: Bool
    ) throws {
        try createDirectory(at: url, withIntermediateDirectories: createIntermediates, attributes: nil)
    }

    @discardableResult
    func createFile(atPath path: String, contents data: Data?) -> Bool {
        createFile(atPath: path, contents: data, attributes: nil)
    }

    func fileExists(at url: URL) -> Bool {
        self.fileExists(atPath: url.path())
    }

    func contents(at dir: URL) -> Data? {
        contents(atPath: dir.path())
    }

    func directoryExists(atPath path: String) -> Bool {
        var isDirectory : ObjCBool = true
        let exists = fileExists(atPath: path, isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }

    func directoryExists(at url: URL) -> Bool {
        var isDirectory : ObjCBool = true
        let exists = fileExists(atPath: url.path(), isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }
}
