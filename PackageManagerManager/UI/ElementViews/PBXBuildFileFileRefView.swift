//  Created by Axel Ancona Esselmann on 5/16/24.
//

import SwiftUI

struct PBXBuildFileFileRefView: View {

    let element: PBXBuildFileFileRef

    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(element.id.stringValue)")
            Text("File Ref: \(element.fileRef.stringValue)")
        }.padding()
    }
}
