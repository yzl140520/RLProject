//
// Created by 王超 on 16/6/17.
// Copyright (c) 2016 掌通家园. All rights reserved.
//

#import "NSObject+Common.h"
#import "NSString+Safe.h"

@implementation NSObject (Common)

+ (BOOL)empty:(NSObject *)o{
    if (o==nil) {
        return YES;
    }
    if (o==NULL) {
        return YES;
    }
    if (o==[NSNull new]) {
        return YES;
    }
    if ([o isKindOfClass:[NSString class]]) {
        return [NSString isBlankString:(NSString *)o];
    }
    if ([o isKindOfClass:[NSData class]]) {
        return [((NSData *)o) length]<=0;
    }
    if ([o isKindOfClass:[NSDictionary class]]) {
        return [((NSDictionary *)o) count]<=0;
    }
    if ([o isKindOfClass:[NSArray class]]) {
        return [((NSArray *)o) count]<=0;
    }
    if ([o isKindOfClass:[NSSet class]]) {
        return [((NSSet *)o) count]<=0;
    }
    return NO;
}

@end