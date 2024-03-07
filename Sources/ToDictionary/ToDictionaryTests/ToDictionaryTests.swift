
import XCTest
@testable import ToDictionary

final class ToDictionaryTests: XCTestCase {
    struct TestStruct: Encodable {
        let name: String
    }
    
    func testDictionaryMacro() throws {
        let result: [String: String] = ["name": "Test"]
        let testStruct = TestStruct(name: "Test")
        let dic = #toDictionary(testStruct) as? [String: String] ?? [:]
        XCTAssertEqual(dic, result)
    }
    
    func testDictionaryMacro2() throws {
        let result: [String: String] = ["name": "Test"]
        let testString = "{\"name\":\"Test\"}"
        let dic = #toDictionary(testString) as? [String: String] ?? [:]
        XCTAssertEqual(dic, result)
    }
}
