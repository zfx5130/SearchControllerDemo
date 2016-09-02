//
//  SearchTagTableViewCell.m
//  SearchControllerDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "SearchTagTableViewCell.h"

@implementation SearchTagTableViewCell

#pragma mark - Private

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected
           animated:(BOOL)animated {
    [super setSelected:selected
              animated:animated];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setCellHeight];
}

#pragma mark - Public

- (void)renderCellWithTags:(NSArray *)tags {
    
    self.tagCollectionView.delegate = self;
    self.tagCollectionView.tagTextFont = [UIFont systemFontOfSize:15.0f];
    self.tagCollectionView.horizontalSpacing = 6.0;
    self.tagCollectionView.verticalSpacing = 12.0;
    [self.tagCollectionView addTags:tags];
    
    [self.tagCollectionView setTagAtIndex:0 selected:YES];
    [self.tagCollectionView setTagAtIndex:4 selected:YES];
    
    // Style2
//    self.tagCollectionView.tagTextFont = [UIFont systemFontOfSize:14.0f];
//    self.tagCollectionView.extraSpace = CGSizeMake(12, 12);
//    self.tagCollectionView.tagTextColor = [UIColor colorWithRed:93 / 256.0f green:64 / 256.0f blue:55 / 256.0f alpha:1];
//    self.tagCollectionView.tagSelectedTextColor = [UIColor colorWithRed:33 / 256.0f green:33 / 256.0f blue:33 / 256.0f alpha:1];
//    self.tagCollectionView.tagBackgroundColor = [UIColor colorWithRed:215 / 256.0f green:204 / 256.0f blue:200 / 256.0f alpha:1];
//    self.tagCollectionView.tagSelectedBackgroundColor = [UIColor colorWithRed:255 / 256.0f green:193 / 256.0f blue:7 / 256.0f alpha:1];
//    self.tagCollectionView.tagCornerRadius = 8.0f;
//    self.tagCollectionView.tagSelectedCornerRadius = 14.0f;
//    self.tagCollectionView.tagBorderWidth = 2.0f;
//    self.tagCollectionView.tagSelectedBorderWidth = 4.0f;
//    self.tagCollectionView.tagBorderColor = [UIColor colorWithRed:33 / 256.0f green:33 / 256.0f blue:33 / 256.0f alpha:1];
//    self.tagCollectionView.tagSelectedBorderColor = [UIColor colorWithRed:93 / 256.0f green:64 / 256.0f blue:55 / 256.0f alpha:1];
}

- (void)layoutMarginsDidChange {
    NSLog(@"adsfas::::::::%@", @(self.tagCollectionView.contentHeight));
}

- (void)setCellHeight {
    
    CGRect frame = [self frame];
    frame.size.height = self.tagCollectionView.frame.size.height;
    self.frame = frame;
}


@end
