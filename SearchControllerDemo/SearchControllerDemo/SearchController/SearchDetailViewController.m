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
#import "SearchTagHeadView.h"


@interface UIImage (SKTagView)

+ (UIImage *)imageWithColor: (UIColor *)color;

@end

@implementation UIImage (SKTagView)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end

@interface SearchDetailViewController ()
<SearchDetailViewDelegate,
UITableViewDelegate,
UITableViewDataSource,
SKTagViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *searchTagTableView;
@property (weak, nonatomic) IBOutlet UITableView *searchResultTableView;

@property (strong, nonatomic) SearchDetailView *searchDetailView;
@property (copy, nonatomic) NSArray *tags;
@property (copy, nonatomic) NSArray *historyTags;
@property (copy, nonatomic) NSArray *colors;

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

- (void)configureCell:(SearchTagTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    cell.tagView.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
    cell.tagView.padding = UIEdgeInsetsMake(0, 10, 0, 10);
    cell.tagView.interitemSpacing = 10;
    cell.tagView.lineSpacing = 10;
    [cell.tagView removeAllTags];
    if (indexPath.section == 0) {
        cell.tagView.hidden = self.historyTags.count == 0 ;
        cell.contentEmptyLabel.hidden = !cell.tagView.hidden;
        [self.historyTags enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            SKTag *tag = [SKTag tagWithText:obj];
            tag.textColor =  [UIColor colorWithRed:81 / 255.0f green:81 / 255.0f blue:81/255.0f alpha:1.0f];
            tag.fontSize = 14;
            tag.padding = UIEdgeInsetsMake(8, 8, 8, 8);
            tag.cornerRadius = 10;
            tag.borderColor = [UIColor lightGrayColor];
            tag.borderWidth = .5f;
            tag.bgImg = [UIImage imageWithColor:[UIColor whiteColor]];
            tag.enable = YES;
            [cell.tagView addTag:tag];
        }];
    } else {
        [self.tags enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            SKTag *tag = [SKTag tagWithText:obj];
            tag.textColor = self.colors[idx % self.colors.count];
            tag.fontSize = 14;
            tag.padding = UIEdgeInsetsMake(8, 8, 8, 8);
            tag.cornerRadius = 10;
            tag.borderColor = [UIColor lightGrayColor];
            tag.borderWidth = .5f;
            tag.bgImg = [UIImage imageWithColor:[UIColor whiteColor]];
            tag.enable = YES;
            [cell.tagView addTag:tag];
        }];
    }
}

- (void)setupSearchView {
    self.navigationController.navigationBar.translucent = NO;
    self.searchDetailView = [[SearchDetailView alloc] initWithFrame:CGRectMake(0, 3, [UIScreen mainScreen].bounds.size.width, 30)];
    self.searchDetailView.textField.placeholder = self.placeHolderText;
    self.searchDetailView.delegate = self;
    [self.searchDetailView.textField becomeFirstResponder];
    [self.navigationController.navigationBar addSubview:self.searchDetailView];
    self.searchTagTableView.tableFooterView = [[UIView alloc] init];
    self.searchTagTableView.backgroundColor = [UIColor whiteColor];
    self.searchResultTableView.tableFooterView = [[UIView alloc] init];
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

#pragma mark - SKTagViewDelegate

- (void)tagButtonDidSelectedForTagTitle:(NSString *)title {
    NSLog(@"title:::::::%@", title);
}

#pragma mark - Getters & Setters

- (NSArray *)tags {
    if (!_tags) {
        _tags = @[
                  @"KISSBABY",
                  @"湿巾",
                  @"吸管杯",
                  @"火火兔",
                  @"压脚",
                  @"退热贴",
                  @"答复发送到"
                  ];
    }
    return _tags;
}

- (NSArray *)historyTags {
    if (!_historyTags) {
        _historyTags = @[@"呵呵呵呵是短发是阿斯蒂芬安抚阿道夫案发时阿斯蒂芬是打发发顺丰阿斯蒂芬安抚阿萨德",
                         @"面膜啥都发发发顺丰安抚阿萨德",
                         @"火兔梵蒂冈地方个梵蒂冈第三个到国服大概是的",
                         @"挖地方",
                         @"阿道夫阿道夫爱的个梵蒂冈返回规范和规划方法"];
        //_historyTags = [NSArray array];
    }
    return _historyTags;
}


- (NSArray *)colors {
    if (!_colors) {
        _colors = @[
                    [UIColor colorWithRed:245 / 255.0f green:86 / 255.0f blue:160 / 255.0f alpha:1.0f],
                    [UIColor colorWithRed:81 / 255.0f green:81 / 255.0f blue:81/255.0f alpha:1.0f]
                    ];
    }
    return _colors;
}

#pragma mark - SearchDetailViewDelegate

- (void)dismissButtonWasPressedForSearchDetailView:(SearchDetailView *)searchView {
    [self dismissViewControllerAnimated:NO
                             completion:nil];
}

- (void)searchButtonWasPressedForSearchDetailView:(SearchDetailView *)searchView {
    NSLog(@"搜索内容:::::::::%@",searchView.textField.text);
}

- (void)textFieldEditingChangedForSearchDetailView:(SearchDetailView *)searchView {
    NSLog(@"搜索内容：：：：：：：%@",searchView.textField.text);
    self.searchTagTableView.hidden  = YES;
    self.searchResultTableView.hidden = !self.searchTagTableView.hidden;
}


#pragma mark - UITableViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.searchDetailView) {
        [self.searchDetailView.textField resignFirstResponder];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.searchTagTableView) {
        SearchTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SearchTagTableViewCell class])];
        [self configureCell:cell atIndexPath: indexPath];
        return [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    }
    return 50.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == self.searchTagTableView) {
        SearchTagHeadView *headView = [[SearchTagHeadView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 45.0f)];
        headView.backgroundColor = [UIColor whiteColor];
        NSString *leftImageName = section == 0 ? @"test" : @"test1";
        NSString *titleName = section == 0 ? @"最近搜索" : @"热门搜索";
        BOOL isHidden = section == 0 ? NO : YES;
        headView.leftImageView.image = [UIImage imageNamed:leftImageName];
        headView.titleLabel.text = titleName;
        headView.clearButton.hidden = isHidden;
        return headView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == self.searchTagTableView) {
        return 45.0f;
    }
    return CGFLOAT_MIN;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchTagTableView) {
        return 1;
    }
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.searchTagTableView) {
        return 2;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.searchTagTableView) {
        SearchTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SearchTagTableViewCell class])];
        if ([cell respondsToSelector:@selector(layoutMargins)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
        cell.contentEmptyLabel.hidden = indexPath.section != 0;
        [self configureCell:cell atIndexPath:indexPath];
        cell.tagView.delegate = self;
        return cell;
    }
    SearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SearchResultTableViewCell class])];
    return cell;
}


@end
