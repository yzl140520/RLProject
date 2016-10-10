//
//  YTKBaseRequest+ZTRequest.h
//  ZTJY
//
//  Created by 王超 on 16/5/23.
//  Copyright © 2016年 掌通家园. All rights reserved.
//

#import "YTKBaseRequest.h"
#import <YTKRequest.h>
@interface YTKBaseRequest (ZTRequest)

/**
 *  结构化返回结果
 *
 *  @return ZTResult
 */
- (id)result;

/**
 *  解析类名称
 *
 *  @return String
 */
- (NSString *)parseClassName;


/**
 *  错误消息
 *
 *  @return NSError
 */
- (NSError *)err;


@end
