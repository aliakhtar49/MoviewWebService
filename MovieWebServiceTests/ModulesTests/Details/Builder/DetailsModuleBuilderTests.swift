////
////  DetailsModuleBuilderTests.swift
////  MovieWebService
////
////  Created by Ali Akhtar on 11/04/2017.
////  Copyright © 2018 TestCompany. All rights reserved.
////
//
//import XCTest
//
//@testable
//import MovieWebService
//
//class DetailsModuleBuilderTests: XCTestCase {
//
//    func testBuildViewController() {
//
//        // given
//        let builder = DetailsModuleBuilder()
//
//        // when
//        let viewController = builder.build(with: Film()) as! DetailsViewController
//
//        // then
//        XCTAssertNotNil(viewController.output)
//        XCTAssertTrue(viewController.output is DetailsPresenter)
//
//        let presenter: DetailsPresenter = viewController.output as! DetailsPresenter
//        XCTAssertNotNil(presenter.view)
//        XCTAssertNotNil(presenter.router)
//        XCTAssertTrue(presenter.router is DetailsRouter)
//
//        let interactor: DetailsInteractor = presenter.interactor as! DetailsInteractor
//        XCTAssertNotNil(interactor.output)
//
//        let router: DetailsRouter = presenter.router as! DetailsRouter
//        XCTAssertNotNil(router.viewController)
//    }
//
//}
