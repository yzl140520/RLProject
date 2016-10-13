//
//  UIView+Common.m
//  ZTJY
//
//  Created by 王超 on 16/6/3.
//  Copyright © 2016年 掌通家园. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGRect) getFrameRect:(CGRect)frame {
    
    CGRect rc = CGRectZero;
    CGRect mainFrame = [[UIScreen mainScreen] bounds];
    if (mainFrame.size.height == 736) {
        CGFloat f = 736.0/667;
        rc.origin.x = frame.origin.x * f;
        rc.origin.y = frame.origin.y * f;
        rc.size.width = frame.size.width * f;
        rc.size.height = frame.size.height * f;
    } else if (mainFrame.size.height == 568) {
        CGFloat f = 568.0/667;
        rc.origin.x = frame.origin.x * f;
        rc.origin.y = frame.origin.y * f;
        rc.size.width = frame.size.width * f;
        rc.size.height = frame.size.height * f;
    } else if (mainFrame.size.height == 480) {
        CGFloat f = 480.0/667;
        rc.origin.x = frame.origin.x * f;
        rc.origin.y = frame.origin.y * f;
        rc.size.width = frame.size.width * f;
        rc.size.height = frame.size.height * f;
    } else {
        rc.origin.x = frame.origin.x;
        rc.origin.y = frame.origin.y;
        rc.size.width = frame.size.width;
        rc.size.height = frame.size.height;
    }
    
    return rc;
}

- (UIFont*) getFontByScale{
    UIFont* ft = [UIFont systemFontOfSize:20.0f];
    CGRect mainFrame = [[UIScreen mainScreen] bounds];
    if (mainFrame.size.height == 736) {
        CGFloat f = 736.0/667;
        ft = [UIFont systemFontOfSize:20.0 * f];
    } else if (mainFrame.size.height == 568) {
        CGFloat f = 568.0/667;
        ft = [UIFont systemFontOfSize:20.0 * f];
    } else if (mainFrame.size.height == 480) {
        CGFloat f = 480.0/667;
        ft = [UIFont systemFontOfSize:20.0 * f];
    }
    return ft;
}


- (void)doCircleFrame{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor colorWithHexString:@"0xdddddd"].CGColor;
}
- (void)doNotCircleFrame{
    self.layer.cornerRadius = 0.0;
    self.layer.borderWidth = 0.0;
}

- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = width;
    if (!color) {
        self.layer.borderColor = [UIColor colorWithHexString:@"0xdddddd"].CGColor;
    }else{
        self.layer.borderColor = color.CGColor;
    }
}

- (void)addRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setSubScrollsToTop:(BOOL)scrollsToTop{
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)obj setScrollEnabled:scrollsToTop];
            *stop = YES;
        }
    }];
}

@end
