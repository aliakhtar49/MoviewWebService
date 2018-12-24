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



@end
