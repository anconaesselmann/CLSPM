//  Created by Axel Ancona Esselmann on 6/6/24.
//

import Foundation

protocol OutputKind {
    func send(_ content: String)
    func send(_ error: Error)
}

class ConsoleOutput: OutputKind {
    func send(_ content: String) {
        print(content)
    }

    func send(_ error: Error) {
        print(error)
    }
}

class Output {

    var output: OutputKind = ConsoleOutput()

    static var shared = Output()

    func send(_ content: String, _ isVerbose: Bool) {
        if isVerbose {
            self.send(content)
        }
    }

    func send(_ content: String) {
        output.send(content)
    }
}
