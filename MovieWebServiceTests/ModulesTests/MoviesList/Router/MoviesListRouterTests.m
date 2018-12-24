//
//  MoviesListRouterTests.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "MovieWebService-Swift.h"
#import "MoviesListRouter.h"

@interface MoviesListRouterTests : XCTestCase

@property (nonatomic, strong) MoviesListRouter *router;
@property (nonatomic, strong) MoviesListViewController *controller;

@end

@implementation MoviesListRouterTests

- (void)setUp {
    [super setUp];

    self.router = [[MoviesListRouter alloc] init];
    self.controller = [[MoviesListViewController alloc] init];
    self.router.viewController = self.controller;
    UINavigationController* navigationController = [[UINavigationController alloc]init];
    [navigationController pushViewController:self.controller animated:NO];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}



- (void) testExample {
//    [self.router pushToFilmDetailScreenWithData:[FilmModelStub buildFilmModelStub]];
//    XCTAssertTrue([[[self.router.viewController.navigationController viewControllers] firstObject] isKindOfClass:[MoviesListViewController class]]);
}
//- (void)pushToFilmDetailScreenWithData:(Film *)film {
//
//    DetailsModuleBuilder *builder = [DetailsModuleBuilder new];
//    [self.viewController.navigationController pushViewController:[builder buildWith:film] animated:YES];
//}

@end
