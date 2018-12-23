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
#import "MoviesListPresenter.h"


@interface MoviesListViewController(PrivateMethods)

@property(nonatomic,weak) IBOutlet UITableView *movieListTableView;

@end

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
- (void)testThatControllerNotifiesPresenterOnDidLoadWhichPresenterCallInitialStateMethod{
    
    [self.controller viewDidLoad];
    OCMVerify([self.controller setupInitialState]);
}
- (void)testThatControllerNotifiesPresenterOnDidLoadWhichPresenterCallSetupView{
    
    [self.controller viewDidLoad];
    OCMVerify([self.controller setupView]);
}

- (void)testThatControllerSetupInitialStateIsSettingNavigationTitleAndBackgroundColor {
    
    [self.controller setupInitialState];
    XCTAssertTrue([self.controller.navigationItem.title isEqualToString:@"RootViewController"]);
    XCTAssertTrue(self.controller.view.backgroundColor == [UIColor whiteColor]);
    
   
}
- (void)testThatControllerNotifiesPresenterOnViewWillAppear {
    
    [self.controller viewWillAppear:YES];
    OCMVerify([self.mockOutput loadContent]);
}

- (void)testThatControllerReloadViewIsCallingWhenPresenterFetchhData {
    
    MoviesListPresenter*  movieListPresenterClass = [[MoviesListPresenter alloc ]init];
    movieListPresenterClass.view = self.controller;
    id vJNewHomeViewControllerClassMock = [OCMockObject partialMockForObject:movieListPresenterClass];
    OCMStub([vJNewHomeViewControllerClassMock didRetrieveFilms:nil]);
    OCMVerify([self.controller reloadView]);
    
}
//- (void)testThatControllerReloadViewIsCallingWhenPresenterFetchhDatadd {
//    
//   [self.controller reloadView]
// OCMVerify([self.controller.mo reloadData]);
//    
//}


@end
