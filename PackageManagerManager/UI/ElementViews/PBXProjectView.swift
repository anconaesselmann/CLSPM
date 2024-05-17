//  Created by Axel Ancona Esselmann on 5/16/24.
//

import SwiftUI

struct PBXProjectView: View {

    let element: PBXProject

    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(element.id.stringValue)")
            VStack {
                Text("Package References")
                ForEach(element.packageReferences, id: \.id) {
                    Text($0.stringValue)
                }
                Text("Targets")
                ForEach(element.targets, id: \.id) {
                    Text($0.stringValue)
                }
            }
        }.padding()
    }
}
