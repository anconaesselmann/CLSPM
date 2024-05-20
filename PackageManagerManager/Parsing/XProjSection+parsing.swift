//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation
import XProjParser

extension XProjSection {
    init?(
        content: String,
        currentIndex: inout String.Index,
        range: inout Range<String.Index>
    ) throws {
        let regex = /(?<sectionHeader>\/\*\s+Begin\s+[^\*]+\*\/)(?<sectionBody>.+?)(?<sectionFooter>\/\*\s+End\s+[^\*]+\*\/)/
            .dotMatchesNewlines()

        guard currentIndex < content.endIndex else {
            return nil
        }
        guard let result = try? regex.firstMatch(in: content[currentIndex..<content.endIndex]) else {
            return nil
        }
        range = result.range
        currentIndex = content.index(after: result.range.upperBound)
        guard let isa = XProjIsa(header: result.sectionHeader) else {
            throw Error.noIsaInSectionHeader
        }
        self.isa = isa
        let body = result.sectionBody
        self.elements = ElementParser
            .parse(body, currentIndex: body.startIndex)
            .mapToElements()
    }
}
