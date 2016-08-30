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

@interface SearchDetailViewController ()
<SearchDetailViewDelegate,
UITableViewDelegate,
UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *searchTagTableView;
@property (weak, nonatomic) IBOutlet UITableView *searchResultTableView;

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
    SearchDetailView *searchView = [[SearchDetailView alloc] initWithFrame:CGRectMake(0, 3, [UIScreen mainScreen].bounds.size.width, 30)];
    searchView.textField.placeholder = self.placeHolderText;
    searchView.delegate = self;
    [searchView.textField becomeFirstResponder];
    [self.navigationController.navigationBar addSubview:searchView];
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

#pragma mark - SearchDetailViewDelegate

- (void)dismissButtonWasPressedForSearchDetailView:(SearchDetailView *)searchView {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (void)searchButtonWasPressedForSearchDetailView:(SearchDetailView *)searchView {
    NSLog(@"搜索内容:::::::::%@",searchView.textField.text);
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath:::::%@", indexPath);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.searchTagTableView) {
        SearchTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SearchTagTableViewCell class])];
        cell.textLabel.text = @"标签测试";
        return cell;
    }
    SearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SearchResultTableViewCell class])];
    cell.textLabel.text  = @"结果测试";
    return cell;
}


@end
