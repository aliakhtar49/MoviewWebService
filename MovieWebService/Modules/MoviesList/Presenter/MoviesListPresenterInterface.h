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


@class CellTableViewCellPresenter;

@protocol MoviesListPresenterInterface <NSObject>

- (void)didTriggerViewReadyEvent;
- (void) loadContent;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (CellTableViewCellPresenter*) getCellTableViewCellPresenter:(NSInteger) index;
- (void) didSelectRowAtIndexPath:(NSIndexPath*) indexPath;

@end


@protocol CellTableViewCellPresenterProtocol<NSObject>

- (void) retrieveContents;

@end
