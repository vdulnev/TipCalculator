//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Viacheslav Dulnev on 25.01.2022.
//

import XCTest

class TipCalculatorUITests: XCTestCase {
    var app: XCUIApplication!
    var contentViewPage: ContentViewPage!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDefaultTotalValue() throws {
        // UI tests must launch the application that they test.
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let textField = contentViewPage.enterTottalTextField
        XCTAssertEqual(textField.value as! String, "Enter total")
    }
    
    func testDefaultTipValue() {
        let selector = contentViewPage.tipSelector
        let button = selector.buttons.element(boundBy: 1)
        XCTAssertEqual(button.label, "20%")
        XCTAssertEqual(button.isSelected, true)
    }
    
    func testCalcTip() {
        let totalTextField = contentViewPage.enterTottalTextField
        totalTextField.tap()
        totalTextField.typeText("100")
        
        let calcTipButton = contentViewPage.calcTipButton
        calcTipButton.tap()
        
        let tipText = contentViewPage.tipText
        let _ = tipText.waitForExistence(timeout: 1.0)
        XCTAssertEqual(tipText.label, "$20.00")
    }
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
