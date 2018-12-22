//
//  CellTableViewCell.m
//  MovieWebService
//
//  Created by Ali Akhtar on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "CellTableViewCell.h"


@interface CellTableViewCell() {
    
}
@end


@implementation CellTableViewCell{
 
}


- (void) populateCell{
    [self.presenter retrieveContents];
}

- (void) showFilmRatingViewWith:(NSString*)filmRatingText {
    self.filmRating.text = filmRatingText;
}
- (void) showReleaseDateViewWith:(NSString*)releaseDateString {
    self.date.text = releaseDateString;
}
- (void) showFilmNameViewWith:(NSString*)filmNameString{
    self.name.text = filmNameString;
}
- (void) showRatingViewWith:(NSString*)ratingString{
    self.rating.text = ratingString;
}




@end
