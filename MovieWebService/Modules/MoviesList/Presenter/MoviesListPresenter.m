//
//  MoviesListPresenter.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListPresenter.h"

#import "MoviesListViewInterface.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"
#import "NSArray+Map.h"
#import "MovieWebService-Swift.h"
@implementation MoviesListPresenter {

    NSArray *cellTableViewCellPresenters;
  
}
- (void)configureModule {
 }

#pragma mark - MoviesListPresenterInterface Delegates

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return cellTableViewCellPresenters.count;
}
- (void)loadContent {
    [self.interactor retrieveMovies];
}
- (void)didTriggerViewReadyEvent {
    [self.view setupInitialState];
    [self.view setupView];
}
- (CellTableViewCellPresenter*) getCellTableViewCellPresenter:(NSInteger) index {
    return cellTableViewCellPresenters[index];
}
- (void) didSelectRowAtIndexPath:(NSIndexPath*) indexPath {
    
    [self.router pushToFilmDetailScreenWithData:[cellTableViewCellPresenters[indexPath.row]film]];
}

#pragma mark - MoviesListInteractorOutputDelegates
- (void)didRetrieveError:(NSError *)error {
    
}
- (void)didRetrieveFilms:(NSArray *)films {
    
   cellTableViewCellPresenters =  [films mapObjectsUsingBlock:^(id obj, NSUInteger idx) {
        return [[CellTableViewCellPresenter alloc]init:obj];
    }];
    [self.view reloadView];
}

@end


