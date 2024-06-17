//  Created by Axel Ancona Esselmann on 6/14/24.
//

import XCTest
import XProjParser

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
    }

    override func tearDownWithError() throws {
//        print(try Output.text())
        sut = nil
        try fileManager.cleanup()
    }

    func testGroups() throws {
        try myApp.moveProjectFile("groups")
        let packageName = "MyPackage"
        let project = try Project(fileManager: fileManager)
        let url = try project.url(forGroup: packageName)

        try project.remove(group: packageName)
            .save()

        do {
            let after = try Project(fileManager: fileManager).url(forGroup: packageName)
        } catch XProjRoot.GroupError.missingGroup(let groupName) {
            XCTAssertEqual(groupName, packageName)
            return
        }
        XCTFail("Group \(packageName) should not exist any more")
    }

    func testPathForGroup() throws {
        try myApp.moveProjectFile("groups")
        let packageName = "MyPackage"
        let url = try Project(fileManager: fileManager)
            .url(forGroup: packageName)
        let expected = fileManager.currentDirectory
            .appending(path: "MyApp")
            .appending(path: packageName)
        XCTAssertEqual(url, expected)
    }

}
