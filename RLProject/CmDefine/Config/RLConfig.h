//
//  RLConfig.h
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#ifndef RLConfig_h
#define RLConfig_h

#if DEBUG
#define RLLog(xx, ...)                  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define RLLog(xx, ...)                  nil
#endif

#endif /* RLConfig_h */
