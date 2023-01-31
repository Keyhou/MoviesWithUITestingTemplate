//
//  MoviesWithUITestingTemplateUITests.swift
//  MoviesWithUITestingTemplateUITests
//
//  Created by Julie Collazos on 26/01/2023.
//

import XCTest

final class MoviesWithUITestingTemplateUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testListView() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        let movies = MoviesData().movies
        let navBarTitle = app.navigationBars["Movies"]
        let navToolBarButton = app.navigationBars.element.buttons.element
        let searchBar = app.searchFields.firstMatch
        let listMovie = app.collectionViews["movieList"]
        let systemImage = app.collectionViews.element.images.element
        //first movie (Les infiltrés)
        let firstMovie = app.collectionViews.element.staticTexts[movies[0].title]
        let firstMovieYear = app.collectionViews.element.staticTexts["(\(movies[0].year))"]
        
        //second movie (Inception)
        let secondMovie = app.collectionViews.element.staticTexts[movies[1].title]
        let secondMovieYear = app.collectionViews.element.staticTexts["(\(movies[1].year))"]
        
        //third movie (The Revenant)
        let thirdMovie = app.collectionViews.element.staticTexts[movies[2].title]
        let thirdMovieYear = app.collectionViews.element.staticTexts["(\(movies[2].year))"]
        app.launch()
        navToolBarButton.tap()
        firstMovie.tap()
        //        searchBar.tap()
        //        searchBar.typeText("Incep")
        
        //Check if a List View exists
        XCTAssert(navBarTitle.exists)
        XCTAssert(navToolBarButton.exists)
        XCTAssert(searchBar.exists)
        XCTAssertEqual(searchBar.placeholderValue, "Titre de film")
        XCTAssert(listMovie.exists)
        
        XCTAssertEqual(listMovie.cells.count, 3, "Expected 3 cells but found \(listMovie.cells.count)")
        XCTAssertEqual(firstMovie.label, "Les infiltrés")
        XCTAssertEqual(firstMovieYear.label, "(2006)")
        XCTAssertEqual(secondMovie.label, "Inception")
        XCTAssertEqual(secondMovieYear.label, "(2010)")
        XCTAssertEqual(thirdMovie.label, "The Revenant")
        XCTAssertEqual(thirdMovieYear.label, "(2015)")
        XCTAssert(systemImage.exists)
        //        XCTAssertEqual(systemImage.label, "film")
    }
    
    func testSearchBar() throws {
            let app = XCUIApplication()
            app.launch()

            //1
            let searchRow = app.searchFields.firstMatch
            let cancelButton = app.buttons["Cancel"]
            let firstM = app.collectionViews.element.staticTexts["Inception"]

            //2
            searchRow.tap()
            cancelButton.tap()
            searchRow.tap()
            XCTAssert(searchRow.waitForExistence(timeout: 5))
            
            //3
            searchRow.typeText("Incep")
    //        searchRow.typeText("I")
    //        searchRow.typeText("n")
    //        searchRow.typeText("c")
    //        searchRow.typeText("e")
    //        searchRow.typeText("p")
            XCTAssertEqual(firstM.label, "Inception")
            XCTAssert(firstM.waitForExistence(timeout: 5))
            XCTAssert(firstM.exists)
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
