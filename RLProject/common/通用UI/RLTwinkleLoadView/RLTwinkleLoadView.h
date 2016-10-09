//
//  RLTwinkleLoadView.h
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLTwinkleLoadView : UIView
/**
 *  @author yzl, 15-08-27 17:08:27
 *
 *  开始加载
 */
-(void)startLoading;
/**
 *  @author yzl, 15-08-27 17:08:39
 *
 *  停止加载
 */
-(void)stopLoading;
/**
 *  @author yzl, 15-08-27 17:08:54
 *
 *  显示加载失败界面
 *
 *  @param isShow isShow description
 */
-(void)showLoadFailUI:(BOOL)isShow;
///**
// *  @author yzl, 15-08-27 17:08:12
// *
// *  设置重新加载block
// *
// *  @param reloadBlock reloadBlock description
// */
//-(void)setReloadBlock:(void(^)(void))reloadBlock;
/**
 *  @author yzl, 15-08-27 17:08:29
 *
 *  取消展示
 */
-(void)dismiss;
/**
 *  @author yzl, 15-08-27 17:08:47
 *
 *  设置一闪一闪view偏离中心的位置
 *
 *  @param offCenterY offCenterY description
 */
-(void)setTwinkleViewOffCenterY:(CGFloat)offCenterY;
/*!
 *  @author yzl, 16-01-08 13:01:31
 *
 *  @brief  设置加载失败图片
 *
 *  @param image
 */
- (void)setLoadFailImage:(UIImage*)image;
/*!
 *  @author yzl, 16-06-02 11:06:26
 *
 *  @brief 加载中所需执行的操作
 *
 *  @param loadBlock loadBlock description
 */
- (void)setLoadBlock:(void(^)(void))loadBlock;
@end
