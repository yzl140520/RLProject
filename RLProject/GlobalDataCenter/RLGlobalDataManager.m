//
//  RLGlobalDataManager.m
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "RLGlobalDataManager.h"
@interface RLGlobalDataManager()
@property(nonatomic,assign) AFNetworkReachabilityStatus reachabilityStatus;

@end
@implementation RLGlobalDataManager
IM_SINGLETON(RLGlobalDataManager)

- (instancetype)init{
    self = [super init];
    if (self) {
        //创建网络监听管理者对象
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        /*
         typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
         AFNetworkReachabilityStatusUnknown          = -1,//未识别的网络
         AFNetworkReachabilityStatusNotReachable     = 0,//不可达的网络(未连接)
         AFNetworkReachabilityStatusReachableViaWWAN = 1,//2G,3G,4G...
         AFNetworkReachabilityStatusReachableViaWiFi = 2,//wifi网络
         };
         */
        //设置监听
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    RLLog(@"未识别的网络");
                    break;
                    
                case AFNetworkReachabilityStatusNotReachable:
                    RLLog(@"不可达的网络(未连接)");
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    RLLog(@"2G,3G,4G...的网络");
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    RLLog(@"wifi的网络");
                    break;
                default:
                    break;
            }
            _reachabilityStatus=status;
        }];
        //开始监听
        [manager startMonitoring];
    }
    return self;
}
@end
