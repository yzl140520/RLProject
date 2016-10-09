//
//  ZTHCustomPromptView.m
//  ztjyyd
//
//  Created by yzl on 16/8/26.
//  Copyright © 2016年 szy. All rights reserved.
//

#import "ZTHCustomPromptView.h"
#import "NSString+ZTHUtils.h"
#define ALERTVIEW_WIDTH  270
#define ALERTVIEW_MIN_HEIGHT 110
#define ALERTVIEW_BUTTON_HEIGHT 45
@interface ZTHCustomPromptView()
/*
 * 标题
 */
@property (strong,nonatomic) NSString* title;
/*
 * 提示信息
 */
@property (strong,nonatomic) NSString* message;
/*
 * 取消按钮标题
 */
@property (strong,nonatomic) NSString* cancelTitle;
/*
 * 其它按钮标题
 */
@property (strong,nonatomic) NSString* otherTitle;
/*
 * 取消按钮
 */
@property (strong,nonatomic) UIButton* cancelButton;
/*
 * 其它按钮
 */
@property (strong,nonatomic) UIButton* otherButton;
/*
 * name
 */
@property (strong,nonatomic) UILabel* messageLabel;
/*!
 *  @author yzl, 16-03-03 09:03:38
 *
 *  @brief Description
 */
@property (copy, nonatomic) void(^actionBlock)(NSInteger buttonBlock);
/*
 * name
 */
@property (strong,nonatomic) UIView* alertView;
@end


@implementation ZTHCustomPromptView
+ (instancetype)showAlertWithMessage:(NSString*)message
                       cancelTitle:(NSString*)cancelTitle
                        otherTitle:(NSString*)otherTitle
                       actionBlock:(void(^)(NSInteger buttonIndex))actionBlock{
    ZTHCustomPromptView* alert = [[ZTHCustomPromptView alloc]initWithMessage:message
                                                     cancelTitle:cancelTitle
                                                      otherTitle:otherTitle
                                                     actionBlock:actionBlock];
    return alert;
}

- (instancetype)initWithMessage:(NSString*)message
                  cancelTitle:(NSString*)cancelTitle
                   otherTitle:(NSString*)otherTitle
                  actionBlock:(void(^)(NSInteger buttonIndex))actionBlock{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.message = message;
        self.cancelTitle = cancelTitle;
        self.otherTitle = otherTitle;
        self.actionBlock = actionBlock;
        self.backgroundColor = [UIColor colorWithWhite:0.500 alpha:0.330];
        [self initUI];
    }
    return self;
}

