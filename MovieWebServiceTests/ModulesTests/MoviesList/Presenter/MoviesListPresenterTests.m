////
////  MoviesListPresenterTests.m
////  MovieWebService
////
////  Created by Ali Akhtar on 11/04/2017.
////  Copyright © 2018 TestCompany. All rights reserved.
////
//
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListInteractor.h"
#import "MoviesListPresenter.h"
#import "MoviesListViewInterface.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"
#import "MovieWebService-Swift.h"

@class CellTableViewCellPresenter;


@interface MoviesListPresenterTests : XCTestCase

@property (nonatomic, strong) MoviesListPresenter *presenter;
@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, weak) id mockView;

@end
//
@implementation MoviesListPresenterTests
//
//
- (void)setUp {
    [super setUp];

    self.presenter = [[MoviesListPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(MoviesListInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(MoviesListRouterInput));
    self.mockView = OCMProtocolMock(@protocol(MoviesListViewInterface));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}


- (void)testThatPresenterLoadContentTrigerredRetrieveMoviesMethodInInteractor {
   
    [self.presenter loadContent];
    OCMVerify([self.mockInteractor retrieveMovies]);
}

- (void)testThatPresenterdidTriggerViewReadyEventTrigerredSetupInitialStateMethodInView {
    
    [self.presenter didTriggerViewReadyEvent];
    OCMVerify([self.mockView setupInitialState]);
}
- (void)testThatPresenterdidTriggerViewReadyEventTrigerredSetupViewMethodInView{
    [self.presenter didTriggerViewReadyEvent];
    OCMVerify([self.mockView setupView]);
}

 - (void)testThatPresenterWhenFetchingDataReturingNumberOfRowsInSection{
     [self.presenter didRetrieveFilms:@[[FilmModelStub buildFilmModelStub]]];
     XCTAssertTrue([self.presenter numberOfRowsInSection:0] == 1);
}
- (void)testThatPresenterWhenFetchingDataPopulartingDataProperly{
    [self.presenter didRetrieveFilms:@[[FilmModelStub buildFilmModelStub]]];
    OCMVerify([self.mockView reloadView]);
   
}

- (void)testThat{
    [self.presenter didSelectRowAtIndexPath:nil];
    OCMVerify([self.mockRouter pushToFilmDetailScreenWithData:nil]);
    
}



@end
