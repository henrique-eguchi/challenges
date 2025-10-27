//
//  NTestUITests.swift
//  NTestUITests
//
//  Created by A great candidate :D on 25/10/25.
//

import XCTest

final class NTestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testURLShorteningFlow() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Wait for app to load
        let urlTextField = app.textFields["Enter URL to shorten"]
        XCTAssertTrue(urlTextField.waitForExistence(timeout: 5))
        
        // Enter any url
        urlTextField.tap()
        urlTextField.typeText("https://www.example.com")

        // Tap shorten button
        let shortenButton = app.buttons["Shorten"]
        XCTAssertTrue(shortenButton.waitForExistence(timeout: 5))
        shortenButton.tap()
        
        // Verify if the URL appears in the list (using contains for now)
        let searchText = "com/api/alias/"
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", searchText)
        let elementQuery = app.staticTexts.containing(predicate)
        XCTAssertTrue(elementQuery.element.waitForExistence(timeout: 10))
        
        let originalURLText = app.staticTexts["https://www.example.com"]
        XCTAssertTrue(originalURLText.waitForExistence(timeout: 5))
    }

    @MainActor
    func testEmptyURLDoesNotShorten() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Check that the shorten button is disabled when URL field is empty
        let shortenButton = app.buttons["Shorten"]
        XCTAssertTrue(shortenButton.waitForExistence(timeout: 5))
        XCTAssertFalse(shortenButton.isEnabled)
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
