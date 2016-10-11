//
//  DataBaseDefine.h
//  RLProject
//
//  Created by yzl on 16/10/11.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#ifndef DataBaseDefine_h
#define DataBaseDefine_h


#pragma mark - TABLE NAME
#define TABLE_TEST  @"TABLE_TEST"

#pragma mark - operate

#define SQL_CREATE_Test         [NSString stringWithFormat:@"CREATE TABLE  IF NOT EXISTS %@ (test_id text, content text, UNIQUE(test_id))", TABLE_TEST]

#endif /* DataBaseDefine_h */
