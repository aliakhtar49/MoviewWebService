//
//  MoviesListRouter.h
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListRouterInput.h"

@class UIViewController;

@interface MoviesListRouter : NSObject <MoviesListRouterInput>

@property (nonatomic, weak) UIViewController *viewController;

@end
