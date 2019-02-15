//
//  ViewController.m
//  SegementViewController
//
//  Created by 毛文豪 on 2019/2/15.
//  Copyright © 2019 毛文豪. All rights reserved.
//

#define screenWidth   ([UIScreen mainScreen].bounds.size.width)
#define screenHeight  ([UIScreen mainScreen].bounds.size.height)
#define statusBarH [[UIApplication sharedApplication] statusBarFrame].size.height
#define navBarH 44

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"分类";
    [self setupChilds];
}

#pragma mark - 布局视图
- (void)setupChilds
{
    //添加btnTitle
    self.btnTitles = @[@"分类1", @"分类2", @"分类3", @"分类4"];
    //添加tableview
    CGFloat scrollViewH = screenHeight - statusBarH - navBarH - topBtnH;
    for(int i = 0;i < self.btnTitles.count; i++)
    {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(screenWidth * i, 0, screenWidth, scrollViewH)];
        tableView.tag = i;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.tableFooterView = [UIView new];
        [self.views addObject:tableView];
    }
    //完成配置
    [super configurationComplete];
    [super topBtnClick:self.topBtns[self.currentIndex]];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier= @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@第%ld条数据", self.btnTitles[tableView.tag], indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
