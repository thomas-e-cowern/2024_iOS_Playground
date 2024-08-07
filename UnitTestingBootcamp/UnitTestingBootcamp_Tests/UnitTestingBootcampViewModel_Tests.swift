//
//  UnitTestingBootcampViewModel_Tests.swift
//  UnitTestingBootcamp_Tests
//
//  Created by Thomas Cowern on 8/7/24.
//

import XCTest
@testable import UnitTestingBootcamp

// Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior

// Testing structre: Given, When, Then

final class UnitTestingBootcampViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func text_UnitTestingBootcampViewModel_isPremium_shouldBeTrue() {
        // Given
        let userIsPremium: Bool = true
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
    }

}
