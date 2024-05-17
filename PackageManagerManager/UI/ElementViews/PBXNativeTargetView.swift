//  Created by Axel Ancona Esselmann on 5/17/24.
//

import SwiftUI

struct PBXNativeTargetView: View {

    let element: PBXNativeTarget

    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(element.id.stringValue)")
            Text("Package Product Dependencies:")
            ForEach(element.packageProductDependencies, id: \.id) {
                Text("Package Product Dependencies ID: \($0.stringValue)")
            }
        }.padding()
    }
}
