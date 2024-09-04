//
//  UITestingBootcampView_UITests.swift
//  UITestingBootcamp_UITests
//
//  Created by Thomas Cowern on 8/30/24.
//

import XCTest

// Name Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Name Structure: test_[struct or class]_[variable or function or UIComponent]_[expected result]

// Testing Structure: Given, When, Then

final class UITestingBootcampView_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
        // Given
        let textField = app.textFields["Sign up text field"]
        
        // When
        textField.tap()

        let signupButton = app.buttons["Sign up button"]
        signupButton.tap()
        
        let welcomeText = app.navigationBars["Welcome"].staticTexts["Welcome"]
        
        // Then
        XCTAssertFalse(welcomeText.exists)
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        
        // Given
        let textField = app.textFields["Sign up text field"]
        
        // When
        textField.tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["B"]/*[[".keyboards.keys[\"B\"]",".keys[\"B\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        
        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()

        let bKey2 = app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey2.tap()

        let signupButton = app.buttons["Sign up button"]
        signupButton.tap()
        
        let welcomeText = app.navigationBars["Welcome"].staticTexts["Welcome"]
        
        // Then
        XCTAssertTrue(welcomeText.exists)

    }
    
    func test_SignedInHomeView_ShowAlertButton_shouldDisplayAlert() {
        
        // Given
        let signUpTextFieldTextField = app/*@START_MENU_TOKEN@*/.textFields["Sign up text field"]/*[[".textFields[\"Add your name...\"]",".textFields[\"Sign up text field\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        // When
        signUpTextFieldTextField.tap()

        app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()
        aKey.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Sign up button"]/*[[".buttons[\"Sign Up\"]",".buttons[\"Sign up button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["Show welcome message"].tap()
//        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()

        let signupAlert = app.alerts["Welcome"].scrollViews.otherElements.buttons["OK"]
        
        // Then
        XCTAssertTrue(signupAlert.exists)
        
        
       
        
    }
    
    func test_SignedInHomeView_ShowAlertButton_shouldDisplayAndDismissAlert() {
        
    }
}
