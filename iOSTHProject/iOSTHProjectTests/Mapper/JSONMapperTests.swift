//
//  JSONMapperTests.swift
//  iOSTHProjectTests
//
//  Created by Thomas Cowern on 1/30/24.
//

import Foundation
import XCTest
@testable import iOSTHProject

class JSONMapperTests: XCTestCase {
    func test_with_valid_json_successfully_decodes() {
        XCTAssertNoThrow(try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self), "Mapper shouldn't throw and error")
        
        let userResponse = try? StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
        XCTAssertNotNil(userResponse, "User response is not nil")
        
        // Header data
        XCTAssertEqual(userResponse?.page, 2, "Page number should be 2")
        XCTAssertEqual(userResponse?.perPage, 6, "Per page should be 6")
        XCTAssertEqual(userResponse?.total, 12, "Total should be 12")
        XCTAssertEqual(userResponse?.totalPages, 2, "Total pages should be 2")
        
        // Data
        XCTAssertEqual(userResponse?.data.count, 6, "Totol users should be 6")
        
        XCTAssertEqual(userResponse?.data[0].id, 7, "The id should be 7")
        XCTAssertEqual(userResponse?.data[0].email, "michael.lawson@reqres.in", "The email should be michael.lawson@reqres.in")
        XCTAssertEqual(userResponse?.data[0].firstName, "Michael", "firstName should be Michael")
        XCTAssertEqual(userResponse?.data[0].lastName, "Lawson", "firstName should be Lawson")
        XCTAssertEqual(userResponse?.data[0].avatar, "https://reqres.in/img/faces/7-image.jpg", "Avatar url should be https://reqres.in/img/faces/7-image.jpg")

    }
    
    func test_with_missing_file_error_throws() {
        XCTFail()
    }
    
    func test_with_invalid_json_error_throws() {
        XCTFail()
    }
}
