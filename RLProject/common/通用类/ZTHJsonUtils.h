//
//  ZTHJsonUtils.h
//  ztjyyd
//
//  Created by ChaohuiChen on 8/26/16.
//  Copyright © 2016 szy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTHJsonUtils : NSObject
+ (NSString *)jsonString:(id)object;

+ (NSData *)jsonData:(id)object ;

+ (id)objectWithString:(NSString *)str;

+ (id)objectWithData:(NSData *)data ;
@end
