//
//  CellTableViewCell.h
//  MovieWebService
//
//  Created by Ali Akhtar on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieWebService-Swift.h"

@protocol CellTableViewCellPresenterProtocol;
@protocol CellTableViewCellViewProtocol;




@interface CellTableViewCell : UITableViewCell<CellTableViewCellViewProtocol>

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *filmRating;
@property (strong, nonatomic) IBOutlet UILabel *rating;

@property (nonatomic, strong) id<CellTableViewCellPresenterProtocol> presenter;
- (void) populateCell;

@end
