//  Created by Axel Ancona Esselmann on 5/17/24.
//

import Foundation

struct DependencyVersion {
    let versionString: String
    let kind: RemoteVersionBehavior

    static func upToNextMajorVersion(_ versionString: String) -> Self {
        .init(versionString: versionString, kind: .upToNextMajorVersion)
    }
}

struct Dependency {

    private var isUsingLocal: Bool = false
    private var isCloningToLocal: Bool = false
    private(set) var remoteUrl: URL?
    private var localDir: URL?

    let name: String
    let version: DependencyVersion?

    init(name: String, version: DependencyVersion, url urlString: String, localDir: String) {
        self.name = name
        self.version = version
        self.remoteUrl = URL(string: urlString)
        self.localDir = URL(string: localDir)
    }

    init(name: String, version: DependencyVersion, kind: RemoteVersionBehavior = .upToNextMajorVersion, urlBase baseUrlString: String, localBase: String) {
        self.name = name
        self.version = version
        self.remoteUrl = URL(string: baseUrlString + name)
        self.localDir = URL(string: localBase + name)
    }

    func useLocal() -> Self {
        var copy = self
        copy.isUsingLocal = true
        return copy
    }

    func cloneToLocal() -> Self {
        var copy = self
        copy.isCloningToLocal = true
        return copy
    }
}
