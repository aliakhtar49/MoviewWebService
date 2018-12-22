//
//  MoviesListAssembly.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListBuilder.h"

#import "MoviesListViewController.h"
#import "MoviesListInteractor.h"
#import "MoviesListPresenter.h"
#import "MoviesListRouter.h"


@implementation MoviesListBuilder

- (UIViewController *)build {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MovieList" bundle:nil];
    MoviesListViewController * viewController = (MoviesListViewController *)[sb instantiateViewControllerWithIdentifier:@"MoviesListViewController"];
    MoviesListRouter *router = [MoviesListRouter new];
    router.viewController = viewController;

    MoviesListPresenter *presenter = [MoviesListPresenter new];
    presenter.view = viewController;
    presenter.router = router;

    MoviesListInteractor *interactor = [MoviesListInteractor new];
    interactor.presenter = presenter;
    presenter.interactor = interactor;
    viewController.presenter = presenter;
    
    return viewController;

}

@end
