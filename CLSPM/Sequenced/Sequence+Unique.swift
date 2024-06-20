//  Created by Axel Ancona Esselmann on 6/20/24.
//

import Foundation

extension Sequence {
    func unique() -> [Iterator.Element] where Element: Hashable {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }

    func unique<T>(_ getProperty: @escaping (Element) -> T) -> [Iterator.Element] where T: Hashable {
        var seen: Set<T> = []
        return filter { seen.insert(getProperty($0)).inserted }
    }
}
