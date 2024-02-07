//
//  ModelTests.swift
//  MyBestFriendsTests
//
//  Created by Thomas Cowern on 2/7/24.
//

import XCTest
@testable import MyBestFriends

final class ModelTests: XCTestCase {
    
    private var provider: ContactsProvider!
    
    override func setUp() {
        provider = .shared
    }
    
    override func tearDown() {
        provider = nil
    }

    func testContactIsEmpty() {
        
        let contact = Contact.empty(context: provider.viewContext)
        XCTAssertEqual(contact.name, "")
        XCTAssertEqual(contact.phone, "")
        XCTAssertEqual(contact.email, "")
        XCTAssertFalse(contact.favorite)
        XCTAssertTrue(Calendar.current.isDateInToday(contact.dob))
        
    }
    
    func testContactIsNotValid() {
        
    }
    
    func testContactIsValid() {
        
    }
    
    func testContactsBirthdayIsValid() {
        
    }
    
    func testMakeContactsPreviewIsValid() {
        
    }
    
    func testFilterFaveContactsRequestIsValid() {
        
    }
    
    func testFilterAllFavContactsRequestIsValid() {
        
    }
    
    func testFilterAllWithQueryContactRequestIsValid() {
        
    }
    
    func testFilterFavWithQueryContactRequestIsValid() {
        
    }
}
