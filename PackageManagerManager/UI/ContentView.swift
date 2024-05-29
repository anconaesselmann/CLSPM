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
        }.onAppear {
            vm.loadProject()
        }
    }
}

//#Preview {
//    ContentView()
//}
