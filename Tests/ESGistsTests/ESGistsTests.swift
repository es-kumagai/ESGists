import XCTest
@testable import ESGists

final class ESGistsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ESGists().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
