//
//  SearchTagHeadView.m
//  SearchControllerDemo
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "SearchTagHeadView.h"

@implementation SearchTagHeadView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                      owner:self
                                    options:nil];
        self.view.frame = frame;
        [self addSubview:self.view];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Handlers

- (IBAction)clearHistory:(UIButton *)sender {
    NSLog(@"清空");
}


@end
