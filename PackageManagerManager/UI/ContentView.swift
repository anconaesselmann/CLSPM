//  Created by Axel Ancona Esselmann on 5/8/24.
//  

import SwiftUI

class ContentViewModel: ObservableObject {
    private let targetManager = AppState.shared.targetManager

    @Published
    var project: XProjProject?

    func update() {
        let targetNames = targetManager.targets.map { $0.name }
        // TODO: go target by target
        guard 
            let targetName = targetNames.first,
            let dependencies = targetManager.targets.first?.dependencies
        else {
            return
        }
        guard var updated = self.project else {
            return
        }
        do {
            let remotePackageReferences = try project?.remotePackageReferences(for: targetName) ?? []
            let remoteDependencies = try remotePackageReferences.compactMap { reference in
                try updated.packageDependency(for: reference.id)
            }
            let dependencyNames = Set(dependencies.map { $0.name })
            let keep = remoteDependencies.filter { dependencyNames.contains($0.productName) }
                .map { $0.productName }
            let remove = remoteDependencies.map { $0.productName }.filter { !keep.contains($0) }
            let add = dependencies.filter { !Set(keep + remove).contains($0.name) }
            print("keep: \(keep)")
            print("remove: \(remove)")
            print("add: \(add)")
            for remoteProductName in remove {
                updated = try updated.remotePackageRemoved(remoteProductName)
            }
            for remoteDependency in add {
                updated = try updated.addedDepenency(remoteDependency, to: targetName)
            }
            self.project = updated

            try updated.listAllProperties(for: .PBXProject)
        } catch {
            print(error)
        }
    }

    func loadProject() {
        project = try? XProjProject(content: mockProject)
    }
}

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
