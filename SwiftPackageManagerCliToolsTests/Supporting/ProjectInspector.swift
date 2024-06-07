//  Created by Axel Ancona Esselmann on 6/7/24.
//

import Foundation
import XProjParser

struct ProjectInspector {
    let root: XProjRoot
    let project: Project
    init(_ fileManager: TempFileManager) throws {
        project = try Project(fileManager: fileManager)
        root = try project.root()
    }
}
