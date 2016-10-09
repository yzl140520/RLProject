//
//  RLStarButton.m
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "RLStarButton.h"
#import "MASViewConstraint.h"
#import "View+MASAdditions.h"


@interface RLStarButton (){
    CAEmitterLayer *_effectLayer;
    CAEmitterCell *_effectCell;
}
@property (strong, nonatomic) UIImageView* o_imageView; //图片
@property (strong, nonatomic) UIImage* o_zanImage;      //点赞后的图片
@property (strong, nonatomic) UIImage* o_unZanImage;    //未点赞的图片
///*
// * name
// */
//@property (strong,nonatomic) CALayer * leftLayer;
///*
// * name
// */
//@property (strong,nonatomic) CALayer* rightLayer;
@end

@implementation RLStarButton

-(instancetype)initWithFrame:(CGRect)frame zanImage:(UIImage *)zanImage unZanImage:(UIImage *)unZanIamge{
    self=[super initWithFrame:frame];
    if (self) {
        _o_zanImage=zanImage;
        _o_unZanImage=unZanIamge;
        [self initBaseLayout];
    }
    return self;
}

/**
 *  Init base layout
 */
-(void)initBaseLayout{
    _isZan=NO;
    _effectLayer=[CAEmitterLayer layer];
    [_effectLayer setFrame:CGRectMake(0, 0, CGRectGetHeight(self.frame), CGRectGetHeight(self.frame))];
    [self.layer addSublayer:_effectLayer];
    [_effectLayer setEmitterShape:kCAEmitterLayerCircle];
    [_effectLayer setEmitterMode:kCAEmitterLayerOutline];
    [_effectLayer setEmitterPosition:CGPointMake(10, CGRectGetHeight(self.frame)/2)];
    [_effectLayer setEmitterSize:CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    _effectCell=[CAEmitterCell emitterCell];
    [_effectCell setName:@"zanShape"];
    [_effectCell setContents:(__bridge id)[UIImage imageNamed:@"EffectImage"].CGImage];
    [_effectCell setAlphaSpeed:-1.0f];
    [_effectCell setLifetime:1.0f];
    [_effectCell setBirthRate:0];
    [_effectCell setVelocity:50];
    [_effectCell setVelocityRange:50];
    
    [_effectLayer setEmitterCells:@[_effectCell]];
    
    UITapGestureRecognizer *tapImageViewGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zanAnimationPlay)];
    [self addGestureRecognizer:tapImageViewGesture];
    [self addSubview:self.o_imageView];
    [self.o_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.and.bottom.equalTo(self).offset(0);
        make.width.equalTo(@(CGRectGetHeight(self.frame)));
    }];
    [self addSubview:self.o_titleLabel];
    [self.o_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.and.bottom.equalTo(self).offset(0);
        make.left.equalTo(self.o_imageView.mas_right).offset(0);
        
    }];
}

/**
 *  An animation for zan action
 */
