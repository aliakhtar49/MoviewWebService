//
//  MoviesListRouterInput.h
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Film.h"
@import UIKit;

@protocol MoviesListRouterInput <NSObject>

- (void)pushToFilmDetailScreenWithData:(Film *)film;

@end
