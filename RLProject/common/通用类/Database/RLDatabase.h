//
//  RLDatabase.h
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLDatabase : NSObject
DEFINE_SINGLETON(RLDatabase)
- (void)openCurrentUserDB;

- (BOOL)insertTestId:(NSString*)testId content:(NSString*)content;

- (BOOL)executeSql:(NSString*)sql;
- (void)queryAll;
@end
