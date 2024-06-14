//  Created by Axel Ancona Esselmann on 6/13/24.
//

import Foundation

protocol InputKind {
    func read() -> String?
}

class ConsoleInput: InputKind {
    
    func read() -> String? {
        readLine()
    }
}

class Input {
    var input: InputKind = ConsoleInput()

    static var shared = Input()

    func readLine() -> String? {
        input.read()
    }
}
