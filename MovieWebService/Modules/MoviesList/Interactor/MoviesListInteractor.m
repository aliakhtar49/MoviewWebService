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
- (void)getFilmWithCallback:(void (^)(Film *film))callback {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
        NSDictionary *data = @{
                               @"filmRating" : @3,
                               @"languages": @[
                                       @"English",
                                       @"Thai"
                                       ],
                               @"nominated": @1,
                               @"releaseDate": @1350000000,
                               @"cast": @[
                                       @{
                                           @"dateOfBirth": @-436147200,
                                           @"nominated": @1,
                                           @"name": @"Bryan Cranston",
                                           @"screenName": @"Jack Donnell",
                                           @"biography": @"Bryan Lee Cranston is an American actor, voice actor, writer and director."
                                           }
                                       ],
                               @"name": @"Argo",
                               @"rating": @7.8,
                               @"director": @{
                                       @"dateOfBirth": @82684800,
                                       @"nominated": @1,
                                       @"name": @"Ben Affleck",
                                       @"biography": @"Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
                                       }
                               };
        
        Film* film = [[Film alloc] initWithData:data];
        
        data = nil;
        callback(film);
    });
}


#pragma mark - MoviesListInteractorInput

- (void)retrieveMovies {
    
    MoviesListInteractor * __weak weakSelf = self;
    [self getFilmWithCallback:^(Film *film) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.presenter didRetrieveFilms:@[film]];
        });
        
    }];
}



@end
