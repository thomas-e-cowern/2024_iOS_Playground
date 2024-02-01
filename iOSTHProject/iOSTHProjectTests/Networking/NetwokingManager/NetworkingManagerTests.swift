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
    
    func test_with_successful_response_void_is_valid() async throws {
        MockUrlSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url, statusCode: 200, httpVersion: nil, headerFields: nil)
            return (response!, nil)
        }
        
        _ = try await NetworkingManager.shared.request(session: session, .people(page: 1))
    }
    
    func test_with_unsuccessful_response_code_range_is_invalid() async {
        MockUrlSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url, statusCode: 400, httpVersion: nil, headerFields: nil)
            return (response!, nil)
        }
        
        do {
            _ = try await NetworkingManager.shared.request(session: session, .people(page: 1), type: UsersResponse.self)
            return
        } catch {
            guard let networkingError = error as? NetworkingManager.NetworkingError else {
                XCTFail("Wrong type of error, expecting networking manager networking error")
                return
            }
            
            XCTAssertEqual(networkingError, NetworkingManager.NetworkingError.invalidStatusCode(statusCode: 400), "Error should be a networking error which throws an invalid status code")
        }
    }

    func test_with_unsuccessful_response_code_void_in_invalid_range_is_invalid() async {
        MockUrlSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url, statusCode: 400, httpVersion: nil, headerFields: nil)
            return (response!, nil)
        }
        
        do {
            _ = try await NetworkingManager.shared.request(session: session, .people(page: 1))
            return
        } catch {
            guard let networkingError = error as? NetworkingManager.NetworkingError else {
                XCTFail("Wrong type of error, expecting networking manager networking error")
                return
            }
            
            XCTAssertEqual(networkingError, NetworkingManager.NetworkingError.invalidStatusCode(statusCode: 400), "Error should be a networking error which throws an invalid status code")
        }
    }
    
    func test_with_successful_response_code_with_invalid_json() async {
        guard let path = Bundle.main.path(forResource: "UsersStaticData", ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            XCTFail("Failed to get static users file")
            return
        }
        
        MockUrlSessionProtocol.loadingHandler = {
            let response = HTTPURLResponse(url: self.url, statusCode: 200, httpVersion: nil, headerFields: nil)
            return (response!, data)
        }
        
        do {
            _ = try await NetworkingManager.shared.request(session: session, .people(page: 1), type: UserDetailResponse.self)
        } catch {
            if error is NetworkingManager.NetworkingError {
                XCTFail("The error should be a system decoding error")
            }
        }
    }
}
