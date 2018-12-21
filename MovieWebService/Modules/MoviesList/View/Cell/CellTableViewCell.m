//
//  CellTableViewCell.m
//  MovieWebService
//
//  Created by Ali Akhtar on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "CellTableViewCell.h"
#import "MovieWebService-Swift.h"

@interface CellTableViewCell() {
    
}
@end


@implementation CellTableViewCell {
    
}


- (void) populateCell:(CellTableViewCellViewModel*) cellTableViewCellViewModel {
    self.name.text = cellTableViewCellViewModel.nameString;
    self.date.text = cellTableViewCellViewModel.releaseDateString;
    self.filmRating.text = cellTableViewCellViewModel.filmRatingString;
    self.rating.text = cellTableViewCellViewModel.ratingString;
}

@end
