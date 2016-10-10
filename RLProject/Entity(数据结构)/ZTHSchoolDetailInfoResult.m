//
//  ZTHSchoolDetailInfoResult.m
//  ztjyyd
//
//  Created by yzl on 16/10/10.
//  Copyright © 2016年 szy. All rights reserved.
//

#import "ZTHSchoolDetailInfoResult.h"

@implementation SchoolDetailInfoResult
@end


@implementation SchoolDetailInfoSummary

+ (NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{
             @"o_teacherType": @"teachertype",
             @"o_schoolDetailInfo": @"schoolinfo",
             @"o_moduleList": @"modellist",
             @"o_schoolType": @"schoolinfo.demotype",
             @"o_docVersion":@"docversion",
             @"o_industryName":@"industrytype",
             @"isregisterteacher":@"isregisterteacher",
             @"imProvider":@"improvider",
             };
}

+ (NSDictionary*)mj_objectClassInArray{
    return @{@"o_moduleList":[ModulInfo class]};
}
@end


@implementation SchoolDetailInfo

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"o_schoolId": @"schoolid",
             @"o_schoolName": @"schoolname",
             @"o_schoolLogo": @"schoollogo",
             @"o_schoolTelphone": @"schooltel",
             @"defaultpwd": @"defaultpwd",
             //             @"schoolType":@"schooltype",
             //             @"demoType":@"demotype",
             @"status":@"status",
             @"agentName":@"agentname",
             @"agentphone":@"agentphone",
             };
}

@end

@implementation ModulInfo

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"o_mId": @"mid",
             @"o_mName": @"mname",
             @"o_isExp":@"isexp",
             @"moudelState":@"mstate",
             };
}

@end
