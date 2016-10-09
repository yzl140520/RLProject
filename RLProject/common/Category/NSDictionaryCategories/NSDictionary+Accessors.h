//
//  NSDictionary+Accessors.h
//  Belle
//
//  Created by Allen Hsu on 1/11/14.
//  Copyright (c) 2014 Allen Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Accessors)

- (BOOL)isKindOfClass:(Class)aClass forKey:(NSString *)key;
- (BOOL)isMemberOfClass:(Class)aClass forKey:(NSString *)key;
- (BOOL)isArrayForKey:(NSString *)key;
- (BOOL)isDictionaryForKey:(NSString *)key;
- (BOOL)isStringForKey:(NSString *)key;
- (BOOL)isNumberForKey:(NSString *)key;

- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSNumber *)numberForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key defaultValue:(double)defaultValue;
- (float)floatForKey:(NSString *)key defaultValue:(float)defaultValue;
- (int)intForKey:(NSString *)key defaultValue:(int)defaultValue;
- (unsigned int)unsignedIntForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue;
- (NSUInteger)unsignedIntegerForKey:(NSString *)key;
- (long long)longLongForKey:(NSString *)key;
- (unsigned long long)unsignedLongLongForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;
- (NSNumber *)numberForKey:(NSString *)key defaultValue:(NSNumber *)defaultValue;
@end
