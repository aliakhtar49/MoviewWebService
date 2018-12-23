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
        
        
        
        presenter = DetailScreenMockPresenter(Film(data: mockData))
        
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
