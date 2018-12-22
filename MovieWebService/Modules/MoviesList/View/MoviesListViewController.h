//
//  MoviesListViewController.h
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MoviesListViewInterface.h"


@protocol MoviesListPresenterInterface;

@interface MoviesListViewController : UIViewController <MoviesListViewInterface,UITableViewDelegate,UITableViewDataSource> {
}

@property (nonatomic, strong) id<MoviesListPresenterInterface> presenter;

@end
