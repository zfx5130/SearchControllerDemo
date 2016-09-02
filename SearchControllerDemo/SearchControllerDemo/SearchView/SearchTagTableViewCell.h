//
//  SearchTagTableViewCell.h
//  SearchControllerDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTGTextTagCollectionView.h"

@interface SearchTagTableViewCell : UITableViewCell
<TTGTextTagCollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *contentEmptyLabel;

@property (weak, nonatomic) IBOutlet TTGTextTagCollectionView *tagCollectionView;

- (void)renderCellWithTags:(NSArray *)tags;

@end
