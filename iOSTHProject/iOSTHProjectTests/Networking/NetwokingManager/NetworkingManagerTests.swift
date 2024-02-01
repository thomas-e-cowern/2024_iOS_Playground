//
//  NetworkingManagerTests.swift
//  iOSTHProjectTests
//
//  Created by Thomas Cowern on 2/1/24.
//

import XCTest
@testable import iOSTHProject

class NetworkingManagerTests: XCTestCase {
    
    private var session: URLSession!
    private var url: URL!
    
    override func setUp() {
        url = URL(string: "https://reqres.in/api/users")
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockUrlSessionProtocol.self]
        session = URLSession(configuration: configuration)
    }
    
    override func tearDown() {
        session = nil
        url = nil
    }

    func test_with_successful_response_is_valid() async throws {
        guard let path = Bundle.main.path(forResource: "UsersStaticData", ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            XCTFail("Failed to get static users file")
            return
        }
        
        MockUrlSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url, statusCode: 200, httpVersion: nil, headerFields: nil)
            return (response!, data)
        }
        
        let result = try await NetworkingManager.shared.request(session: session, .people(page: 1), type: UsersResponse.self)
        
        let staticJson = try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
        
        XCTAssertEqual(result, staticJson, "The returned response should be decoded successfully")
    }

}
