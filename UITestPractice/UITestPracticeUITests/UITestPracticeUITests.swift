//
//  UITestPracticeUITests.swift
//  UITestPracticeUITests
//
//  Created by 노주영 on 12/18/23.
//

import XCTest

final class UITestPracticeUITests: XCTestCase {
    let app = XCUIApplication()
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        //해당 텍스트 있는지 확인
        //let welcome = app.staticTexts["로그인 해주세요"]
        //XCTAssert(welcome.exists)
        
        let welcome = app.staticTexts.element
        
        XCTAssert(welcome.exists)
        XCTAssertEqual(welcome.label, "로그인 해주세요")
    }
    
    func testLoginViewApperance() throws {
        app.buttons["loginButton"].tap()
        
        let loginButton = app.buttons["로그인"]
        XCTAssert(loginButton.waitForExistence(timeout: 0.5))
    }
    
    func testUserName() throws {
        app.buttons["loginButton"].tap()
        
        let name = app.textFields["이름"]
        name.tap()
        name.typeText("test")
        
        XCTAssertNotEqual(name.value as! String, "")
    }
    
    func testPassword() throws {
        app.buttons["loginButton"].tap()
        
        app.secureTextFields.element.tap()
        app.secureTextFields.element.typeText("1234")
        
        XCTAssertNotEqual(app.secureTextFields.element.value as! String, "")
    }
    
    func testLogin() throws {
        app.buttons["loginButton"].tap()
        
        let name = app.textFields["이름"]
        name.tap()
        name.typeText("test")
        
        app.secureTextFields.element.tap()
        app.secureTextFields.element.typeText("1234")
        
        let login = app.buttons["login"]
        login.tap()
        
        XCTAssertFalse(login.waitForExistence(timeout: 0.5))
    }
    
    func testFailedLoginAlert() throws {
        app.buttons["loginButton"].tap()
        
        let name = app.textFields["이름"]
        name.tap()
        name.typeText("test")
        
        let login = app.buttons["login"]
        login.tap()
        
        let okButton = app.buttons["passwordYes"]
        okButton.tap()
        
        XCTAssertFalse(okButton.waitForExistence(timeout: 0.5))
    }
    
    func testLogout() throws {
        XCTAssertEqual(app.buttons["loginButton"].label, "로그인")
        try testLogin()
        
        XCTAssertEqual(app.buttons["loginButton"].label, "로그아웃")
        let login = app.buttons["loginButton"]
        login.tap()
        
        XCTAssert(login.waitForExistence(timeout: 0.5))
        
        let logout = app.buttons["logout"]
        logout.tap()
        
        XCTAssertFalse(logout.waitForExistence(timeout: 0.5))
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
