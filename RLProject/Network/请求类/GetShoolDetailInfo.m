//
//  GetShoolDetailInfo.m
//  RLProject
//
//  Created by yzl on 16/10/10.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "GetShoolDetailInfo.h"
#import "ZTHSchoolDetailInfoResult.h"

@implementation GetShoolDetailInfo{
    NSString* _schoolId;
}
- (instancetype)initWithSchoolId:(NSString*)schoolId{
    self = [super init];
    if (self) {
        _schoolId = [NSString safeString:schoolId defaultValue:@""];
    }
    return self;
}
//需不需要 cookie
-(BOOL)needCookies{
    return YES;
}

- (NSInteger)requestCode{
    return 1061;
}

- (NSString*)requestUrl{
    return @"school/info";
}

- (nullable id)requestArgument{
    NSDictionary* argument = @{@"schoolid":_schoolId};
    return [self addCommonParams:[argument JSONString]];
}

- (NSString *)parseClassName
{
    return NSStringFromClass([SchoolDetailInfoResult class]);
}
@end
