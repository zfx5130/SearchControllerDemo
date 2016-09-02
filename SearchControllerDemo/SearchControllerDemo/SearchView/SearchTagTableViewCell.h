//
//  SearchTagTableViewCell.h
//  SearchControllerDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKTagView.h"

@interface SearchTagTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentEmptyLabel;

- (void)renderCellWithTags:(NSArray *)tags;
@property (weak, nonatomic) IBOutlet SKTagView *tagView;

@end
