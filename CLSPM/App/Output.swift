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

class TextOutput: OutputKind {

    var output: String = ""

    func send(_ content: String) {
        output += content + "\n"
    }

    func send(_ error: Error) {
        send(error.localizedDescription)
    }
}

class Output {

    enum Granularity: Int, Hashable {
        case normal
        case verbose
        case debug
    }

    var granularity: Set<Granularity> = [.normal]

    var output: OutputKind = ConsoleOutput()

    static var shared = Output()

    func verboseFlagIsSet(_ isVerbose: Bool) {
        if isVerbose {
            granularity = [.normal, .verbose]
        } else {
            granularity.remove(.verbose)
        }
    }

    func send(_ content: String, _ granularity: Granularity = .normal) {
        guard self.granularity.contains(granularity) else {
            return
        }
        self.send(content)
    }

    func send(_ content: String) {
        output.send(content)
    }
}
