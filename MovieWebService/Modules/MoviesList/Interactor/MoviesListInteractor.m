//
//  MoviesListInteractor.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListInteractor.h"
#import "MoviesListInteractorOutput.h"
#import "Film.h"
#import "MovieWebService-Swift.h"

@implementation MoviesListInteractor {
}
//TODO: Should be in some network Manager class 



#pragma mark - MoviesListInteractorInput



- (void)retrieveMovies {
    MoviesListInteractor * __weak weakSelf = self;
    [NetworkManager requestForUserDataWithCompletionHandler:^(NSDictionary<NSString *,id> * _Nonnull results) {
        dispatch_async(dispatch_get_main_queue(), ^{
            Film* film = [[Film alloc] initWithData:results];
                                    [weakSelf.presenter didRetrieveFilms:@[film]];
                                });
    }];
}



@end
