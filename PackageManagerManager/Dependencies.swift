//  Created by Axel Ancona Esselmann on 5/29/24.
//

import Foundation
import XProjParser

struct Dependencies {
    static let loadableView = XProjDependency(
        name: "LoadableView",
        url: "https://github.com/anconaesselmann/LoadableView/",
        version: "0.3.9",
        localPath: "../AxelPods/LoadableView"
    )
    static let xProjParser = XProjDependency(
        name: "XProjParser",
        url:  "https://github.com/anconaesselmann/XProjParser/",
        version: "0.0.1",
        localPath: "../AxelPods/XProjParser"
    )
    static let coreDataStored = XProjDependency(
        name: "CoreDataStored",
        url:  "https://github.com/anconaesselmann/CoreDataStored/",
        version: "0.0.7",
        localPath: "../AxelPods/CoreDataStored"
    )
    static let programmaticCoreData = XProjDependency(
        name: "ProgrammaticCoreData",
        url:  "https://github.com/anconaesselmann/ProgrammaticCoreData/",
        version: "0.0.4",
        localPath: "../AxelPods/ProgrammaticCoreData"
    )
}
