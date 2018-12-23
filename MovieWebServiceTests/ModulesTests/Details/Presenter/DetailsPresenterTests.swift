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
    
        router = DetailScreenMockRouter()
        interactor = DetailsScreenMockInteractor()
        view = DetailScreenMockView()
        presenter = DetailsPresenter(FilmModelStub.buildFilmModelStub())

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
    }
    
    func testThatActorInitiallyCollapse() {

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

    func testThatActorNameAndTitleHideAndShowingWhenTapOnAddMoreButton() {
        
        view.showOrHideActorNameAndTitleWithExpectation = expectation(description: "showOrHideActorNameAndTitleWithExpectation")
        view.showOrHideActorScreenNameAndTitleWithExpectation = expectation(description: "showOrHideActorScreenNameAndTitleWithExpectation")
        view.showTapToShowViewMoreButtonTitleViewWithExpectation = expectation(description: "showTapToShowViewMoreButtonTitleViewWithExpectation")
        presenter.didTapOnAddMoreButton()
        XCTAssertTrue(presenter.actorExpanded == true)
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
