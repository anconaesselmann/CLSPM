//  Created by Axel Ancona Esselmann on 5/16/24.
//

import SwiftUI

struct PBXFrameworksBuildPhaseView: View {

    let element: PBXFrameworksBuildPhase

    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(element.id.stringValue)")
            VStack {
                Text("Files")
                ForEach(element.files, id: \.id) {
                    Text($0.stringValue)
                }
            }
        }.padding()
    }
}
