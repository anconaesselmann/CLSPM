//
//  ConfigManager.swift
//  SPMM
//
//  Created by Axel Ancona Esselmann on 6/4/24.
//

import Foundation

class ConfigManager {
    func swiftPmmDirUrl(global: Bool) throws -> URL {
        let base: URL
        if global {
            base = FileManager.default.homeDirectoryForCurrentUser
        } else {
            let fileManager = FileManager.default
            base = URL(fileURLWithPath: fileManager.currentDirectoryPath)
        }
        let dir = base.appending(path: ".swiftpmm")
        if !directoryExistsAtPath(dir.path()) {
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: false)
        }
        return dir
    }

    func defaultsUrl(global isGlobal: Bool) throws -> URL {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes, .sortedKeys]
        let spmmDir = try swiftPmmDirUrl(global: isGlobal)
        let defaultsDir = spmmDir.appending(path: "config")
        var config: ConfigFile
        if !FileManager.default.fileExists(atPath: defaultsDir.path()) {
            config = ConfigFile()
            let contents = try encoder.encode(config)
            FileManager.default.createFile(atPath: defaultsDir.path(), contents: contents)
        }
        return defaultsDir
    }

    func configFile(global isGlobal: Bool) throws -> ConfigFile {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let defaultsUrl = try defaultsUrl(global: isGlobal)

        if let data = FileManager.default.contents(atPath: defaultsUrl.path()) {
            return try decoder.decode(ConfigFile.self, from: data)
        } else {
            return ConfigFile()
        }
    }

    func combinedConfigFile() throws -> ConfigFile {
        let global = try configFile(global: true)
        let local = try configFile(global: false)
        return local.combined(with: global)
    }

    func save(_ config: ConfigFile, global isGlobal: Bool) throws {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes, .sortedKeys]

        let data = try encoder.encode(config)
        let defaultsUrl = try defaultsUrl(global: isGlobal)
        try data.write(to: defaultsUrl)
    }

    func setLocalRoot(_ localRoot: String?, global isGlobal: Bool) throws {
        var config = try configFile(global: isGlobal)
        if var localRoot = localRoot, !localRoot.isEmpty {
            if localRoot.last != "/" {
                localRoot += "/"
            }
            config.localRoot = localRoot
        } else {
            config.localRoot = nil
        }
        try save(config, global: isGlobal)
    }

    fileprivate func directoryExistsAtPath(_ path: String) -> Bool {
        var isDirectory : ObjCBool = true
        let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }
}
