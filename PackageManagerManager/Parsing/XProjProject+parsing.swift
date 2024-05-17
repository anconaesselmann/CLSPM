//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation

extension XProjProject {
    init(content: String) throws {
        var sectionRanges: [Range<String.Index>] = []
        var currentIndex: String.Index = content.startIndex
        var sections: [XProjSection] = []

        var sectionRange: Range<String.Index> = content.startIndex..<content.endIndex

        while let section = try XProjSection(content: content, currentIndex: &currentIndex, range: &sectionRange) {
            sectionRanges.append(sectionRange)
            sections.append(section)
        }
        guard
            let sectionsStartIndex = sectionRanges.first?.lowerBound,
            let sectionsEndIndex = sectionRanges.last?.upperBound
        else {
            throw Error.noProjectHeader
        }
        self.content = content
        self.sections = sections
    }
}
