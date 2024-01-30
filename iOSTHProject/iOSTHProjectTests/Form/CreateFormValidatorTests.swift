//
//  CreateFormValidatorTests.swift
//  iOSTHProjectTests
//
//  Created by Thomas Cowern on 1/30/24.
//

import XCTest
@testable import iOSTHProject

final class CreateFormValidatorTests: XCTestCase {
    
    private var validator: CreateValidator!
    
    override func setUp() {
        validator = CreateValidator()
    }
    
    override func tearDown() {
        validator = nil
    }
    
    
    func test_with_empty_person_first_name_error_thrown() {
        let person = NewPerson(firstName: "", lastName: "", job: "")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty first name should be thrown")

        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                
                XCTFail("Wrong type of error expecting create validator error")
                return
            }
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidFirstName, "Expecting and error where we have an invalid first name")
        }
    }
    
    func test_with_empty_first_name_error_thrown() {
        let person = NewPerson(firstName: "", lastName: "Jones", job: "Comic")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty first name should be thrown")

        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                
                XCTFail("Wrong type of error expecting create validator error")
                return
            }
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidFirstName, "Expecting and error where we have an invalid first name")
        }
    }
    
    func test_with_empty_last_name_error_thrown() {
        let person = NewPerson(firstName: "John", lastName: "", job: "Comic")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty last name should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                
                XCTFail("Wrong type of error expecting create validator error")
                return
            }
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidLastName, "Expecting and error where we have an invalid last name")
        }
    }
    
    func test_with_empty_job_error_thrown() {
        let person = NewPerson(firstName: "John", lastName: "Smith", job: "")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty job should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                
                XCTFail("Wrong type of error expecting create validator error")
                return
            }
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidJob, "Expecting and error where we have an invalid job")
        }
    }
    
    func test_with_valid_person_error_not_thrown() {
        let person = NewPerson(firstName: "John", lastName: "Smith", job: "Comic")
        
        do {
            _ = try validator.validate(person)
        } catch {
            XCTFail("No error should be thrown, all info present")
        }
    }
}
