//  Created by Axel Ancona Esselmann on 5/8/24.
//  

import SwiftUI

struct ContentView: View {

    @StateObject
    var vm = ContentViewModel()

    var body: some View {
        VStack {
            Button("update") {
                vm.update()
            }
            if let project = vm.project {
                ScrollView {
                    Section("Packages") {
                        ForEach((try? vm.project?.remotePackageReferences(for: "test22")) ?? [], id: \.id) { package in
                            Text(package.repositoryURL.absoluteString)
                        }
                    }.padding()
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
        }.onAppear {
            vm.loadProject()
        }
    }
}

//#Preview {
//    ContentView()
//}
