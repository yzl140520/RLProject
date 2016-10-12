//
//  RLRequest.m
//  RLProject
//
//  Created by yzl on 16/10/10.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "RLRequest.h"
@implementation RLRequest
/*!
 *  @author yzl
 *
 *  @brief 协议请求呈
 *
 */
- (NSInteger)requestCode{
    return -1;
}

/*!
 *  @author yzl
 *
 *  @brief 是否需要cookie
 *
 *  @return return value description
 */
- (BOOL)needCookies{
    return NO;
}

-(NSString*)reqCodeVersion{
    NSDictionary* dic = [[NSBundle mainBundle]infoDictionary];
    NSString* version = [dic objectForKey:@"CFBundleShortVersionString"];
    //截取版本号前两段
    NSArray* versionArray = [version componentsSeparatedByString:@"."];
    NSString* retVersion  = [NSString stringWithFormat:@"%@.%@",[versionArray objectAtIndex:0],[versionArray objectAtIndex:1]];
    return retVersion;
}


- (NSDictionary*)addCommonParams:(NSString*)requestArgument{
    NSMutableDictionary * params=[[NSMutableDictionary alloc]init];
    NSInteger reqCode=[self requestCode];
    [params setObject:@(reqCode) forKey:@"reqcode"];
    NSString* reqCodeVersion = [self reqCodeVersion];
    [params setObject:reqCodeVersion forKey:@"reqcodeversion"];
    [params setObject:requestArgument forKey:@"body"];
    
    return params;
}
- (NSString *)baseUrl
{
    return SERVER_ADDRESS;
}

/// 请求的连接超时时间，单位秒
- (NSTimeInterval)requestTimeoutInterval
{
    return 40;
}

/// 在HTTP报头添加的自定义参数
- (NSDictionary *)requestHeaderFieldValueDictionary
{
    NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    NSMutableDictionary *properties = [[NSMutableDictionary alloc] init];
    [properties setValue:@"iOS" forKey:@"User-Agent"];
    [properties setValue:[NSString stringWithFormat:@"application/x-www-form-urlencoded; charset=%@", charset] forKey:@"Content-Type"];
    NSString* sessionId = @"A9BF25E813A84D30917CD0E4C6086E58";//[JMAccountDataManager sharedManager].o_currentSessionID;
    if ([self needCookies] && sessionId) {
        NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        NSHTTPCookie * tmpCookie=[self makeCookieWithValue:sessionId];
        if (tmpCookie) {
            [cookieStorage setCookie: tmpCookie];
            NSArray *cookies = @[tmpCookie];
            NSDictionary* cookieDic = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
            [properties addEntriesFromDictionary:cookieDic];
        }

    }
    return properties;
}

//HTTP类型
- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPost;
}

/// 请求的SerializerType
- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeHTTP;
}


// 校验服务器返回
- (id)jsonValidator {
    return @{
             //@"returncode": [NSString class],
             @"message": [NSString class],
             //@"body" : [NSString class]
             };
}

/// 请求成功的回调
- (void)requestCompleteFilter
{
    
    NSDictionary *responseDic = self.responseJSONObject;
    
    //ZTLog(@"请求成功的回调%@", responseDic);
    
//    NSInteger returnCode = [[responseDic safeObjectForKey:@"returncode"] integerValue];
//    NSString *message = [responseDic stringValueForKey:@"message"];
//    
//    if (returnCode == ServerStateSuccess)//成功
//    {
//        
//        //处理弹窗
//        NSDictionary *body = [responseDic safeObjectForKey:@"body"];
//        NSInteger returnType = [body intValueForKey:@"returntype"];
//        
//        //积分广播
//        if (returnType != 0) {
//            if (![self isKindOfClass:[LogFirstStartupEveryDayApi class]]) {
//                [ZTNotification postNotification:ZTNotificationSoreTask userInfo:nil object:body];
//            }
//        }
//        //升级获得豆豆弹窗通知
//        NSDictionary *snsData = [body safeObjectForKey:@"returnSns"];
//        if (snsData != nil) {
//            [ZTNotification postNotification:ZTNotificationGainVirCoin userInfo:nil object:snsData];
//        }
//        
//    }
//    else if (returnCode == ServerStateAccountExpire || returnCode == ServerStateLoginFault)//帐号过期
//    {
//        [ZTNotification postNotification:ZTNotificationAccountExpire userInfo:nil object:message];
//    }
//    else if (returnCode == ServerStateAccountKickOut)//账号被踢
//    {
//        [ZTNotification postNotification:ZTNotificationUserKickouted userInfo:nil object:message];
//    }
//    else if (returnCode == ServerStateMoudleClosed)//模块关闭
//    {
//        [ZTNotification postNotification:ZTNotificationMoudleClosed userInfo:nil object:message];
//    }
//    else if (returnCode == ERRO_CODE_FAULT_EMERGENCEY)//紧急情况
//    {
//        [ZTNotification postNotification:ZTNotificationFaultEmergencey userInfo:nil object:message];
//    }
//    else if (returnCode == ServerStateLoginExpire)//登录过期
//    {
//        [ZTNotification postNotification:ZTNotificationAccountExpire userInfo:nil object:message];
//    }
//    else if (returnCode == ServerStateCurrentBabyUnvail)//被移出家庭组
//    {
//        [ZTNotification postNotification:ZTNotificationAccountRemoveGroup userInfo:nil object:message];
//    }
    
}

/// 请求失败的回调
- (void)requestFailedFilter{
    //ZTLog(@"请求失败的回调");
    
    //[self showHint:BAD_NETWORK];
}

/// 把block置nil来打破循环引用
- (void)clearCompletionBlock {
    //ZTLog(@"把block置nil来打破循环引用");
    
}


-(NSHTTPCookie *)makeCookieWithValue:(NSString *)value{
    NSDictionary *properties = [[NSMutableDictionary alloc] init];
    [properties setValue:value forKey:NSHTTPCookieValue];
    [properties setValue:@"JSESSIONID" forKey:NSHTTPCookieName];
    [properties setValue:[self baseUrl] forKey:NSHTTPCookieDomain];
    [properties setValue:[NSDate dateWithTimeIntervalSinceNow:60*60] forKey:NSHTTPCookieExpires];
    [properties setValue:@"/asi-http-request/ztjy" forKey:NSHTTPCookiePath];
    NSHTTPCookie *cookie = [[NSHTTPCookie alloc] initWithProperties:properties];
    return cookie;
}
@end
