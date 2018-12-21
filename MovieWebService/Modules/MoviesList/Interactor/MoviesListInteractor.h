//
//  MoviesListInteractor.h
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListInteractorInput.h"

@protocol MoviesListInteractorOutput;

@interface MoviesListInteractor : NSObject <MoviesListInteractorInput>

@property (nonatomic, weak) id<MoviesListInteractorOutput> presenter;

@end
