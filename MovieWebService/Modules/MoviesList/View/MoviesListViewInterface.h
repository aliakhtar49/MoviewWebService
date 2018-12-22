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




@protocol CellTableViewCellViewProtocol<NSObject>

- (void) showFilmRatingViewWith:(NSString*)filmRatingText;
- (void) showReleaseDateViewWith:(NSString*)releaseDateString;
- (void) showFilmNameViewWith:(NSString*)filmNameString;
- (void) showRatingViewWith:(NSString*)ratingString;


@end

