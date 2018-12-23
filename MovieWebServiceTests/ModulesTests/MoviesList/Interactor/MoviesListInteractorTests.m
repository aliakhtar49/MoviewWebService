//
//  MoviesListInteractorTests.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListInteractor.h"
////
#import "MoviesListInteractorOutput.h"
#import "MovieWebService-Swift.h"


@interface MoviesListInteractorTests : XCTestCase

@property (nonatomic, strong) MoviesListInteractor *interactor;

@property (nonatomic, strong) id presenter;

@end

@implementation MoviesListInteractorTests

- (void)setUp {
    [super setUp];

    self.interactor = [[MoviesListInteractor alloc] init];

    self.presenter = OCMProtocolMock(@protocol(MoviesListInteractorOutput));

    self.interactor.presenter = self.presenter;
}

- (void)tearDown {
    self.interactor = nil;

    self.presenter = nil;

    [super tearDown];
    
}

- (void)testThat {


    [self.interactor retrieveMovies];
    

    id mockSessionManager = OCMClassMock([NetworkManager class]);
    [[[[mockSessionManager stub] classMethod] andDo:] requestfor]
    OCMStub(ClassMethod([mockSessionManager requestForUserDataWith]).andDo(NSDictionary<NSString *,id> * _Nonnull results));
                         
    
//    OCMStub([mock someMethod]).andDo(^(NSInvocation *invocation)
//                                     { /* block that handles the method invocation */ });
//    [NetworkManager re]
//    [NetworkManager requestForUserDataWithCompletionHandler:^(NSDictionary<NSString *,id> * _Nonnull results) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            Film* film = [[Film alloc] initWithData:results];
//            [weakSelf.presenter didRetrieveFilms:@[film]];
//        });
//    }];
//    Ner
//    id mockSessionManager = OCMClassMock([NetworkManager class]);
//    OCMStub([mockSessionManager req]).andReturn(mockSessionManager);
//    //id classMock = OCMClassMock([Net class]);
////    MoviesListPresenter*  movieListPresenterClass = [[MoviesListPresenter alloc ]init];
////    movieListPresenterClass.view = self.controller;
////    id vJNewHomeViewControllerClassMock = [OCMockObject partialMockForObject:movieListPresenterClass];
////    OCMStub([vJNewHomeViewControllerClassMock didRetrieveFilms:nil]);
////    OCMVerify([self.controller reloadView]);
//    OCMVerify([self.presenter didRetrieveFilms:@[[FilmModelStub buildFilmModelStub]]]);
}

@end
