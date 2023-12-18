//
//  UITestPracticeUITests.swift
//  UITestPracticeUITests
//
//  Created by 노주영 on 12/18/23.
//

import XCTest

final class UITestPracticeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //해당 텍스트 있는지 확인
        //let welcome = app.staticTexts["로그인 해주세요"]
        //XCTAssert(welcome.exists)
        
        let welcome = app.staticTexts.element
        
        XCTAssert(welcome.exists)
        XCTAssertEqual(welcome.label, "로그인 해주세요")
    }
    
    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        //let login = app.buttons["로그인"]
        //XCTAssert(login.exists)
        
        let login = app.buttons["loginButton"]
        
        XCTAssert(login.exists)
        
        //버튼의 라벨을 확인
        XCTAssertEqual(login.label, "로그인")
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
