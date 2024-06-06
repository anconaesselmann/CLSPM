//  Created by Axel Ancona Esselmann on 5/31/24.
//

import Foundation

#if DEBUG
class VPrintTestObserver {
    static var shared: VPrintTestObserver!

    var omitConsoleOutput: Bool = true

    var output: String = ""

    static func test_setup() {
        shared = VPrintTestObserver()
    }

    static func test_cleanup() {
        shared = VPrintTestObserver()
    }
}
#endif

func vPrint(_ content: String, _ isVerbose: Bool) {
    #if DEBUG
    if isVerbose {
        if let observer = VPrintTestObserver.shared {
            observer.output += content + "\n"
            if !observer.omitConsoleOutput {
                print(content)
            }
        } else {
            print(content)
        }
    }
    #else
    if isVerbose {
        print(content)
    }
    #endif
}
