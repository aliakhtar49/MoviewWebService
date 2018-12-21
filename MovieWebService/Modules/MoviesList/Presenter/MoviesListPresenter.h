//
//  MoviesListPresenter.h
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListViewOutput.h"
#import "MoviesListInteractorOutput.h"
#import "MoviesListModuleInput.h"

@protocol MoviesListViewInterface;
@protocol MoviesListInteractorInput;
@protocol MoviesListRouterInput;

@interface MoviesListPresenter : NSObject <MoviesListModuleInput, MoviesListPresenterInterface, MoviesListInteractorOutput>

@property (nonatomic, weak) id<MoviesListViewInterface> view;
@property (nonatomic, strong) id<MoviesListInteractorInput> interactor;
@property (nonatomic, strong) id<MoviesListRouterInput> router;


@end
