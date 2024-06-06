//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

enum PackageLocation {
    case defaultLocation
    case spmmDerivedData
    case custom(String)

    init(packageCacheDir: String?, cloneToSpmmDir: Bool) {
        if let packageCacheDir = packageCacheDir {
            self = .custom(packageCacheDir)
        } else if cloneToSpmmDir {
            self = .spmmDerivedData
        } else {
            self = .defaultLocation
        }
    }
}
