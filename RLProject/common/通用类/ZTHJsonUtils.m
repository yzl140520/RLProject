//
//  ZTHJsonUtils.m
//  ztjyyd
//
//  Created by ChaohuiChen on 8/26/16.
//  Copyright © 2016 szy. All rights reserved.
//

#import "ZTHJsonUtils.h"

@implementation ZTHJsonUtils
+ (NSString *)jsonString:(id)object {
    NSData *data = [ZTHJsonUtils jsonData:object];
    
    if (data && data.length) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }else{
        return nil;
    }
}

+ (NSData *)jsonData:(id)object {
    if (object==nil) {
        return nil;
    }
    
    NSError *error;
    // Pass 0 if you don't care about the readability of the generated string
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    return jsonData;
}

+ (id)objectWithString:(NSString *)str {
    if (str == nil || str.length==0) {
        return nil;
    }
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [ZTHJsonUtils objectWithData:data];
}

+ (id)objectWithData:(NSData *)data {
    if (data==nil || data.length==0) {
        return nil;
    }
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        return nil;
    }
}
@end
