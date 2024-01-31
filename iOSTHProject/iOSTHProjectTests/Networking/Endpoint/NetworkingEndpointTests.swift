//
//  NetworkingEndpointTests.swift
//  iOSTHProjectTests
//
//  Created by Thomas Cowern on 1/31/24.
//

import XCTest
@testable import iOSTHProject

final class NetworkingEndpointTests: XCTestCase {

    func test_with_people_endpoint_request_is_valid() {
        let peopleEndpoint = Endpoints.people(page: 1)
        
        XCTAssertEqual(peopleEndpoint.host, "reqres.in", "The host should be reqres.in")
        XCTAssertEqual(peopleEndpoint.path, "/api/users", "The path should be /api/users")
        XCTAssertEqual(peopleEndpoint.methodType, .GET, "The method type should be .GET")
        XCTAssertEqual(peopleEndpoint.queryItems, ["page":"1"], "Query items should be page 1")
        
        XCTAssertEqual(peopleEndpoint.url?.absoluteString, "https://reqres.in/api/users?page=1&delay=5", "Url should be https://reqres.in/api/users?page=1&delay=5")
    }
    
    func test_with_detail_endpoint_request_is_valid() {
        XCTFail()
    }
    
    func test_with_create_endpoint_request_is_valid() {
        XCTFail()
    }

}
