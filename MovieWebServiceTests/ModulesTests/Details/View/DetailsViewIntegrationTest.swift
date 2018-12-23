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
        
        let mockData: [String : Any] = [
            "filmRating": 3, "languages":  ["English","Thai"],
            "nominated":  1,
            "releaseDate": 1350000000,
            "cast":  [
                [
                    "dateOfBirth":  -436147200,
                    "nominated":  1,
                    "name":  "Bryan Cranston",
                    "screenName":  "Jack Donnell",
                    "biography":  "Bryan Lee Cranston is an American actor, voice actor, writer and director."
                ]
            ],
            "name":  "Argo",
            "rating":  7.8,
            "director":  [
                "dateOfBirth":  82684800,
                "nominated":  1,
                "name":  "Ben Affleck",
                "biography":  "Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
            ]
        ]

        
        
        presenter =  DetailsPresenter(Film(data: mockData))
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
