//
//  NSDictionary+JSON.h
//  ZTJY
//
//  Created by 王超 on 16/5/23.
//  Copyright © 2016年 掌通家园. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

- (NSString*)jsonString;
+ (NSDictionary*)initWithJsonString:(NSString*)json;

@end
