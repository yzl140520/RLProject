//
//  YTKBaseRequest+ZTRequest.m
//  ZTJY
//
//  Created by 王超 on 16/5/23.
//  Copyright © 2016年 掌通家园. All rights reserved.
//

#import "YTKBaseRequest+ZTRequest.h"

@implementation YTKBaseRequest (ZTRequest)
- (id)result
{
    if ([[self parseClassName] isEqualToString:@""]) {
        return nil;
    }
        
    return [NSClassFromString([self parseClassName]) mj_objectWithKeyValues:[self responseJSONObject]];
}
- (NSString *)parseClassName
{
    return @"";
}

- (NSError *)err
{
    return [[NSError alloc] initWithDomain:self.requestOperationError == nil ? @"解析错误" : BAD_NETWORK
                                      code:0
                                  userInfo:nil];
}


@end
