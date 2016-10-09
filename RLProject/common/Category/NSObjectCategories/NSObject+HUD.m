//
//  NSObject+HUD.m
//  ztjy
//
//  Created by 基米 on 15/7/29.
//  Copyright (c) 2015年 jimi. All rights reserved.
//

#import "NSObject+HUD.h"
#import "ZTHSystemInfo.h"

@implementation NSObject (HUD)
- (void)showHint:(NSString *)hint
{
    if (!hint) {
        return;
    }
     //显示提示信息
    UIView *view =  [[UIApplication sharedApplication].delegate window];
//    UIView *view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = hint;
    hud.margin = 10.f;
    hud.yOffset = [ZTHSystemInfo isPhoneRetina5]?200.f:150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    //显示提示信息
    //UIView *view = [[UIApplication sharedApplication].windows lastObject];
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = hint;
    hud.margin = 10.f;
    hud.yOffset = [ZTHSystemInfo isPhoneRetina5]?200.f:150.f;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}
- (void)showHint:(NSString *)hint atYpositon:(float)yOffset{
    //显示提示信息
    //UIView *view = [[UIApplication sharedApplication].windows lastObject];
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = hint;
    hud.margin = 10.f;
    hud.yOffset = yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}




@end
