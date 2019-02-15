//
//  SegementViewController.h
//  SegementViewController
//
//  Created by 毛文豪 on 2019/2/15.
//  Copyright © 2019 毛文豪. All rights reserved.
//

#define topBtnH 40

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SegementViewController : UIViewController

@property (nonatomic, strong) NSArray *btnTitles;//顶部按钮标题数组
@property (nonatomic, strong) NSMutableArray *views;//要显示的view数组
@property (nonatomic,assign) NSInteger maxViewCount;//最多显示的按钮数
@property (nonatomic, assign) int currentIndex;//显示第几个view
@property (nonatomic, weak) UIScrollView *scrollView;//滑动的scrollview
@property (nonatomic, strong) NSMutableArray *topBtns;//顶部按钮数组

- (void)configurationComplete;//配置好btnTitles views currentIndex后调用，开始布局视图
- (void)topBtnClick:(UIButton *)btn;//第几个按钮点击
- (void)changeCurrentIndex:(int)currentIndex;//当前页面切换，子类实现

@end

NS_ASSUME_NONNULL_END
