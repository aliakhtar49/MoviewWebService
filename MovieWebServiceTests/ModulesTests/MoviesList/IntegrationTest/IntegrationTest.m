//
//  IntegrationTest.m
//  MovieWebServiceTests
//
//  Created by Ali Akhtar on 24/12/2018.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "MoviesListViewController.h"
#import "MoviesListBuilder.h"
#import "MoviesListInteractor.h"
#import "MovieWebService-Swift.h"
#import "Film.h"

@interface IntegrationTest : XCTestCase

@property (nonatomic, strong) MoviesListViewController *controller;
@property (nonatomic, strong) MoviesListPresenter *presenter;

@end

@implementation IntegrationTest

- (void)setUp {
    [super setUp];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MovieList" bundle:nil];
    self.controller = (MoviesListViewController *)[sb instantiateViewControllerWithIdentifier:@"MoviesListViewController"];

    self.presenter = [MoviesListPresenter new];
    self.presenter.view = self.controller;

    MoviesListInteractor *interactor = [MoviesListInteractor new];
    interactor.presenter = self.presenter;
    self.presenter.interactor = interactor;
    self.controller.presenter = self.presenter;


    self.controller = (MoviesListViewController*)[[[MoviesListBuilder alloc]init] build];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
   
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


- (void)testThatMovieListControllerLoadedProperlyFromStoaryboard {
    XCTAssertTrue(self.controller != nil);
}



- (void) testViewDidLoadFlow {

    [self.controller viewDidLoad];
    OCMVerify([self.controller.presenter didTriggerViewReadyEvent]);
     OCMVerify([self.controller setupInitialState]);
      OCMVerify([self.controller setupView]);
    XCTAssertTrue([self.controller.navigationItem.title isEqualToString:@"RootViewController"] ,@"Navigation Title is not set properly on ViewDidLoad");
    XCTAssertTrue(self.controller.view.backgroundColor == [UIColor whiteColor]);
    XCTAssertTrue([self.controller.presenter numberOfRowsInSection:0] == 0);

}


//TODO://Should be break so that when fail easily get where it is breaking
- (void) testViewWillAppearFlow {

    [self.controller viewWillAppear:NO];
    OCMVerify([self.presenter loadContent]);
    OCMVerify([self.presenter.interactor retrieveMovies]);
    [self.presenter didRetrieveFilms:@[[FilmModelStub buildFilmModelStub]]];
    OCMVerify([self.controller reloadView]);
    XCTAssertTrue([self.presenter numberOfRowsInSection:0] == 1);
    CellTableViewCellPresenter* presenterCell = [self.presenter getCellTableViewCellPresenter:0];
    XCTAssertTrue([[[presenterCell film] name] isEqualToString:@"Argo"]);
    

}


@end
