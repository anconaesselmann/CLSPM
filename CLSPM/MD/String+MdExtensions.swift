//  Created by Axel Ancona Esselmann on 6/18/24.
//

import Foundation

public extension String {
    func h(_ size: Int) -> String {
        "\(Array(repeating: "#", count: min(1, max(5, size))).joined()) \(self)"
    }

    func l(_ url: URL) -> String {
        "[\(self)](\(url.absoluteString))"
    }
}

public enum MdElementType {
    case header(Int), body, link(URL)
}

public struct MdElement {
    public init(stringValue: String, mdType: MdElementType) {
        self.stringValue = stringValue
        self.mdType = mdType
    }
    public let stringValue: String
    public let mdType: MdElementType

    static func h(_ stringValue: String, size: Int) -> Self {
        .init(stringValue: stringValue, mdType: .header(size))
    }
}

public struct McDocument {
    public var elements: [MdElement] = []

    public init(elements: [MdElement] = []) {
        self.elements = elements
    }

    public mutating func append(_ text: String) {
        elements.append(.init(stringValue: text, mdType: .body))
    }

    public mutating func append(_ text: String, _ type: MdElementType = .body) {
        elements.append(.init(stringValue: text, mdType: type))
    }

    var content: String {
        elements.map {
            switch $0.mdType {
            case .header(let size):
                return $0.stringValue.h(size)
            case .body:
                return $0.stringValue
            case .link(let url):
                return $0.stringValue.l(url)
            }
        }.joined(separator: "\n\n")
    }
}
