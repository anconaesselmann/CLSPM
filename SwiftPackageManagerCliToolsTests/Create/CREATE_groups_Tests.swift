//  Created by Axel Ancona Esselmann on 6/14/24.
//

import XCTest

final class CREATE_groups_Tests: XCTestCase {

    var sut: Create!
    var myApp: MyApp!

    var fileManager: TempFileManager!
    var service: TestService!

    override func setUpWithError() throws {
        fileManager = try TempFileManager(current: "MyApp")
        service = TestService()
        myApp = MyApp(fileManager)
        Output.test_setup()
        try myApp.moveProjectFile("groups")
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

//    func testGroups() throws {
//        let project = try Project(fileManager: fileManager)
//            .remove(group: "MyPackage")
//        print(project.content)
//    }

}
