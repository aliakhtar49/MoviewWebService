//
//  MoviesListViewInput.h
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MoviesListViewInterface <NSObject>

- (void) setupInitialState;
- (void) setupView;
- (void) reloadView;

@end
