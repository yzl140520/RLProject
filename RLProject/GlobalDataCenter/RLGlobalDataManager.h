//
//  RLGlobalDataManager.h
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface RLGlobalDataManager : NSObject
DEFINE_SINGLETON(RLGlobalDataManager)

/*!
 *  @author yzl
 *
 *  @brief 监听网络状态
 */
@property (nonatomic,readonly) AFNetworkReachabilityStatus reachabilityStatus;

@end
