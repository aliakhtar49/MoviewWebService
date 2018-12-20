//
//  MoviesListPresenter.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
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
