////
////  DetailsPresenterTests.swift
////  MovieWebService
////
////  Created by Ali Akhtar on 11/04/2017.
////  Copyright © 2018 TestCompany. All rights reserved.
////
//
//
import XCTest

@testable import MovieWebService
class DetailsScreenMockInteractor: DetailScreenInteractorInputProtocol {
    var presenter: DetailScreenInteractorOutputProtocol?
}


class DetailScreenMockRouter: DetailScreenRouterProtocol {
    
   weak var viewController: DetailsViewController?
}

class DetailsPresenterTests: XCTestCase {
    var presenter: DetailsPresenter!
    var router: DetailScreenRouterProtocol!
    var interactor: DetailScreenInteractorInputProtocol!
    var view: DetailScreenMockView!
   
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
        
       
        router = DetailScreenMockRouter()
        interactor = DetailsScreenMockInteractor()
        view = DetailScreenMockView()
        presenter = DetailsPresenter(Film(data: mockData))

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
    }
    
    func testThatActorInitiallyCollapse() {
        
        presenter.viewIsReady()
        XCTAssertTrue(presenter.actorExpanded == false)
        
    }
  
    func testThatOnViewIsReadyEventViewMethodGetCalled() {
        
        view.showDirectorNameViewWithExpectation = expectation(description: "showDirectorNameViewWithExpectation")
        view.showDirectorTitleViewWithExpectation = expectation(description: "showDirectorTitleViewWithExpectation")
        view.showActorNameViewWithExpectation = expectation(description: "showActorNameViewWithExpectation")
        view.showActorNameTitleViewWithExpectation = expectation(description: "showActorNameTitleViewWithExpectation")
        view.showActorScreenNameViewWithExpectation = expectation(description: "showActorScreenNameViewWithExpectation")
        view.showActorScreenNameTitleViewWithExpectation = expectation(description: "showActorScreenNameTitleViewWithExpectation")
        
        view.showOrHideActorNameAndTitleWithExpectation = expectation(description: "showOrHideActorNameAndTitleWithExpectation")
        view.showOrHideActorScreenNameAndTitleWithExpectation = expectation(description: "showOrHideActorScreenNameAndTitleWithExpectation")
        view.showTapToShowViewMoreButtonTitleViewWithExpectation = expectation(description: "showTapToShowViewMoreButtonTitleViewWithExpectation")
        presenter.viewIsReady()
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testThatModelDataIsPopulated() {
        
      XCTAssertTrue(presenter.modelData.name == "Argo","Model Data is not populated properly")
      XCTAssertTrue(presenter.modelData.rating == 7.8,"Model Data is not populated properly")
      XCTAssertTrue((presenter.modelData.cast.first?.name)! == "Bryan Cranston","Model Data is not populated properly")
      XCTAssertTrue((presenter.modelData.cast.first?.screenName)! == "Jack Donnell","Model Data is not populated properly")
      XCTAssertTrue((presenter.modelData.director.name)! == "Ben Affleck","Model Data is not populated properly")
      
    }
    func testThatActorExpandedToggleStateWhenTapOnAddMoreButton() {
        
        presenter.didTapOnAddMoreButton()
        XCTAssertTrue(presenter.actorExpanded == true)
    }
    func testThatActorNameAndTitleHideAndShowingWhenTapOnAddMoreButton() {
        
        view.showOrHideActorNameAndTitleWithExpectation = expectation(description: "showOrHideActorNameAndTitleWithExpectation")
        view.showOrHideActorScreenNameAndTitleWithExpectation = expectation(description: "showOrHideActorScreenNameAndTitleWithExpectation")
        view.showTapToShowViewMoreButtonTitleViewWithExpectation = expectation(description: "showTapToShowViewMoreButtonTitleViewWithExpectation")
        presenter.didTapOnAddMoreButton()
        waitForExpectations(timeout: 5, handler: nil)
    }
    

    override func tearDown() {
        router = nil
        interactor = nil
        view = nil
        presenter = nil
        super.tearDown()
    }

}
