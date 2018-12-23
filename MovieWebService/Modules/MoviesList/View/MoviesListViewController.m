//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListViewController.h"

#import "MoviesListPresenterInterface.h"
#import "AppDelegate.h"
#import "Film.h"
#import "CellTableViewCell.h"
#import "MoviewListingScreenConstants.h"
#import "MovieWebService-Swift.h"

#pragma mark - Private Interface
@interface MoviesListViewController()

@property(nonatomic,weak) IBOutlet UITableView *movieListTableView;

@end


#pragma mark - Impelmentation
@implementation MoviesListViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.presenter didTriggerViewReadyEvent];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.presenter loadContent];
}


#pragma mark - MoviesListViewInterface
- (void)setupInitialState {
    self.navigationItem.title = @"RootViewController";
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)reloadView {
    [self.movieListTableView reloadData];
}
- (void)setupView {

    [self.movieListTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CellTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([CellTableViewCell class])];
}

#pragma mark - UITableViewDelegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.presenter numberOfRowsInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellTableViewCellHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CellTableViewCell class])];
    CellTableViewCellPresenter* presenter = [self.presenter getCellTableViewCellPresenter:indexPath.row];
    cell.presenter = presenter ;
    presenter.view = cell;
    [cell populateCell];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenter didSelectRowAtIndexPath:indexPath];
}

@end
