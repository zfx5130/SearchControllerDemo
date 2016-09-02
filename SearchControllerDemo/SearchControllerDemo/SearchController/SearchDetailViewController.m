//
//  SearchDetailViewController.m
//  SearchControllerDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "SearchDetailViewController.h"
#import "SearchDetailView.h"
#import "SearchTagTableViewCell.h"
#import "SearchResultTableViewCell.h"
#import "SearchTagHeadView.h"

@interface SearchDetailViewController ()
<SearchDetailViewDelegate,
UITableViewDelegate,
UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *searchTagTableView;
@property (weak, nonatomic) IBOutlet UITableView *searchResultTableView;

@property (strong, nonatomic) SearchDetailView *searchDetailView;

@property (copy, nonatomic) NSArray *tags;

@end

@implementation SearchDetailViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSearchView];
    [self registerCells];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private

- (void)setupSearchView {
    self.navigationController.navigationBar.translucent = NO;
    self.searchDetailView = [[SearchDetailView alloc] initWithFrame:CGRectMake(0, 3, [UIScreen mainScreen].bounds.size.width, 30)];
    self.searchDetailView.textField.placeholder = self.placeHolderText;
    self.searchDetailView.delegate = self;
    [self.searchDetailView.textField becomeFirstResponder];
    [self.navigationController.navigationBar addSubview:self.searchDetailView];
    self.searchTagTableView.tableFooterView = [[UIView alloc] init];
    self.searchTagTableView.backgroundColor = [UIColor whiteColor];
    self.searchResultTableView.tableFooterView = [[UIView alloc] init];
}

- (void)registerCells {
    UINib *searchTagNib =
    [UINib nibWithNibName:NSStringFromClass([SearchTagTableViewCell class])
                                         bundle:nil];
    [self.searchTagTableView registerNib:searchTagNib
                  forCellReuseIdentifier:NSStringFromClass([SearchTagTableViewCell class])];
    
    UINib *searchResultNib =
    [UINib nibWithNibName:NSStringFromClass([SearchResultTableViewCell class])
                   bundle:nil];
    [self.searchResultTableView registerNib:searchResultNib
                  forCellReuseIdentifier:NSStringFromClass([SearchResultTableViewCell class])];
}

#pragma mark - Getters & Setters

- (NSArray *)tags {
    if (!_tags) {
        _tags = @[
                  @"AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                  @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                  @"on", @"constraints"
                  ];
    }
    return _tags;
}

#pragma mark - SearchDetailViewDelegate

- (void)dismissButtonWasPressedForSearchDetailView:(SearchDetailView *)searchView {
    [self dismissViewControllerAnimated:NO
                             completion:nil];
}

- (void)searchButtonWasPressedForSearchDetailView:(SearchDetailView *)searchView {
    NSLog(@"搜索内容:::::::::%@",searchView.textField.text);
}

- (void)textFieldEditingChangedForSearchDetailView:(SearchDetailView *)searchView {
    NSLog(@"搜索内容：：：：：：：%@",searchView.textField.text);
    self.searchTagTableView.hidden  = YES;
    self.searchResultTableView.hidden = !self.searchTagTableView.hidden;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath:::::%@", indexPath);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.searchDetailView) {
        [self.searchDetailView.textField resignFirstResponder];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.searchTagTableView) {
        SearchTagTableViewCell *cell = (SearchTagTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
    }
    return 50.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == self.searchTagTableView) {
        SearchTagHeadView *headView = [[SearchTagHeadView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 45.0f)];
        headView.backgroundColor = [UIColor whiteColor];
        NSString *leftImageName = section == 0 ? @"test" : @"test1";
        NSString *titleName = section == 0 ? @"最近搜索" : @"热门搜索";
        BOOL isHidden = section == 0 ? NO : YES;
        headView.leftImageView.image = [UIImage imageNamed:leftImageName];
        headView.titleLabel.text = titleName;
        headView.clearButton.hidden = isHidden;
        return headView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == self.searchTagTableView) {
        return 45.0f;
    }
    return CGFLOAT_MIN;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchTagTableView) {
        return 1;
    }
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.searchTagTableView) {
        return 2;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.searchTagTableView) {
        SearchTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SearchTagTableViewCell class])];
        if ([cell respondsToSelector:@selector(layoutMargins)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
        cell.contentEmptyLabel.hidden = indexPath.section != 0;
        [cell renderCellWithTags:self.tags];
        return cell;
    }
    SearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SearchResultTableViewCell class])];
    return cell;
}


@end
