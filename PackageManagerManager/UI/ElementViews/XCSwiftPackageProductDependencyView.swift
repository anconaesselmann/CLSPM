//  Created by Axel Ancona Esselmann on 5/14/24.
//

import SwiftUI

struct XCSwiftPackageProductDependencyView: View {

    let element: XCSwiftPackageProductDependency

    var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(element.id.stringValue)")
            Text("Package ID: \(element.package.stringValue)")
            Text("Product Name: \(element.productName)")
        }.padding()
    }
}
