//  Created by Axel Ancona Esselmann on 5/16/24.
//

import SwiftUI

struct XCRemoteSwiftPackageReferenceView: View {

    let element: XCRemoteSwiftPackageReference

    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(element.id.stringValue)")
            Text("Repository URL: \(element.repositoryURL.path())")
            Text("Kind: \(element.requirement.kind)")
            Text("Minimum Version: \(element.requirement.minimumVersion)")
        }.padding()
    }
}
