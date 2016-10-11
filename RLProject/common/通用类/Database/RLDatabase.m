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
            if (![_database tableExists:TABLE_TEST]) {
                [self createTable:SQL_CREATE_Test];
            }
        }];
    }
}

+ (NSString *)dbFilePath
{
    NSString *myName = @"common" ;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    
    NSString *directorPath = [documentDirectory stringByAppendingPathComponent:myName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:directorPath])
    {
        [fileManager createDirectoryAtPath:directorPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    }
    
    //检查用户的DB是否存在, 若不存在则创建相应的DB目录
    BOOL isDirector = NO;
    BOOL isExisting = [fileManager fileExistsAtPath:directorPath isDirectory:&isDirector];
    
    if (!(isExisting && isDirector))
    {
        BOOL creatDirection = [fileManager createDirectoryAtPath:directorPath
                                     withIntermediateDirectories:YES
                                                      attributes:nil
                                                           error:nil];
        if (!creatDirection)
        {
          RLLog(@"创建DB目录失败");
        }
    }
    
    NSString *dbPath = [directorPath stringByAppendingPathComponent: @"YZL.sqlite"];
    return dbPath;
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

- (BOOL)executeSql:(NSString*)sql{
    [_database setShouldCacheStatements:YES];
    NSString *tempSql = [NSString stringWithFormat:@"%@",sql];
    return [_database executeUpdate:tempSql];
}

- (BOOL)insertTestId:(NSString*)testId content:(NSString*)content{
    @autoreleasepool {

        __block BOOL flag = NO;
        [_databaseQueue inDatabase:^(FMDatabase *db) {
            [_database beginTransaction];
            __block BOOL isRollBack = NO;
            @try {
                
                //写入数据
                NSString* sql = [NSString stringWithFormat:@"insert INTO %@ (test_id, content, new_column) VALUES(?,?,?)", TABLE_TEST];
                
                BOOL result = [_database executeUpdate:sql, testId, content, content];
                
                if (!result)
                {
                    isRollBack = YES;
                }

            }
            @catch (NSException *exception) {
                [_database rollback];
                RLLog(@"db: %@ 插入数据失败", TABLE_TEST);
            }
            @finally {
                if (isRollBack)
                {
                    [_database rollback];
                    flag = NO;
                    RLLog(@"DB: %@ 写入数据失败", TABLE_TEST);
                }
                else
                {
                    [_database commit];
                    flag = YES;
                }
            }
        }];
        return flag;
    }

}

- (void)queryAll{
    @autoreleasepool {
        if ([_database tableExists:TABLE_TEST]) {
            [_database setShouldCacheStatements:YES];
            NSString *sqlStr = [NSString stringWithFormat:@"select * from %@", TABLE_TEST];
            FMResultSet *result = [_database executeQuery:sqlStr];
            while ([result next]) {
                NSString *contentStr = [result stringForColumn:@"content"];
                NSString* testid = [result stringForColumn:@"test_id"];
                NSString* newColumn = [result stringForColumn:@"new_column"];
                RLLog(@"%@,%@,%@",testid,contentStr,newColumn);
            }
            [result close];
        }
    }
}
@end