- (void)initUI{
    CGFloat height = 0;
    
    CGRect rect = [self.message textRectWithFont:self.messageLabel.font size:CGSizeMake(ALERTVIEW_WIDTH - 30, CGFLOAT_MAX)];
    CGRect messageFrame = self.messageLabel.frame;
    messageFrame.size.height = CGRectGetHeight(rect);
    self.messageLabel.text = self.message;
    [self.alertView addSubview:self.messageLabel];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.alertView).offset(15);
        make.right.equalTo(self.alertView).offset(-15);
        make.height.equalTo(@(ceilf(CGRectGetHeight(rect))));
        make.centerX.equalTo(self.alertView).offset(0);
        make.centerY.equalTo(self.alertView).offset(-ALERTVIEW_BUTTON_HEIGHT/2.0);

    }];
    

    CGFloat width = ALERTVIEW_WIDTH;
    if (self.otherTitle && ![self.otherTitle isEqualToString:@""]) {
        width = ALERTVIEW_WIDTH/2.0;
        [self.otherButton setTitle:self.otherTitle forState:UIControlStateNormal];
        [self.alertView addSubview:self.otherButton];
        [self.otherButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.right.equalTo(self.alertView).offset(0);
            make.width.equalTo(@(width));
            make.height.equalTo(@(ALERTVIEW_BUTTON_HEIGHT));
        }];
    }
    CGRect cancelFrame = self.cancelButton.frame;
    [self.cancelButton setFrame:cancelFrame];
    [self.cancelButton setTitle:self.cancelTitle forState:UIControlStateNormal];
    [self.alertView addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.left.equalTo(self.alertView).offset(0);
        make.width.equalTo(@(width));
        make.height.equalTo(@(ALERTVIEW_BUTTON_HEIGHT));
    }];
    
    UILabel* line = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ALERTVIEW_WIDTH, 0.5)];
    line.backgroundColor = UIColorFromRGBV(0xdedede);
    
    UILabel* line2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 0.5, ALERTVIEW_BUTTON_HEIGHT)];
    line2.backgroundColor = UIColorFromRGBV(0xdedede);
    [self.alertView addSubview:line];
    [self.alertView addSubview:line2];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.alertView).offset(0);
        make.height.equalTo(@0.5);
        make.centerX.equalTo(self.alertView).offset(0);
        make.bottom.equalTo(self.alertView).offset(-ALERTVIEW_BUTTON_HEIGHT);
    }];
    
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(0.5));
        make.height.equalTo(@ALERTVIEW_BUTTON_HEIGHT);
        make.centerX.equalTo(self.alertView).offset(0);
        make.bottom.equalTo(self.alertView).offset(0);
    }];

    
    height = CGRectGetHeight(rect) + 15 + 15 + ALERTVIEW_BUTTON_HEIGHT;
    if (height < ALERTVIEW_MIN_HEIGHT) {
        height = ALERTVIEW_MIN_HEIGHT;
    }
    
    CGRect alertFrame = self.alertView.frame;
    alertFrame.size.height = height;
    [self addSubview:self.alertView];
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(0);
        make.centerX.equalTo(self).offset(0);
        make.width.equalTo(@(ALERTVIEW_WIDTH));
        make.height.equalTo(@(height));
    }];
    
    self.alertView.alpha = 0;
    [self show];
}

#pragma mark - setter & getter
- (UIView*)alertView{
    if (!_alertView) {
        _alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ALERTVIEW_WIDTH, 150)];
        _alertView.backgroundColor = [UIColor whiteColor];
        _alertView.layer.cornerRadius = 8;
        _alertView.clipsToBounds = YES;
    }
    
    return _alertView;
}

- (UIButton*)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ALERTVIEW_WIDTH/2.0, 50)];
        _cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [_cancelButton setTitleColor:UIColorFromRGBV(0x333333) forState:UIControlStateNormal];
        _cancelButton.tag = 0;
        [_cancelButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (UIButton*)otherButton{
    if (!_otherButton) {
        _otherButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ALERTVIEW_WIDTH/2.0, 50)];
        _otherButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_otherButton setTitleColor:UIColorFromRGBV(0x00b6f8) forState:UIControlStateNormal];
        _otherButton.tag = 1;
        [_otherButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _otherButton;
}

- (UILabel*)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, ALERTVIEW_WIDTH - 20, 0)];
        _messageLabel.font = [UIFont boldSystemFontOfSize:16];
        _messageLabel.numberOfLines = 0;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _messageLabel.textColor = UIColorFromRGBV(0x333333);
    }
    return _messageLabel;
}

#pragma mark - response method
- (void)buttonAction:(UIButton*)sender{
    [self hide];
    if (self.actionBlock) {
        self.actionBlock(sender.tag);
    }
}

#pragma mark - publich method
- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alertView.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];

}

- (void)hide{
    [self removeFromSuperview];
}

- (void)setCancelButtonTitleColor:(UIColor*)color{
    if (!color) {
        return;
    }
    [self.cancelButton setTitleColor:color forState:UIControlStateNormal];
}

- (void)setOtherButtonTitleColor:(UIColor*)color{
    if (!color) {
        return;
    }
    [self.otherButton setTitleColor:color forState:UIControlStateNormal];
}
@end
