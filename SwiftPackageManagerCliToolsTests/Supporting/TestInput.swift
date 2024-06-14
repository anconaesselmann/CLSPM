//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

class TestInput: InputKind {
    var toBeRead: String?

    func read() -> String? {
        guard let toBeRead = toBeRead else {
            return nil
        }
        var elements = toBeRead.split(separator: "\n")
        guard !elements.isEmpty else {
            return nil
        }
        let result = String(elements.remove(at: 0))
        self.toBeRead = elements.joined(separator: "\n")
        return result
    }

    func send(_ text: String) {
        toBeRead = text
    }
}

extension Input {

    enum Error: Swift.Error {
        case notSetUpForTesting
    }

    @discardableResult
    static func test_setup() -> TestInput {
        let testInput = TestInput()
        Input.shared.input = testInput
        return testInput
    }

    static func text() throws -> String {
        guard let output = Output.shared.output as? TestOutput else {
            throw Error.notSetUpForTesting
        }
        return output.output
    }
}
