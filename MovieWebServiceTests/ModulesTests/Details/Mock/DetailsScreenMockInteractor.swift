//
//  DetailsScreenMockInteractor.swift
//  MovieWebServiceTests
//
//  Created by Ali Akhtar on 22/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import Foundation
import XCTest

@testable import MovieWebService

class DetailScreenMockView: DetailScreenViewProtocol {
    var presenter: DetailScreenPresenterProtocol?
    
    var showDirectorNameViewWithExpectation: XCTestExpectation?
    var showDirectorTitleViewWithExpectation: XCTestExpectation?
    var showActorScreenNameViewWithExpectation: XCTestExpectation?
    var showActorScreenNameTitleViewWithExpectation: XCTestExpectation?
    var showActorNameViewWithExpectation: XCTestExpectation?
    var showActorNameTitleViewWithExpectation: XCTestExpectation?
    
    var showOrHideActorNameAndTitleWithExpectation: XCTestExpectation?
    var showOrHideActorScreenNameAndTitleWithExpectation: XCTestExpectation?
    var showTapToShowViewMoreButtonTitleViewWithExpectation: XCTestExpectation?
    
    
    func showDirectorNameViewWith(_ directorNameText: String) {
        showDirectorNameViewWithExpectation!.fulfill()
    }
    func showDirectorTitleViewWith(_ directorTitleText: String) {
        showDirectorTitleViewWithExpectation!.fulfill()
    }
    
    func showActorScreenNameViewWith(_ actorScreenNameText: String) {
        showActorScreenNameViewWithExpectation!.fulfill()
    }
    
    func showActorScreenNameTitleViewWith(_ actorScreenNameTitleText: String) {
        showActorScreenNameTitleViewWithExpectation!.fulfill()
    }
    
    func showActorNameViewWith(_ actorNameText: String) {
        showActorNameViewWithExpectation!.fulfill()
    }
    
    func showActorNameTitleViewWith(_ actorNameTitleText: String) {
        showActorNameTitleViewWithExpectation!.fulfill()
    }
    
    func showTapToShowViewMoreButtonTitleViewWith(_ text: String) {
        showTapToShowViewMoreButtonTitleViewWithExpectation!.fulfill()
    }
    
    func showOrHideActorNameAndTitleWith(_ isToShow: Bool) {
        showOrHideActorNameAndTitleWithExpectation!.fulfill()
    }
    
    func showOrHideActorScreenNameAndTitleWith(_ isToShow: Bool) {
        showOrHideActorScreenNameAndTitleWithExpectation!.fulfill()
    }
    
    
}
