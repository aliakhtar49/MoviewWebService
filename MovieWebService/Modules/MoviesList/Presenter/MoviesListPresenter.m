//
//  MoviesListPresenter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"

@implementation MoviesListPresenter {
    NSArray *filmsArray;
}

- (void)configureModule {
 }



#pragma mark - MoviesListPresenterInterface Delegates

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return filmsArray.count;
}
- (void)loadContent {
    
    [self.interactor retrieveMovies];
}
- (NSArray*) getFilmsData {
    return filmsArray;
}
- (void)didTriggerViewReadyEvent {
    [self.view setupInitialState];
    [self.view setupView];
}

#pragma mark - MoviesListInteractorOutputDelegates
- (void)didRetrieveError:(NSError *)error {
    
}
- (void)didRetrieveFilms:(NSArray *)films {
    filmsArray = films;
    [self.view reloadView];
}
@end
