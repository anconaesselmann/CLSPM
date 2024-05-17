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
            Text(packageProductDependencyId)
            Text(packageReferenceId)
            if let project = project {
                ScrollView {
                    ForEach(project.sections) { section in
                        Section(section.isa.rawValue) {
                            ForEach(section.elements, id: \.id) { element in
                                VStack(alignment: .leading) {
                                    switch element {
                                    case let generic as GenericXProjElement:
                                        Text(element.isa.rawValue)
                                        Text(element.id.stringValue)
                                        Text(generic.content)
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
