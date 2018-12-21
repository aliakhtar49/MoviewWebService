//
//  MoviesListViewOutput.h
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Film.h"


@class CellTableViewCellViewModel;

@protocol MoviesListPresenterInterface <NSObject>

- (void)didTriggerViewReadyEvent;
- (void) loadContent;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (NSArray*) getFilmsData;
- (CellTableViewCellViewModel*) getCellTableViewCellViewModel:(NSInteger) index;
- (void) didSelectRowAtIndexPath:(NSIndexPath*) indexPath;

@end
