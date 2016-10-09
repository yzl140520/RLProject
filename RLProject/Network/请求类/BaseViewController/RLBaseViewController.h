//
//  RLBaseViewController.h
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLBaseViewController : UIViewController
#pragma mark - Navigation
//导航栏设置成全应用统一样式,设置返回样式
-(void)resetNavigationBarWithBackAction:(SEL)action title:(NSString*)title;


/**
 *  创建左侧返回按钮
 */
- (void)createNavigationLeftReturnBtn;

/**
 *  创建左侧Dismiss按钮
 */
- (void)createNavigationLeftDismissBtn;

/**
 *  创建右侧导航按钮
 *  @param      按钮文字
 */
- (void)createNavigationRightBtnWithTitle:(NSString *)title;

/**
 *  创建右侧导航按钮
 *  @param  normalImg           正常按钮图片
 *  @param  highlightedImg      按下的按钮图片  没有则传nil
 */
- (void)createNavigationRightBtnWithNormalImage:(UIImage *)nImg highlightedImg:(UIImage *)hImg;

#pragma mark -  导航栏按钮事件

- (void)leftBackBarButtonClick NS_REQUIRES_SUPER;

- (void)leftDismissBarButtonClick NS_REQUIRES_SUPER;

- (void)rightTextBarButtonClick;

- (void)rightImgBarButtonClick;
@end