-(void)zanAnimationPlay{
    //    [self.leftLayer removeFromSuperlayer];
    //    [self.rightLayer removeFromSuperlayer];
    [self setIsZan:!self.isZan];
    if (self.clickHandler!=nil) {
        self.clickHandler(self);
    }
    //    if (self.isZan) {
    [self.o_imageView setBounds:CGRectMake(0, 0, 0, 0)];
    [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:5 options:UIViewAnimationOptionCurveLinear animations:^{
        [self.o_imageView setBounds:CGRectMake(0, 0, CGRectGetHeight(self.frame), CGRectGetHeight(self.frame))];
        if (self.isZan) {
            CABasicAnimation *effectLayerAnimation=[CABasicAnimation animationWithKeyPath:@"emitterCells.zanShape.birthRate"];
            [effectLayerAnimation setFromValue:[NSNumber numberWithFloat:100]];
            [effectLayerAnimation setToValue:[NSNumber numberWithFloat:0]];
            [effectLayerAnimation setDuration:0.0f];
            [effectLayerAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            [_effectLayer addAnimation:effectLayerAnimation forKey:@"ZanCount"];
        }
    } completion:^(BOOL finished) {
    }];
    //    }else{
    //
    //        self.leftLayer.frame = self.o_imageView.bounds;
    //        self.rightLayer.frame = self.o_imageView.bounds;
    //        [self.layer addSublayer:self.leftLayer];
    //        [self.layer addSublayer:self.rightLayer];
    //
    //        UIBezierPath* leftPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(self.o_imageView.frame)/2.0, CGRectGetHeight(self.o_imageView.frame))];
    //        CAShapeLayer* leftShapeLayer = [[CAShapeLayer alloc]init];
    //        leftShapeLayer.path = [leftPath CGPath];
    //        self.leftLayer.mask = leftShapeLayer;
    //
    //        UIBezierPath* rightPath = [UIBezierPath bezierPathWithRect:CGRectMake(CGRectGetWidth(self.o_imageView.frame)/2.0, 0, CGRectGetWidth(self.o_imageView.frame)/2.0, CGRectGetHeight(self.o_imageView.frame))];
    //        CAShapeLayer* rightShapeLayer = [[CAShapeLayer alloc]init];
    //        rightShapeLayer.path = [rightPath CGPath];
    //        self.rightLayer.mask = rightShapeLayer;
    //        CABasicAnimation* theAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //        theAnimation.delegate = self;
    //        theAnimation.duration = 0.2;
    //        theAnimation.repeatCount = 0;
    //        theAnimation.removedOnCompletion = NO;
    //        theAnimation.fillMode = kCAFillModeForwards;
    //        theAnimation.autoreverses = NO;
    //        theAnimation.fromValue = [NSNumber numberWithFloat:0];
    //        theAnimation.toValue = [NSNumber numberWithFloat:(-M_PI/3.0)];
    //        [self.leftLayer addAnimation:theAnimation forKey:theAnimation.keyPath];
    //
    //        CABasicAnimation* theAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //        theAnimation1.delegate = self;
    //        theAnimation1.duration = 0.2;
    //        theAnimation1.repeatCount = 0;
    //        theAnimation1.removedOnCompletion = NO;
    //        theAnimation1.fillMode = kCAFillModeForwards;
    //        theAnimation1.autoreverses = NO;
    //        theAnimation1.fromValue = [NSNumber numberWithFloat:0];
    //        theAnimation1.toValue = [NSNumber numberWithFloat:(M_PI/3.0)];
    //        [self.rightLayer addAnimation:theAnimation1 forKey:theAnimation1.keyPath];
    //
    //
    //    }
    
    
    
}

#pragma mark - Property method
-(void)setIsZan:(BOOL)isZan{
    _isZan=isZan;
    if (isZan) {
        [self.o_imageView setImage:_o_zanImage];
    }else{
        [self.o_imageView setImage:_o_unZanImage];
    }
}
- (void)setTitleFont:(UIFont *)font{
    self.o_titleLabel.font = font;
}
- (void)setTitle:(NSString *)title{
    self.o_titleLabel.text = title;
}
#pragma mark - setter & getter
- (UIImageView*)o_imageView{
    if (!_o_imageView) {
        _o_imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _o_imageView;
}
- (UILabel*)o_titleLabel{
    if (!_o_titleLabel) {
        _o_titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    }
    return _o_titleLabel;
}

//- (CALayer*)leftLayer{
//    if (!_leftLayer) {
//        _leftLayer = [[CALayer alloc]init];
//        _leftLayer.frame = self.o_imageView.frame;
//        _leftLayer.contents = (__bridge id _Nullable)([_o_zanImage CGImage]);
//        _leftLayer.anchorPoint = CGPointMake(0.5, 1);
//        CGFloat positionX = CGRectGetMinX(_leftLayer.frame) + 0.5*CGRectGetWidth(_leftLayer.frame);
//        CGFloat positionY = CGRectGetMinY(_leftLayer.frame) + 1* CGRectGetHeight(_leftLayer.frame);
//        _leftLayer.position = CGPointMake(positionX, positionY);
//
//    }
//    return _leftLayer;
//}
//
//- (CALayer*)rightLayer{
//    if (!_rightLayer) {
//        _rightLayer = [[CALayer alloc]init];
//        _rightLayer.frame = self.o_imageView.frame;
//        _rightLayer.contents = (__bridge id _Nullable)([_o_zanImage CGImage]);
//        _rightLayer.anchorPoint = CGPointMake(0.5, 1);
//        CGFloat positionX = CGRectGetMinX(_rightLayer.frame) + 0.5*CGRectGetWidth(_rightLayer.frame);
//        CGFloat positionY = CGRectGetMinY(_rightLayer.frame) + 1* CGRectGetHeight(_rightLayer.frame);
//        _rightLayer.position = CGPointMake(positionX, positionY);
//    }
//    return _rightLayer;
//}

//#pragma mark - delegate
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
//    [self.leftLayer removeFromSuperlayer];
//    [self.rightLayer removeFromSuperlayer];
//
//}


@end
