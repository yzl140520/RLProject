//
//  NSDictionary+JSON.m
//  ZTJY
//
//  Created by 王超 on 16/5/23.
//  Copyright © 2016年 掌通家园. All rights reserved.
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)
- (NSString*)jsonString
{
    NSData* infoJsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString* json = [[NSString alloc] initWithData:infoJsonData encoding:NSUTF8StringEncoding];
    return json;
}

+ (NSDictionary*)initWithJsonString:(NSString*)json
{
    if(!json) return nil;
    NSData* infoData = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* info = [NSJSONSerialization JSONObjectWithData:infoData options:0 error:nil];
    return info;
}
@end
