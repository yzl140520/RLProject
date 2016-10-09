//
//  RLDatabase.m
//  RLProject
//
//  Created by yzl on 16/10/9.
//  Copyright © 2016年 RLProject. All rights reserved.
//

#import "RLDatabase.h"
#import <FMDB.h>
@implementation RLDatabase{
    FMDatabase *_database;
    FMDatabaseQueue *_databaseQueue;
}
IM_SINGLETON(RLDatabase)
- (id)init
{
    self = [super init];
    if (self)
    {
        //初始化数据库
        [self openCurrentUserDB];
    }
    return self;
}

- (void)openCurrentUserDB
{
    if (_database)
    {
        [_database close];
        _database = nil;
    }
    _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:[RLDatabase dbFilePath]];
    _database = [FMDatabase databaseWithPath:[RLDatabase dbFilePath]];
    if (![_database open])
    {
        RLLog(@"打开数据库失败");
    }
    else
    {
        // 更新数据库 字段等
        
        // 检查是否需要 重新获取数据
        //        NSInteger dbVersion = 1;
        //        NSInteger lastDbVersion = 0;
        //        if(dbVersion > lastDbVersion){
        //            // 删除联系人数据 重新获取.
        //            [self clearTable:TABLE_OUTBOX];
        //
        //            // SET DB VERSION
        //        }
        
        // 创建表
        [_databaseQueue inDatabase:^(FMDatabase *db) {
            //建表。。。。
        }];
    }
}

+ (NSString *)dbFilePath
{
    return nil;
}

/**
 *  创建表
 *
 *  @param sql 创建表SQL
 *
 *  @return BOOL
 */
-(BOOL)createTable:(NSString *)sql
{
    [_database setShouldCacheStatements:YES];
    NSString *tempSql = [NSString stringWithFormat:@"%@",sql];
    return [_database executeUpdate:tempSql];
}

/**
 *  清空表数据
 *
 *  @param tableName 表名
 *
 *  @return BOOL
 */
-(BOOL)clearTable:(NSString *)tableName
{
    [_database setShouldCacheStatements:YES];
    NSString *tempSql = [NSString stringWithFormat:@"DELETE FROM %@",tableName];
    return [_database executeUpdate:tempSql];
}


@end
