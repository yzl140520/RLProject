//
//  UIImageView+load.h
//  MonoDemo
//
//  Created by yzl on 16/4/28.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (load)
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
- (void)setTwinkleColor:(UIColor*)color;
- (void)yzl_setImageWithURL:(NSURL *)url placeholder:(UIImage*)placeholder;
@end
