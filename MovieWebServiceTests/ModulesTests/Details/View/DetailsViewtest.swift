//
//  DetailsViewtest.swift
//  MovieWebServiceTests
//
//  Created by Ali Akhtar on 23/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import XCTest

@testable import MovieWebService
class DetailScreenMockPresenter: DetailScreenPresenterProtocol {
    var isViewReadyEventCalled = false
    func viewIsReady() {
        isViewReadyEventCalled = true
    }
    
    var view: DetailScreenViewProtocol?
    
    var router: DetailScreenRouterProtocol?
    
    var interactor: DetailScreenInteractorInputProtocol?
    
    func didTapOnAddMoreButton() {
        
    }
    
    var actorExpanded: Bool = false
    
    required init(_ modelData: Film) {
        self.modelData = modelData
    }
    
    var modelData: Film
    
    
    
}
class DetailsViewtest: XCTestCase {
    
    var presenter: DetailScreenMockPresenter!
    var viewController: DetailsViewController!
    
    override func setUp() {
        super.setUp()
    
        presenter = DetailScreenMockPresenter(FilmModelStub.buildFilmModelStub())
        viewController = DetailsViewController()
        viewController.presenter = presenter
        presenter.view = viewController
    }
    
    override func tearDown() {
        presenter = nil
        viewController = nil
        
        super.tearDown()
    }
    func testViewIsReadyEventHGetCalledWhenViewDidLoadCalled() {
        viewController.viewDidLoad()
        XCTAssertTrue(presenter.isViewReadyEventCalled)
    }
 
    
    
}
