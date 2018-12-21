//
//  DetailsInteractorTests.swift
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsInteractorTests: XCTestCase {

    var interactor: DetailsInteractor!
    var output: MockOutput!
	
    override func setUp() {
        super.setUp()
		
        output = MockOutput()
       
        interactor = DetailsInteractor()
        interactor.output = output
    }

    override func tearDown() {
        output = nil
        interactor = nil
	
        super.tearDown()
    }

    // MARK: - Mock

    class MockOutput: DetailsInteractorOutput {

    }

}
