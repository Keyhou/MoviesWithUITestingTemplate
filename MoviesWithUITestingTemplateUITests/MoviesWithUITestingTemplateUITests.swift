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
    
//    func testListView() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        let movies = MoviesData().movies
//        let navBarTitle = app.navigationBars["Movies"]
//        let navToolBarButton = app.navigationBars.element.buttons.element
//        let searchBar = app.searchFields.firstMatch
//        let listMovie = app.collectionViews["movieList"]
//        let systemImage = app.collectionViews.element.images.element
//        //first movie (Les infiltrés)
//        let firstMovie = app.collectionViews.element.staticTexts[movies[0].title]
//        let firstMovieYear = app.collectionViews.element.staticTexts["(\(movies[0].year))"]
//
//        //second movie (Inception)
//        let secondMovie = app.collectionViews.element.staticTexts[movies[1].title]
//        let secondMovieYear = app.collectionViews.element.staticTexts["(\(movies[1].year))"]
//
//        //third movie (The Revenant)
//        let thirdMovie = app.collectionViews.element.staticTexts[movies[2].title]
//        let thirdMovieYear = app.collectionViews.element.staticTexts["(\(movies[2].year))"]
//        app.launch()
//        navToolBarButton.tap()
//        firstMovie.tap()
//        //        searchBar.tap()
//        //        searchBar.typeText("Incep")
//
//        //Check if a List View exists
//        XCTAssert(navBarTitle.exists)
//        XCTAssert(navToolBarButton.exists)
//        XCTAssert(searchBar.exists)
//        XCTAssertEqual(searchBar.placeholderValue, "Titre de film")
//        XCTAssert(listMovie.exists)
//
//        XCTAssertEqual(listMovie.cells.count, 3, "Expected 3 cells but found \(listMovie.cells.count)")
//        XCTAssertEqual(firstMovie.label, "Les infiltrés")
//        XCTAssertEqual(firstMovieYear.label, "(2006)")
//        XCTAssertEqual(secondMovie.label, "Inception")
//        XCTAssertEqual(secondMovieYear.label, "(2010)")
//        XCTAssertEqual(thirdMovie.label, "The Revenant")
//        XCTAssertEqual(thirdMovieYear.label, "(2015)")
//        XCTAssert(systemImage.exists)
//        //        XCTAssertEqual(systemImage.label, "film")
//    }
    
//    func testDetailView() throws {
//        let app = XCUIApplication()
//        let movies = MoviesData().movies
//        let secondRow = app.collectionViews.element.staticTexts[movies[1].title]
//        
//        
//        //movieTitle
//        let movieTitle = app.staticTexts["movieTitle"]
//        XCTAssert(movieTitle.exists)
//        
//        //movieDirector
//        let movieDirector = app.staticTexts["movieDirector"]
//        XCTAssert(movieDirector.exists)
//        
//        //movieYear
//        let movieYearLaunch = app.staticTexts["movieYear"]
//        XCTAssert(movieYearLaunch.exists)
//        
//        //movieAvatar
//        let movieAvatar =  app.images.element
//        XCTAssert(movieAvatar.exists)
//        
//        //movieDescription
//        let scrollView = app.scrollViews.element
//        XCTAssert(scrollView.exists)
//        XCTAssert(scrollView.isHittable)
//        scrollView.swipeUp()
//        scrollView.swipeDown()
//        
//        let movieGenre = app.staticTexts["movieGenre"]
//        XCTAssert(movieGenre.exists)
//        let moviePitch = app.staticTexts["moviePitch"]
//        XCTAssert(moviePitch.exists)
//        secondRow.tap()
//        
//        //backButton
//        let backButton = app.navigationBars.buttons["Movies"]
//        XCTAssert(backButton.exists)
//        backButton.tap()
//        
//    }
    
    func testAddMovie() throws {
        let vm = MoviesData()
        // 1 - Compter le nombre de film dans la BDD au préalable
        let moviesCount = vm.movies.count
        
        // 2 - Instancier un nouveau film
        let testMovie = Movie(title: "Mulholland Drive", director: "David Lynch", image: "", pitch: "Un violent accident de voiture sur la route de Mulholland Drive sauve une femme de ses poursuivants. Hagarde, la belle s’enfonce dans la nature et se réfugie dans une demeure inoccupée. Le lendemain, Betty Elms débarque à l’aéroport de Los Angeles. Actrice, elle compte bien devenir une star, et sa tante, partie sur un tournage, lui prête son appartement. Dans la salle de bains, Betty découvre avec surprise l’accidentée, terrée et terrifiée. Prise de compassion pour l’infortunée, qui se révèle amnésique, elle décide de l’héberger tout en l’aidant à retrouver peu à peu des bribes de son passé. Leurs seuls indices résident dans un sac rempli d’argent et une mystérieuse clé bleue...", year: 2001, genre: .thriller, isFavorite: false)
        
        // 3 - Appeler la fonction pour créer un nouveau film
        vm.AddMovie(title: testMovie.title, director: testMovie.director, pitch: testMovie.pitch, year: testMovie.year, genre: testMovie.genre)
        
        // 4 - Vérifier que le nouveau est dans la BDD
        XCTAssertEqual(vm.movies.count, moviesCount + 1)
        XCTAssertEqual(vm.movies.last!.title, testMovie.title)
        XCTAssertEqual(vm.movies.last!.director, testMovie.director)
        XCTAssertEqual(vm.movies.last!.image, testMovie.image)
        XCTAssertEqual(vm.movies.last!.pitch, testMovie.pitch)
        XCTAssertEqual(vm.movies.last!.year, testMovie.year)
        XCTAssertEqual(vm.movies.last!.genre, testMovie.genre)
        XCTAssertEqual(vm.movies.last!.isFavorite, testMovie.isFavorite)
    }
    
    func textTabView() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tabBarsQuery = app.tabBars
        let firstTab = tabBarsQuery.buttons.element(boundBy: 0)
        let secondTab = tabBarsQuery.buttons.element(boundBy: 1)
//        let imageFirstTab = firstTab.staticTexts["image1tab"]
        
        XCTAssert(firstTab.exists)
        XCTAssert(secondTab.exists)
//        XCTAssert(imageFirstTab)
        XCTAssertEqual(firstTab.images.element(boundBy: 0).label, "film.circle.fill")
        
//        XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
        
        firstTab.tap()
        secondTab.tap()

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
