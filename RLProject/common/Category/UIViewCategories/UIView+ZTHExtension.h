//
//  UIView+ZTHExtension.h
//  ztjy_yd
//
//  Created by 洪天培 on 16/6/13.
//  Copyright © 2016年 SZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZTHExtension)

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width;

@end
