//
//  NSString+Safe.h
//  ztjy_yd
//
//  Created by ChaohuiChen on 6/14/16.
//  Copyright © 2016 SZY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Safe)
+ (NSString *)safeString:(NSString *)src;

/**
 *  字符串是否为空nil or @""
 *
 *  @param str
 *
 *  @return YES 为空，NO不为空
 */
+ (BOOL)isEmptyStr:(NSString *)str;

+ (NSString*)safeString:(NSString*)src defaultValue:(NSString*)defaultValue;

+ (BOOL)isBlankString:(NSString *)string;
@end
