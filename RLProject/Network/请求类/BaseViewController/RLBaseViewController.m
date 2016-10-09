//
//  RLBaseViewController.m
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "RLBaseViewController.h"
#import "UIImage+ZTHColor.h"
@implementation RLBaseViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //设置默认样式
    self.view.backgroundColor = UIColorFromRGBV(0xf8f8f8);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kAppDefaultColor andSize:CGSizeMake(1, 1)] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    self.navigationController.navigationBar.translucent = NO;
    
}
//导航栏设置成全应用统一样式,设置返回样式
-(void)resetNavigationBarWithBackAction:(SEL)action  title:(NSString*)title{
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(0, 0, 40, 40)];
    [left setImage:[UIImage imageNamed:@"bar_topbar_icon_back_n"] forState:UIControlStateNormal];
    [left setImage:[UIImage imageNamed:@"bar_topbar_icon_back_p"] forState:UIControlStateHighlighted];
    [left addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:left];
    if(([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)){
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = -20;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer, leftButton];
    }else{
        self.navigationController.topViewController.navigationItem.leftBarButtonItem = leftButton;
    }
    self.navigationItem.title = title;
    
}


#pragma mark - Navigation

/**
 *  创建左侧返回按钮
 */
- (void)createNavigationLeftReturnBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setImage:[UIImage imageNamed:@"bar_topbar_icon_back_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"bar_topbar_icon_back_n"] forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
    [btn addTarget:self action:@selector(leftBackBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  创建左侧Dismiss按钮
 */
- (void)createNavigationLeftDismissBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setImage:[UIImage imageNamed:@"bar_topbar_icon_back_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"bar_topbar_icon_back_n"] forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
    [btn addTarget:self action:@selector(leftDismissBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  创建右侧导航按钮
 */
- (void)createNavigationRightBtnWithTitle:(NSString *)title
{
    CGSize labelSize = [Utils stringSizeWithString:title font:16.f];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, labelSize.width, labelSize.height);
    btn.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightTextBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* offsetItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    offsetItem.width = -5;
    self.navigationItem.rightBarButtonItems =@[offsetItem ,[[UIBarButtonItem alloc] initWithCustomView:btn]];
}

/**
 *  创建右侧导航按钮
 *  @param  normalImg           正常按钮图片
 *  @param  highlightedImg      按下的按钮图片
 */
- (void)createNavigationRightBtnWithNormalImage:(UIImage *)nImg highlightedImg:(UIImage *)hImg
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 50);
    [btn setImage:nImg forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightImgBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    if (hImg) {
        [btn setImage:hImg forState:UIControlStateHighlighted];
    }
    UIBarButtonItem* offsetItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    offsetItem.width = -20;
    self.navigationItem.rightBarButtonItems =@[offsetItem ,[[UIBarButtonItem alloc] initWithCustomView:btn]];
}

#pragma mark -  导航栏按钮事件

// 左侧返回事件
- (void)leftBackBarButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 左侧取消事件
- (void)leftDismissBarButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//右侧按钮事件
- (void)rightTextBarButtonClick
{
    //在子控制器里面重写事件
}

- (void)rightImgBarButtonClick
{
    //在子控制器里面重写事件
}


@end
