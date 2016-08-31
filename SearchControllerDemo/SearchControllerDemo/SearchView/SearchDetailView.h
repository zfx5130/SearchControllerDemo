//
//  SearchDetailView.h
//  SearchControllerDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchDetailView;
@protocol SearchDetailViewDelegate <NSObject>

- (void)dismissButtonWasPressedForSearchDetailView:(SearchDetailView *)searchView;

- (void)searchButtonWasPressedForSearchDetailView:(SearchDetailView *)searchView;

- (void)textFieldEditingChangedForSearchDetailView:(SearchDetailView *)searchView;

@end

@interface SearchDetailView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) id<SearchDetailViewDelegate> delegate;

@end
