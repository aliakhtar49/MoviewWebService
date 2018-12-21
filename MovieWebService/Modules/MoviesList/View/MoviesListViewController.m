//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by Ali Akhtar on 11/04/2017.
//  Copyright © 2018 TestCompany. All rights reserved.
//

#import "MoviesListViewController.h"

#import "MoviesListViewOutput.h"
#import "AppDelegate.h"
#import "Film.h"
#import "CellTableViewCell.h"
#import "ViewConstants.h"

#pragma mark - Private Interface
@interface MoviesListViewController() {
}
@property(nonatomic,strong) UITableView *tableView;
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
    [self.tableView reloadData];
}
- (void)setupView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CellTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([CellTableViewCell class])];
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
    [cell populateCell:[self.presenter getCellTableViewCellViewModel:indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenter didSelectRowAtIndexPath:indexPath];
}

@end
