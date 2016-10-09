//
//  NSDictionary+Accessors.m
//  Belle
//
//  Created by Allen Hsu on 1/11/14.
//  Copyright (c) 2014 Allen Hsu. All rights reserved.
//

#import "NSDictionary+Accessors.h"

@implementation NSDictionary (Accessors)

- (BOOL)isKindOfClass:(Class)aClass forKey:(NSString *)key
{
    id value = [self objectForKey:key];
    return [value isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass forKey:(NSString *)key
{
    id value = [self objectForKey:key];
    return [value isMemberOfClass:aClass];
}

- (BOOL)isArrayForKey:(NSString *)key
{
    return [self isKindOfClass:[NSArray class] forKey:key];
}

- (BOOL)isDictionaryForKey:(NSString *)key
{
    return [self isKindOfClass:[NSDictionary class] forKey:key];
}

- (BOOL)isStringForKey:(NSString *)key
{
    return [self isKindOfClass:[NSString class] forKey:key];
}

- (BOOL)isNumberForKey:(NSString *)key
{
    return [self isKindOfClass:[NSNumber class] forKey:key];
}

- (NSArray *)arrayForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
}

- (NSDictionary *)dictionaryForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

- (NSString *)stringForKey:(NSString *)key
{
    return [self stringForKey:key defaultValue:nil];
    
}

- (NSNumber *)numberForKey:(NSString *)key
{
    return [self numberForKey:key defaultValue:nil];
}

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }else if ( [value isKindOfClass:[NSNull class]]){
        return defaultValue;
    }else if ([value respondsToSelector:@selector(description)]) {
        return [value description];
    }
    return defaultValue;
}
- (NSNumber *)numberForKey:(NSString *)key defaultValue:(NSNumber *)defaultValue{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        return [nf numberFromString:value];
    }
    return defaultValue;
}

- (double)doubleForKey:(NSString *)key defaultValue:(double)defaultValue
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value doubleValue];
    }
    return 0;
}

- (float)floatForKey:(NSString *)key defaultValue:(float)defaultValue
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value floatValue];
    }
    return defaultValue;
}

- (int)intForKey:(NSString *)key defaultValue:(int)defaultValue
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value intValue];
    }
    return defaultValue;
}

- (unsigned int)unsignedIntForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntValue];
    }
    return 0;
}

- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return defaultValue;
}

- (NSUInteger)unsignedIntegerForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

- (long long)longLongForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
    return 0;
}

- (unsigned long long)unsignedLongLongForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
    return 0;
}

- (BOOL)boolForKey:(NSString *)key
{
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    return NO;
}

@end
