//  Created by Axel Ancona Esselmann on 5/20/24.
//

import Foundation

final internal class RegexCompiler {
    typealias R = Regex<(Substring, Optional<Substring>, Optional<Substring>, objectWhiteSpace: Optional<Substring>, key: Optional<Substring>, Optional<Substring>, propertyComment: Optional<Substring>, Optional<Substring>, objectStart: Optional<Substring>, arrayStart: Optional<Substring>, Optional<Substring>, whiteSpace: Optional<Substring>, propertyKey: Optional<Substring>, value: Optional<Substring>, Optional<Substring>, rootObjectStart: Optional<Substring>, comment: Optional<Substring>, Optional<Substring>, id: Optional<Substring>, Optional<Substring>, idComment: Optional<Substring>, Optional<Substring>, beginningSectionName: Optional<Substring>, Optional<Substring>, endingSectionName: Optional<Substring>)>

    private var _regex: R?

    static let shared = RegexCompiler()

    private init() { }

    func regex() throws -> R {
        if let regex = _regex {
            return regex
        }
        let singleLineCommentRegexString = "\\s*\\/\\/\\s*(?<comment>.+)"

        let nestStartRegexString =
            "(?<objectWhiteSpace>[ \\t]*)" +
            "(?<key>[^=\\s\\/]+)\\s*" +
            "(\\/\\*\\s*(?<propertyComment>[^\\*]+)\\s*\\*\\/\\s*)?=\\s+" +
            "((?<objectStart>\\{)|(?<arrayStart>\\())"

        let rootObjectStart = "[ \t]*(?<rootObjectStart>\\{)"

        let propertyString =
            "(?<whiteSpace>[\\t ]*)" +
            "(?<propertyKey>[^ \\{\\}; \t\n]+)" +
            "\\s=\\s" +
            "(?<value>[^;\\{]+)" +
            ";"

        let idString = "(?<id>[0-9A-F]{24})\\s+(\\/\\*\\s*(?<idComment>[^\\*]+)\\s*\\*\\/)?"

        let sectionStartString = "\\/\\*\\s+Begin\\s+(?<beginningSectionName>[^\\s]+)\\s+section\\s+\\*\\/"
        let sectionEndString = "\\/\\*\\s+End\\s+(?<endingSectionName>[^\\s]+)\\s+section\\s+\\*\\/"

        let regexString = "((\(nestStartRegexString))|(\(propertyString))|(\(rootObjectStart))|\(singleLineCommentRegexString))|(\(idString))|(\(sectionStartString))|(\(sectionEndString))"
        let regex: R = try Regex(regexString)
        _regex = regex
        return regex
    }
}
