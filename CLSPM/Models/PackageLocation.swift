//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

enum PackageLocation {
    case defaultLocation
    case clspmDerivedData
    case custom(String)

    init(packageCacheDir: String?, cloneToClspmDir: Bool) {
        if let packageCacheDir = packageCacheDir {
            self = .custom(packageCacheDir)
        } else if cloneToClspmDir {
            self = .clspmDerivedData
        } else {
            self = .defaultLocation
        }
    }
}
