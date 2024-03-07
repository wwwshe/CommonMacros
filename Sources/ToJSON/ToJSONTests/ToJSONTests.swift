//
//  ToJSONTests.swift
//  
//
//  Created by jun wook on 3/7/24.
//

import XCTest
@testable import ToJSON

final class ToJSONTests: XCTestCase {
    
    func testJSONMacro() throws {
        let result = "{\"test\":\"1\"}"
        let dic = [
            "test": "1"
        ]
        let json = #toJSON(dic)
        XCTAssertEqual(json, result)
    }

}
