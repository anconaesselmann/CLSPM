//  Created by Axel Ancona Esselmann on 5/16/24.
//

import SwiftUI

struct PBXBuildFileProductRefView: View {

    let element: PBXBuildFileProductRef

    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(element.id.stringValue)")
            Text("Product Ref: \(element.productRef.stringValue)")
        }.padding()
    }
}
