//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Viacheslav Dulnev on 25.01.2022.
//

import Foundation
import XCTest

class ContentViewPage {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var enterTottalTextField: XCUIElement {
        app.textFields["EnterTottalTextField"]
    }
    
    var tipSelector: XCUIElement {
        app.segmentedControls["TipSelector"]
    }
    
    var calcTipButton: XCUIElement {
        app.buttons["calcTipButton"]
    }
    
    var tipText: XCUIElement {
        app.staticTexts["tipText"]
    }
}
