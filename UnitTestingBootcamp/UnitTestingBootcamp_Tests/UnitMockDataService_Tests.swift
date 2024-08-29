//
//  UnitMockDataService_Tests.swift
//  UnitTestingBootcamp_Tests
//
//  Created by Thomas Cowern on 8/29/24.
//

import XCTest
@testable import UnitTestingBootcamp
import Combine

final class UnitMockDataService_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_NewMockDataService_init_doesSetValuesCorrectly() {
        // Given
        let items: [String]? = nil
        
        // When
        let dataService = NewMockDataService(items: items)

        // Then
        XCTAssertFalse(dataService.items.isEmpty)
    }
}
