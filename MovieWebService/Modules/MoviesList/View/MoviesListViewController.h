//
//  MoviesListViewController.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MoviesListViewInput.h"


@protocol MoviesListPresenterInterface;

@interface MoviesListViewController : UIViewController <MoviesListViewInterface,UITableViewDelegate,UITableViewDataSource> {
}

@property (nonatomic, strong) id<MoviesListPresenterInterface> presenter;

@end
