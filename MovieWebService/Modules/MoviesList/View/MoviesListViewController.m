//
//  MoviesListViewController.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
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
}

#pragma mark - UITableViewDelegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.presenter numberOfRowsInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellTableViewCellHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellTableViewCell";
    
    CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CellTableViewCell" owner:self options:nil] firstObject];
        //cell = self.movieCell;
        //self.movieCell = nil;
    }
    NSArray* filem = [self.presenter getFilmsData];
    NSLog(@"%@",[[filem firstObject] releaseDate]);
    Film *film = [filem firstObject];
    cell.name.text = film.name;
    
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSString* dateText;
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateStyle:NSDateFormatterMediumStyle];
    [f setCalendar:cal];
    [f setLocale:[NSLocale currentLocale]];
    dateText = [f stringFromDate:film.releaseDate];
    
    cell.date.text = dateText;
    
    NSString *filmRatingText;
    switch (film.filmRating) {
        case G:
            filmRatingText = @"G";
        case PG:
            filmRatingText = @"PG";
        case PG13:
            filmRatingText = @"PG13";
        case R:
            filmRatingText = @"R";
        default:
            break;
    }
    cell.filmRating.text = filmRatingText;
    cell.rating.text = [[NSNumber numberWithDouble:film.rating] stringValue];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //    Film *film = [films objectAtIndex:indexPath.row];
    //    DetailsModuleBuilder *builder = [DetailsModuleBuilder new];
    // [appDelegate.navigationController pushViewController:[builder buildWith:film] animated:YES];
}

@end
