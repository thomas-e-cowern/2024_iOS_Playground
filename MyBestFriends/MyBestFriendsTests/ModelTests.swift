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
        let contact = Contact.empty(context: provider.viewContext)
        XCTAssertFalse(contact.isValid)
    }
    
    func testContactIsValid() {
        let contact = Contact.preview(context: provider.viewContext)
        XCTAssertTrue(contact.isValid)
    }
    
    func testContactsBirthdayIsValid() {
        let contact = Contact.preview(context: provider.viewContext)
        XCTAssertTrue(contact.isBirthday)
    }
    
    func testContactsBirthdayIsNatValid() throws {
        let contact = try XCTUnwrap(Contact.makePreview(count: 2, in: provider.viewContext).last)
        XCTAssertFalse(contact.isBirthday)
    }
    
    func testMakeContactsPreviewIsValid() {
        let count = 5
        let contacts = Contact.makePreview(count: 5, in: provider.viewContext)
        
        for i in 0..<contacts.count {
            let item = contacts[i]
            XCTAssertEqual(item.name, "name \(i)")
            XCTAssertEqual(item.email, "name\(i)@email.com")
            XCTAssertNotNil(item.favorite)
            XCTAssertEqual(item.phone, "14\(i)-\(i)98-20\(i)5")
            XCTAssertEqual(item.notes, "This is the note for contact \(i)")
            
            let dateToCompare = Calendar.current.date(byAdding: .day, value: -i, to: .now)
            let dobDay = Calendar.current.dateComponents([.day], from: item.dob, to: dateToCompare!).day
            
            XCTAssertEqual(dobDay, 0)
        }
    }
    
    func testFilterFaveContactsRequestIsValid() {
        let request = Contact.filter(with: .init(filter: .fave))
        XCTAssertEqual("favorite == 1", request.predicateFormat)
    }
    
    func testFilterAllFavContactsRequestIsValid() {
        let request = Contact.filter(with: .init(filter: .all))
        XCTAssertEqual("TRUEPREDICATE", request.predicateFormat)
    }
    
    func testFilterAllWithQueryContactRequestIsValid() {
        let query = "tunds"
        let request = Contact.filter(with: .init(query: query))
        XCTAssertEqual("name CONTAINS[cd] \"\(query)\"", request.predicateFormat)
    }
    
    func testFilterFavWithQueryContactRequestIsValid() {
        let query = "tunds"
        let request = Contact.filter(with: .init(filter: .fave, query: query))
        XCTAssertEqual("name CONTAINS[cd] \"\(query)\" AND favorite == 1", request.predicateFormat)
    }
}
