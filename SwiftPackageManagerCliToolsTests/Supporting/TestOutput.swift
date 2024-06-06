//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation

class TestOutput: OutputKind {

    var output: String = ""

    func send(_ content: String) {
        output += content + "\n"
    }

    func send(_ error: Error) {
        send(error.localizedDescription)
    }
}

extension Output {

    enum Error: Swift.Error {
        case notSetUpForTesting
    }

    static func test_setup() {
        Output.shared.output = TestOutput()
    }

    static func text() throws -> String {
        guard let output = Output.shared.output as? TestOutput else {
            throw Error.notSetUpForTesting
        }
        return output.output
    }
}
