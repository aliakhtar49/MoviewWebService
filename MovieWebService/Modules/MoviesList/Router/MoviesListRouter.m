//
//  MoviesListRouter.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListRouter.h"
#import <UIKit/UIKit.h>
#import "Film.h"

#import "MovieWebService-Swift.h"

@implementation MoviesListRouter

#pragma mark - MoviesListRouterInput

- (void)pushToFilmDetailScreenWithData:(Film *)film {
    
    DetailsModuleBuilder *builder = [DetailsModuleBuilder new];
    [self.viewController.navigationController pushViewController:[builder buildWith:film] animated:YES];
}

@end
