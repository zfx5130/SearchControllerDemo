//
//  SearchTagTableViewCell.h
//  SearchControllerDemo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EYTagView.h"

@interface SearchTagTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentEmptyLabel;

@property (weak, nonatomic) IBOutlet EYTagView *tagView;

@end
