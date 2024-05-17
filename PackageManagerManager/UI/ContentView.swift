//  Created by Axel Ancona Esselmann on 5/8/24.
//  

import SwiftUI

struct ContentView: View {

    @State
    var packageProductDependencyId = ""
    @State
    var packageReferenceId = ""

    @State
    var project: XProjProject?

    var body: some View {
        VStack {
            Button("do") {
                project = try? XProjProject(content: mockProject)
            }
            Button("remove") {
                project = try? project?.remotePackageRemoved("LoadableView")
            }
            Text(packageProductDependencyId)
            Text(packageReferenceId)
            if let project = project {
                ScrollView {
                    ForEach(project.sections) { section in
                        Section(section.isa.rawValue) {
                            ForEach(section.elements, id: \.id) { element in
                                VStack(alignment: .leading) {
                                    switch element {
                                    case let element as PBXBuildFileFileRef:
                                        PBXBuildFileFileRefView(element: element)
                                    case let element as PBXBuildFileProductRef:
                                        PBXBuildFileProductRefView(element: element)
                                    case let element as PBXFrameworksBuildPhase:
                                        PBXFrameworksBuildPhaseView(element: element)
                                    case let element as PBXNativeTarget:
                                        PBXNativeTargetView(element: element)
                                    case let element as PBXProject:
                                        PBXProjectView(element: element)
                                    case let element as XCRemoteSwiftPackageReference:
                                        XCRemoteSwiftPackageReferenceView(element: element)
                                    case let element as XCSwiftPackageProductDependency:
                                        XCSwiftPackageProductDependencyView(element: element)
                                    default: EmptyView()
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
