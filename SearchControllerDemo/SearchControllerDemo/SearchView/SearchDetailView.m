//
//  SearchDetailView.m
//  SearchControllerDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "SearchDetailView.h"

@interface SearchDetailView ()
<UITextFieldDelegate>

@end

@implementation SearchDetailView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                      owner:self
                                    options:nil];
        self.view.frame = frame;
        [self setupViews];
        [self addSubview:self.view];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.view.frame = self.frame;
}

#pragma mark - Private

- (void)setupViews {
    self.textField.layer.cornerRadius = 5.0f;
    self.textField.layer.masksToBounds = YES;
    self.textField.delegate = self;
    [self setupTextFieldLeftView];
    [self.textField setValue:[UIColor colorWithRed:176 / 255.0f green:176 / 255.0f blue: 176 / 255.0f alpha:1.0f]
                  forKeyPath:@"_placeholderLabel.textColor"];
    self.textField.tintColor = [UIColor colorWithRed:98 / 255.0f green:97 / 255.0f blue: 101 / 255.0f alpha:1.0f];
    
}

- (void)setupTextFieldLeftView {
    UIImageView *searchImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    searchImageView.image = [UIImage imageNamed:@"search"];
    searchImageView.contentMode = UIViewContentModeCenter;
    self.textField.leftView = searchImageView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    if ([self.delegate respondsToSelector:@selector(searchButtonWasPressedForSearchDetailView:)]) {
        [self.delegate searchButtonWasPressedForSearchDetailView:self];
    }
    return YES;
}

- (IBAction)textFieldEditingChanged:(UITextField *)sender {
    if ([self.delegate respondsToSelector:@selector(textFieldEditingChangedForSearchDetailView:)]) {
        [self.delegate textFieldEditingChangedForSearchDetailView:self];
    }
}


#pragma mark - Handlers

- (IBAction)dismissButtonWasPressed:(UIButton *)sender {
    [self.textField resignFirstResponder];
    if ([self.delegate respondsToSelector:@selector(dismissButtonWasPressedForSearchDetailView:)]) {
        [self.delegate dismissButtonWasPressedForSearchDetailView:self];
    }
}

@end
