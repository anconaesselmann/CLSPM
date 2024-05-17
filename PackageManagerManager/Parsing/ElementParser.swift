//  Created by Axel Ancona Esselmann on 5/14/24.
//

import Foundation
import ParenthesesParser

struct ElementParser {
    static func parse(_ body: Substring, currentIndex: String.Index) -> [GenericXProjElement] {
        var elements: [GenericXProjElement] = []
        var elementsIndex = body.startIndex

        while elementsIndex < body.endIndex {
            guard let id = XProjId(body, currentIndex: &elementsIndex) else {
                elementsIndex = body.endIndex
                break
            }
            guard let elementContent = try? ParenthesesParser().nextFrame(body, from: elementsIndex, types: [.braces]) else {
                elementsIndex = body.endIndex
                break
            }
            let body = body[elementContent.start..<elementContent.end]
            guard let element = try? GenericXProjElement(content: body, id: id) else {
                assertionFailure()
                continue
            }
            elements.append(element)
            elementsIndex = elementContent.end
        }
        return elements
    }
}
