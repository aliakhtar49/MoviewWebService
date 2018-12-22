//
//  MoviesListViewControllerTests.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock.h"

#import "MoviesListViewController.h"

#import "MoviesListPresenterInterface.h"

@interface MoviesListViewControllerTests : XCTestCase

@property (nonatomic, strong) MoviesListViewController *controller;
@property (nonatomic, strong) id mockOutput;

@end

@implementation MoviesListViewControllerTests

- (void)setUp {
    [super setUp];

    self.controller = [[MoviesListViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(MoviesListPresenterInterface));

    self.controller.presenter = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}
- (void)testNothing;
{
    XCTAssertTrue(YES, @"");
}

- (void)testThatControllerNotifiesPresenterOnDidLoad {

    [self.controller viewDidLoad];
    OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

- (void)testThatControllerNotifiesPresenterOnViewWillAppear {
    
    [self.controller viewWillAppear:YES];
    OCMVerify([self.mockOutput loadContent]);
}

//- (void)testThatControllerReloadTableOnReloadView {
//    
//    [self.controller reloadView];
//    OCMVerify([self.mockOutput.tab loadContent]);
//}




@end
