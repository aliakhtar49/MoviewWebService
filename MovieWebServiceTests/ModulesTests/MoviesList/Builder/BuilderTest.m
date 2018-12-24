//
//  BuilderTest.m
//  MovieWebServiceTests
//
//  Created by Ali Akhtar on 24/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MoviesListBuilder.h"
#import "MoviesListViewController.h"
#import "MoviesListPresenter.h"
#import "MoviesListRouter.h"
#import "MoviesListInteractor.h"

@interface BuilderTest : XCTestCase

@end

@implementation BuilderTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMovieListBuildingProperly {
    MoviesListViewController*  viewController = (MoviesListViewController*)[[MoviesListBuilder alloc] build];
  
    XCTAssertNotNil(viewController.presenter);
    XCTAssertTrue([viewController.presenter isKindOfClass:[MoviesListPresenter class]]);
    MoviesListPresenter* movieListPresenter = (MoviesListPresenter*) viewController.presenter;
    XCTAssertNotNil(movieListPresenter.view);
    XCTAssertNotNil(movieListPresenter.router);
    MoviesListRouter* router = (MoviesListRouter*) movieListPresenter.router;
    XCTAssertNotNil(router.viewController);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
