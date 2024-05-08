//  Created by Axel Ancona Esselmann on 5/8/24.
//  

import SwiftUI

@main
struct PackageManagerManagerApp: App {

    @StateObject
    private var appInitializer = AppInitializer()

    var body: some Scene {
        WindowGroup {
            switch appInitializer.state {
            case .notStarted, .loading:
                ProgressView()
                    .task { await initialize() }
            case .success:
                ZStack {
                    ContentView()
                }
            case .failure(let error):
                Text("App could not load: \(error.localizedDescription)")
            }
        }
    }

    private func initialize() async {
        await appInitializer.initialize()
    }
}
