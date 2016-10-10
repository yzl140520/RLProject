//
//  RLRequest.h
//  RLProject
//
//  Created by yzl on 16/10/10.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
@interface RLRequest : YTKRequest
/*!
 *  @author yzl
 *
 *  @brief 协议请求呈
 *
 */
- (NSInteger)requestCode;

/*!
 *  @author yzl
 *
 *  @brief 是否需要cookie
 *
 *  @return return value description
 */
- (BOOL)needCookies;

-(NSString*)reqCodeVersion;

- (NSDictionary*)addCommonParams:(NSString*)requestArgument;
@end
