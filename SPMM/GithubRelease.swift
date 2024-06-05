//  Created by Axel Ancona Esselmann on 6/5/24.
//

import Foundation

struct GithubRelease: Codable {
    let tagName: String
    let prerelease: Bool
    let draft: Bool
    let publishedAt: Date?
}
