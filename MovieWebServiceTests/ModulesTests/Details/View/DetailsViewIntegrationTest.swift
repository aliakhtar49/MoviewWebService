//
//  DetailsViewIntegrationTests.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import XCTest

@testable import MovieWebService

class DetailsViewIntegrationTests: XCTestCase {

    var presenter: DetailsPresenter!
     var viewController: DetailsViewController!
    
    override func setUp() {
        super.setUp()
        
        presenter =  DetailsPresenter(FilmModelStub.buildFilmModelStub())
        let sb = UIStoryboard(name: "MoviewDetailView", bundle: nil)
         viewController = sb.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        viewController.presenter = presenter
        presenter.view = viewController
    }

    override func tearDown() {
          presenter = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func testThatLoginViewControllerExists() {
        XCTAssertNotNil(viewController, "a DetailsViewController instance should be creatable from storyboard")
    }
    func testIfViewLoadedProperlyWhenViewDidLoadIsCalled() {
        
        viewController.viewDidLoad()
        XCTAssertTrue(viewController.actorName.text == "Bryan Cranston")
        XCTAssertTrue(viewController.actorNameTitle.text == DetailScreenConstants.actorNameTitle)
         XCTAssertTrue(viewController.directorName.text == "Ben Affleck")
        XCTAssertTrue(viewController.directorTitle.text == DetailScreenConstants.directorNameTitle)
        XCTAssertTrue(viewController.actorScreenName.text == "Jack Donnell")
        XCTAssertTrue(viewController.actorScreenNameTitle.text == DetailScreenConstants.actorScreenNameTitle)
    }
    

    func testIfViewIsReadyEventGetCalledWhenViewDidLoadIsCalledss() {

        viewController.didReceiveTouch()
        XCTAssertFalse(viewController.actorNameTitle.isHidden)
        XCTAssertFalse(viewController.actorName.isHidden)
        XCTAssertFalse(viewController.actorScreenNameTitle.isHidden)
        XCTAssertFalse(viewController.actorScreenName.isHidden)
        XCTAssertTrue(viewController.tapToShowMore.text == DetailScreenConstants.showLessActionTitle)
    }
    func testIfNavigationTitleProperlySetWhenViewDidLoadIsCalled() {
        
        viewController.viewDidLoad()
        XCTAssertTrue(viewController.navigationItem.title == "Details")
        
    }

}
