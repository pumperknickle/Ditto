import XCTest
import Regenerate
@testable import Ditto

final class DittoTests: XCTestCase {
    func testExample() {
        typealias StringScalar = Scalar<String>
        typealias StringDitto = Ditto<Address<StringScalar>>
        
        let stringDitto = StringDitto([])!
        let initialDitto = stringDitto.save(newValue: StringScalar(scalar: "Hello"))
        XCTAssert(initialDitto != nil)
        XCTAssert(initialDitto!.get() != nil)
        XCTAssert(initialDitto!.get()!.artifact != nil)
        XCTAssert(initialDitto!.get()!.artifact!.scalar == "Hello")
        let secondDitto = initialDitto!.save(newValue: StringScalar(scalar: "Hi"))
        XCTAssert(secondDitto != nil)
        XCTAssert(secondDitto!.get(previous: 1) != nil)
        XCTAssert(secondDitto!.get(previous: 1)!.artifact != nil)
        XCTAssert(secondDitto!.get(previous: 1)!.artifact!.scalar == "Hello")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
