//
//  RLTwinkleLoadView.m
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "RLTwinkleLoadView.h"
#import "UIImage+ZTHColor.h"

#define STAR_VIEW_WIDTH 30
@interface RLTwinkleLoadView()
@property (strong, nonatomic) UIView* o_twinkleView;              //一闪一闪的星星视图
@property (strong, nonatomic) UIImageView* o_loadFailImageView;   //加载失败图片视图
@property (strong, nonatomic) UILabel* o_loadFailLabel;           //加载失败提示语
@property (strong, nonatomic) UIButton* o_reloadButton;           //加载失败按钮
@property (copy,   nonatomic) void(^o_reloadBlock)(void);         //重新加载block
@end
@implementation RLTwinkleLoadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
        [self showLoadFailUI:NO];
        self.backgroundColor = [UIColor colorWithWhite:0.941 alpha:1.000];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark - setter & getter
- (UIView*)o_twinkleView{
    if (!_o_twinkleView) {
        _o_twinkleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, STAR_VIEW_WIDTH, STAR_VIEW_WIDTH)];
        _o_twinkleView.layer.cornerRadius = STAR_VIEW_WIDTH/2.0;
        _o_twinkleView.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
        _o_twinkleView.backgroundColor = [UIColor whiteColor];
    }
    return _o_twinkleView;
}
- (UIImageView*)o_loadFailImageView{
    if (!_o_loadFailImageView) {
        _o_loadFailImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,CGRectGetMinY(_o_loadFailLabel.frame)-25-100, 100, 100)];
        _o_loadFailImageView.image = [UIImage imageNamed:@"common_load_fail"];
        _o_loadFailImageView.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetMidY(_o_loadFailImageView.frame));
    }
    return _o_loadFailImageView;
}
- (UILabel*)o_loadFailLabel{
    if (!_o_loadFailLabel) {
        _o_loadFailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 218, 21)];
        _o_loadFailLabel.textAlignment = NSTextAlignmentCenter;
        _o_loadFailLabel.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
        _o_loadFailLabel.text = @"非常抱歉，加载失败";
        _o_loadFailLabel.textColor = [UIColor colorWithWhite:0.200 alpha:1.000];
        _o_loadFailLabel.backgroundColor = [UIColor clearColor];
    }
    return _o_loadFailLabel;
}
- (UIButton*)o_reloadButton{
    if (!_o_reloadButton) {
        _o_reloadButton = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_o_loadFailLabel.frame)+13, 290, 40)];
        [_o_reloadButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:11/255.0 green:176/255.0 blue:233/255.0 alpha:1.0] andSize:CGSizeMake(260, 40)] forState:UIControlStateNormal];
        [_o_reloadButton addTarget:self action:@selector(handleReloadEvent:) forControlEvents:UIControlEventTouchUpInside];
        _o_reloadButton.layer.cornerRadius = 8;
        _o_reloadButton.clipsToBounds = YES;
        [_o_reloadButton setTintColor:[UIColor whiteColor]];
        [_o_reloadButton setTitle:NSLocalizedString(@"reload", nil) forState:UIControlStateNormal];
        [_o_reloadButton setTitle:NSLocalizedString(@"reload", nil) forState:UIControlStateHighlighted];
        _o_reloadButton.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetMidY(_o_reloadButton.frame));
        
    }
    return _o_reloadButton;
}
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
- (void)initSubviews{
    [self addSubview:self.o_twinkleView];
    [self.o_twinkleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(STAR_VIEW_WIDTH));
        make.center.equalTo(self).offset(0);
    }];
    
    [self addSubview:self.o_loadFailImageView];
    [self.o_loadFailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@100);
        make.centerX.equalTo(self).offset(0);
        make.centerY.equalTo(self).offset(-85);
    }];
    
    [self addSubview:self.o_loadFailLabel];
    [self.o_loadFailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self).offset(0);
        make.height.equalTo(@20);
        make.center.equalTo(self).offset(0);
    }];
    
    [self addSubview:self.o_reloadButton];
    [self.o_reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@290);
        make.height.equalTo(@40);
        make.centerX.equalTo(self).offset(0);
        make.top.equalTo(self.o_loadFailLabel.mas_bottom).offset(10);
        //        make.centerY.equalTo(self).offset(24);
    }];
}
#pragma mark - response method
-(void)handleReloadEvent:(UIButton*)btn{
    [self startLoading];
}

#pragma mark - publich method
-(void)showLoadFailUI:(BOOL)isShow{
    self.o_loadFailLabel.hidden = !isShow;
    self.o_loadFailImageView.hidden = !isShow;
    self.o_reloadButton.hidden = !isShow;
    self.o_twinkleView.hidden = isShow;
}
-(void)startLoading{
    self.hidden = NO;
    [self showLoadFailUI:NO];
    self.alpha = 1.0;
    CAKeyframeAnimation *animation = [self getKeyAnimation];
    [self.o_twinkleView.layer addAnimation:animation forKey:@"animation"];
    if (self.o_reloadBlock) {
        self.o_reloadBlock();
    }
}
-(void)stopLoading{
    [self.o_twinkleView.layer removeAnimationForKey:@"animation"];
}
-(void)dismiss{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 0.1;
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self.o_twinkleView.layer removeAnimationForKey:@"animation"];
    }];
    //    POPBasicAnimation* animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    //    animation.fromValue = @(1.0);
    //    animation.toValue   = @(0.0);
    //    animation.duration  = 0.5;
    //    [self pop_addAnimation:animation forKey:@"alpha"];
}
//-(void)setReloadBlock:(void (^)(void))reloadBlock{
//    self.o_reloadBlock = reloadBlock;
//}
-(void)setTwinkleViewOffCenterY:(CGFloat)offCenterY{
    [self.o_twinkleView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(offCenterY);
    }];
}
/*!
 *  @author yzl, 16-01-08 13:01:31
 *
 *  @brief  设置加载失败图片
 *
 *  @param image
 */
- (void)setLoadFailImage:(UIImage*)image{
    self.o_loadFailImageView.image = image;
}
/*!
 *  @author yzl, 16-06-02 11:06:26
 *
 *  @brief 加载中所需执行的操作
 *
 *  @param loadBlock loadBlock description
 */
- (void)setLoadBlock:(void(^)(void))loadBlock{
    self.o_reloadBlock = loadBlock;
}


@end
