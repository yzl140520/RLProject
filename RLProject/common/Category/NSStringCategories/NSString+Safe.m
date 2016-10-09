//
//  NSString+Safe.m
//  ztjy_yd
//
//  Created by ChaohuiChen on 6/14/16.
//  Copyright © 2016 SZY. All rights reserved.
//

#import "NSString+Safe.h"

@implementation NSString (Safe)
+ (NSString *)safeString:(NSString *)src{
    return nil!=src ? src : @"";
}

+ (BOOL)isEmptyStr:(NSString *)str {
    return (str && str.length) ? NO : YES;
}

+ (NSString*)safeString:(NSString*)src defaultValue:(NSString*)defaultValue{
    if (!src) {
        return defaultValue?:@"";
    }
    return src;
}

+ (BOOL)isBlankString:(NSString *)string {
    BOOL result = NO;
    
    if (NULL == string || [string isEqual:nil] || [string isEqual:Nil])
    {
        result = YES;
    }
    else if ([string isEqual:[NSNull null]])
    {
        result = YES;
    }
    else if (0 == [string length] || 0 == [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length])
    {
        result = YES;
    }
    else if([string isEqualToString:@"(null)"])
    {
        result = YES;
    }
    
    return result;
}
@end
