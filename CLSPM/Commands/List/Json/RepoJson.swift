//  Created by Axel Ancona Esselmann on 6/20/24.
//

import Foundation

struct RepoJson: Codable {

    struct License: Codable {
        let key: String
        let name: String
        let url: URL?
    }

    struct Owner: Codable {
        let login: String
        let htmlUrl: URL
        let avatarUrl: URL
    }

    let name: String
    let htmlUrl: URL
    let language: String
    let description: String?
    let topics: [String]
    let archived: Bool
    let createdAt: Date
    let updatedAt: Date
    let stargazersCount: Int
    let forksCount: Int
    let license: License?
    let owner: Owner
}
