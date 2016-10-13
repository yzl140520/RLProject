//
//  UIView+Common.h
//  ZTJY
//
//  Created by 王超 on 16/6/3.
//  Copyright © 2016年 掌通家园. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Common)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

- (void)doCircleFrame;
- (void)doNotCircleFrame;
- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;
- (void)addRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
- (void)setSubScrollsToTop:(BOOL)scrollsToTop;

- (CGRect) getFrameRect:(CGRect)frame;
- (UIFont*) getFontByScale;
@end

