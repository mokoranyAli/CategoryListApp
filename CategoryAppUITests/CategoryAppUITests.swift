//
//  CategoryAppUITests.swift
//  CategoryAppUITests
//
//  Created by Mohamed Korany Ali on 02/12/2023.
//

import XCTest
@testable import CategoryApp

final class CategoryAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["ui-testing"]
        app.launch()
    }
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testApp_whenAppOpened_shouldShowSplash() {
        let splashLabelText = app.staticTexts["Swenson He Test App"]
        let splashYassirLogo = app.images["swenson-he-logo"]
        
        XCTAssertTrue(splashLabelText.exists)
        XCTAssertTrue(splashYassirLogo.exists)
    }
    
    func testApp_whenLoadData_shouldHas4Categories()  {
        
        let elementsQuery = app.scrollViews.otherElements
        let items = [
            elementsQuery.buttons["Staff"],
            elementsQuery.buttons["Decorations"],
            elementsQuery.buttons["Food"],
            elementsQuery.buttons["Drinks"]
        ]
        waitForListApperance(collection: elementsQuery)
        
        items.forEach {
            XCTAssertTrue($0.exists)
        }
    }
    
    
    func testApp_whenChooseCategory_showDetailsScreen()  {
        
        let elementsQuery = app.scrollViews.otherElements
        
        let decorationItem = elementsQuery.buttons["Decorations"]
        waitForListApperance(collection: elementsQuery)
        decorationItem.tap()
        
        
        waitForListApperance(collection: elementsQuery)
        let item =  elementsQuery.staticTexts["Tables and chairs"]
        XCTAssertTrue(item.exists) // just checked on Item from json file
        
        XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.swipeUp()
    }
    
    func testApp_whenChooseCategoryAndAddItem_showPrice()  {
        
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let decorationItem = elementsQuery.buttons["Decorations"]
        decorationItem.tap()
        
        
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Photobooth").children(matching: .other).element.children(matching: .button).matching(identifier: "AddItem").element(boundBy: 2).tap() // tap on Photobooth number 2 in json file
        
        waitForListApperance(collection: elementsQuery)
        let priceItem = elementsQuery.staticTexts["$750"]
        
        XCTAssertTrue(priceItem.exists)
    }
    
    
    func testApp_whenAddItemThenBackAndTapSave_goForEventSaved()  {
        
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        
        //waitForListApperance(collection: elementsQuery)
        let decorationItem = elementsQuery.buttons["Decorations"]
        decorationItem.tap()
        
        scrollViewsQuery.otherElements.containing(.staticText, identifier:"Photobooth").children(matching: .other).element.children(matching: .button).matching(identifier: "AddItem").element(boundBy: 2).tap() // tap on Photobooth number 2 in json file
        //
        let backButton = app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["BackBtn"]
        backButton.tap()
        
        let saveButton = elementsQuery.buttons["Save"]
        saveButton.tap()
        
        
        let eventSavedText = app.staticTexts["Event Saved!"]
        let priceItem = app.staticTexts["$750"]
        
        XCTAssertTrue(eventSavedText.exists)
        XCTAssertTrue(priceItem.exists)
        
    }
    
    func waitForListApperance(collection: XCUIElementQuery) {
        guard collection.element.waitForExistence(timeout: 5) else { // This is because the splash view takes time
            XCTFail()
            return
        }
    }
}
