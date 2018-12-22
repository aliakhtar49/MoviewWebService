//
//  MoviesListPresenter.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"
#import "NSArray+Map.h"
#import "MovieWebService-Swift.h"
@implementation MoviesListPresenter {

    NSArray *cellTableViewCellViewModels;
  
}
- (void)configureModule {
 }

#pragma mark - MoviesListPresenterInterface Delegates

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return cellTableViewCellViewModels.count;
}
- (void)loadContent {
    [self.interactor retrieveMovies];
}
- (NSArray*) getFilmsData {
    return cellTableViewCellViewModels;
}
- (void)didTriggerViewReadyEvent {
    [self.view setupInitialState];
    [self.view setupView];
}
- (CellTableViewCellPresenter*) getCellTableViewCellPresenter:(NSInteger) index {
    return cellTableViewCellViewModels[index];
}
- (void) didSelectRowAtIndexPath:(NSIndexPath*) indexPath {
    [self.router pushToFilmDetailScreenWithData:nil];
}

#pragma mark - MoviesListInteractorOutputDelegates
- (void)didRetrieveError:(NSError *)error {
    
}
- (void)didRetrieveFilms:(NSArray *)films {
    
   cellTableViewCellViewModels =  [films mapObjectsUsingBlock:^(id obj, NSUInteger idx) {
        return [[CellTableViewCellPresenter alloc]init:obj];
    }];
    [self.view reloadView];
}

@end


