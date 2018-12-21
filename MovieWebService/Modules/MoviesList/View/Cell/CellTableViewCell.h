//
//  CellTableViewCell.h
//  MovieWebService
//
//  Created by Ali Akhtar on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellTableViewCellViewModel;



@interface CellTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *filmRating;
@property (strong, nonatomic) IBOutlet UILabel *rating;

- (void) populateCell:(CellTableViewCellViewModel*) cellTableViewCellViewModel;

@end
