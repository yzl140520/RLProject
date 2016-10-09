//
//  ZTHCustomPromptView.h
//  ztjyyd
//
//  Created by yzl on 16/8/26.
//  Copyright © 2016年 szy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTHCustomPromptView : UIView
+ (instancetype)showAlertWithMessage:(NSString*)message
                       cancelTitle:(NSString*)cancelTitle
                        otherTitle:(NSString*)otherTitle
                       actionBlock:(void(^)(NSInteger buttonIndex))actionBlock;

- (void)show;
- (void)hide;

- (void)setCancelButtonTitleColor:(UIColor*)color;

- (void)setOtherButtonTitleColor:(UIColor*)color;
@end
