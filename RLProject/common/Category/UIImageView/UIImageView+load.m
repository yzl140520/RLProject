//
//  UIImageView+load.m
//  MonoDemo
//
//  Created by yzl on 16/4/28.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "UIImageView+load.h"
#import <objc/runtime.h>
#import <UIImageView+WebCache.h>
@implementation UIImageView (load)
#pragma mark - pravite method
-(CAKeyframeAnimation*)getKeyAnimation{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    //方式1：放大再缩小（类似系统alert）
    //如果需要更好的效果
    //可以添加 .keyTimes 属性。
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
    animation.values = values;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.duration = 0.5;
    return animation;
    
}
- (UIView*)twinkleView{
    UIView* twinkleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    twinkleView.layer.cornerRadius = 15/2.0;
    twinkleView.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
    UIColor* color = objc_getAssociatedObject(self, @"twinkleColor");
    if (color) {
        twinkleView.backgroundColor = color;

    }else{
        twinkleView.backgroundColor = [UIColor grayColor];
    }
    return twinkleView;

}
-(void)startLoading{
    self.alpha = 1.0;
    CAKeyframeAnimation *animation = [self getKeyAnimation];
    UIView* twinkleView = objc_getAssociatedObject(self, @"twinkleView");
    if (!twinkleView) {
        twinkleView = [self twinkleView];
        objc_setAssociatedObject(self, @"twinkleView",twinkleView,OBJC_ASSOCIATION_RETAIN);

    }
    twinkleView.center = self.center;
    [self addSubview:twinkleView];
    [self bringSubviewToFront:twinkleView];
    [twinkleView.layer addAnimation:animation forKey:@"animation"];
}
-(void)stopLoading{
    UIView* twinkleView = objc_getAssociatedObject(self, @"twinkleView");
    [twinkleView.layer removeAnimationForKey:@"animation"];
    [twinkleView removeFromSuperview];
}
- (void)setTwinkleColor:(UIColor*)color{
    objc_setAssociatedObject(self, @"twinkleColor", self, OBJC_ASSOCIATION_RETAIN);
}
- (void)yzl_setImageWithURL:(NSURL *)url placeholder:(UIImage*)placeholder{
    [self stopLoading];
    [self startLoading];
    
    [self sd_setImageWithURL:url placeholderImage:nil options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [self stopLoading];
        if (placeholder && !image) {
            self.alpha = 0.5;
            self.image = placeholder;
            [UIView animateWithDuration:0.5 animations:^{
                self.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        }

    }];
}
@end
