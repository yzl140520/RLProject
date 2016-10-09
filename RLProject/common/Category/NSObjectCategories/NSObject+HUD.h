//
//  NSObject+HUD.h
//  ztjy
//
//  Created by 基米 on 15/7/29.
//  Copyright (c) 2015年 jimi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface NSObject (HUD)
- (void)showHint:(NSString *)hint;

// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;

- (void)showHint:(NSString *)hint atYpositon:(float)yOffset;




@end
