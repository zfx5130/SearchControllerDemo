//
//  SearchViewController.m
//  SearchControllerDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"
#import "SearchDetailViewController.h"

@interface SearchViewController ()
<SearchViewDelegate>

@end

@implementation SearchViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSearchView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private

- (void)setupSearchView {
    SearchView *searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 3, self.view.frame.size.width, 30)];
    searchView.textField.text = @"测试";
    searchView.delegate = self;
    [self.navigationController.navigationBar addSubview:searchView];
}

#pragma mark - SearchViewDelegate

- (void)searchButtonWasPressedForSearchView:(SearchView *)searchView {
    SearchDetailViewController *searchViewController = [[SearchDetailViewController alloc] init];
    searchViewController.placeHolderText = searchView.textField.text;
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:navigationController
                       animated:NO
                     completion:nil];
    
}

@end
