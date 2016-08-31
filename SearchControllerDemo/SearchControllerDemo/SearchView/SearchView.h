//
//  SearchView.h
//  SearchControllerDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchView;
@protocol SearchViewDelegate <NSObject>

- (void)searchButtonWasPressedForSearchView:(SearchView *)searchView;

@end

@interface SearchView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) id<SearchViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end
