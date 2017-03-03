//
//  SwpExecuteSQL.m
//  swp_song
//
//  Created by swp_song on 2017/2/11.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpExecuteSQL.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "FMDB.h"                        //  FMDB
#import "SwpFMDBTools.h"                //  Tools
#import "SwpStitchingSQL.h"             //  SQL Tools
/*! ---------------------- Tool       ---------------------- !*/

@implementation SwpExecuteSQL

#pragma mark - SwpExecuteSQL Execute Create Table SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteCreateTableSQL:table:isCloseDB:  ( 执行 创表 SQL 语句 )
 *
 *  @ param  dataBase           数据库
 *
 *  @ param  modelClass         数据模型
 *
 *  @ param  isCloseDB          是否关闭数据库
 *
 *  @ return BOOL
 */
+ (BOOL)swpExecuteCreateTableSQL:(FMDatabase *)dataBase table:(Class)modelClass isCloseDB:(BOOL)isCloseDB {
    __block BOOL executionStatus = NO;
    if (![[self class] swpExecuteDBOperation:dataBase dbOpenBlock:^{
        // 创建表
        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingCreateTableSQL:modelClass]];
    } isCloseDB:isCloseDB]) return NO;
    
    return executionStatus;
    
}

#pragma mark - SwpExecuteSQL Execute Insert SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteInsertModelSQL:model:isCloseDB:  ( 执行 插入数据 SQL 语句 )
 *
 *  @ param  dataBase
 *
 *  @ param  model
 *
 *  @ param  isCloseDB
 *
 *  @ return BOOL
 */
+ (BOOL)swpExecuteInsertModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB {
    
    
    __block BOOL executionStatus = NO;
    if (![[self class] swpExecuteDBOperation:dataBase dbOpenBlock:^{
        
        // 有数据, 修改数据
        if ([[self class] swpExecuteSelectModelSQL:dataBase table:[model class] bySwpDBID:[model valueForKey:@"swpDBID"] isCloseDB:NO]) {
            executionStatus = [[self class] swpExecuteUpdateModelSQL:dataBase model:model isCloseDB:isCloseDB];
            return;
        }
        
        
        // 没数据, 插入数据
        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingInsertSQL:model]];
        
        // 数据未设置 swpDBID
        if (![model valueForKey:@"swpDBID"]) {
            NSString *primaryKey = [NSString stringWithFormat:@"%i", [NSNumber numberWithLongLong:dataBase.lastInsertRowId].intValue];
            [model setValue:primaryKey forKey:@"swpDBID"];
            executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingUpdateSQL:model conditionKey:@"ID" conditionValue:primaryKey]];
        }
        
    } isCloseDB:isCloseDB]) return NO;
    
    return executionStatus;
}

#pragma mark - SwpExecuteSQL Execute Update SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteUpdateModelSQL:model:isCloseDB:  ( 执行 更新数据 SQL 语句 )
 *
 *  @ param  dataBase
 *
 *  @ param  model
 *
 *  @ param  isCloseDB
 *
 *  @ return BOOL
 */
+ (BOOL)swpExecuteUpdateModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB {
    
    __block BOOL executionStatus = NO;
    if (![[self class] swpExecuteDBOperation:dataBase dbOpenBlock:^{
        
//        if (![SwpExecuteSQL swpExecuteVerifyThatTheTableExistsSQL:dataBase table:[model class]]) {
//            executionStatus = NO;
//            return;
//        }
//        
        // 判断 是否 数据是否存在
        if (![[self class] swpExecuteSelectModelSQL:dataBase table:[model class] bySwpDBID:[model valueForKey:@"swpDBID"] isCloseDB:NO]) {
            executionStatus = NO;
            return;
        }
        
        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingUpdateSQLConditionSwpDBID:model]];
    } isCloseDB:isCloseDB]) return NO;
    
    return executionStatus;
}


#pragma mark - SwpExecuteSQL Execute Select SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteSelectModelSQL:table:bySwpDBID:isCloseDB:    ( 执行 根据 主键 swpDBDI 查询单条数据 SQL 语句 )
 
 *  @ param  dataBase
 *
 *  @ param  modelClass
 *
 *  @ param  swpDBID
 *
 *  @ param  isCloseDB
 *
 *  @ return id
 */
+ (id)swpExecuteSelectModelSQL:(FMDatabase *)dataBase table:(Class)modelClass bySwpDBID:(NSString *)swpDBID isCloseDB:(BOOL)isCloseDB {
    
    __block id model = [[modelClass class] new];
    
    if (![[self class] swpExecuteDBOperation:dataBase dbOpenBlock:^{
        
        FMResultSet *resultSet = [dataBase executeQuery:[SwpStitchingSQL swpStitchingSelectModelSQL:modelClass swpDBID:swpDBID]];
        
        model = [[self class] swpExecuteGetQueryDataPackagingModel:resultSet table:modelClass];
    } isCloseDB:isCloseDB]) return nil;
    
    return model;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteSelectModelsSQL:table:isCloseDB: ( 执行 查询 全部 数据 SQL )
 
 *  @ param  dataBase
 *
 *  @ param  modelClass
 *
 *  @ param  isCloseDB
 *
 *  @ return NSArray
 */
+ (NSArray *)swpExecuteSelectModelsSQL:(FMDatabase *)dataBase table:(Class)modelClass isCloseDB:(BOOL)isCloseDB {

    __block NSArray *models = [NSArray array];
    
    if (![[self class] swpExecuteDBOperation:dataBase dbOpenBlock:^{
        FMResultSet *resultSet = [dataBase executeQuery:[SwpStitchingSQL swpStitchingSelectModelsSQL:modelClass]];
        models                 = [[self class] swpExecuteGetQueryDataPackagingModels:resultSet table:modelClass];
        
    } isCloseDB:isCloseDB]) return models;

    return models;
}

#pragma mark - SwpExecuteSQL Execute Delete SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteDeleteModelSQL:model:isCloseDB: ( 执行 删除 单条  数据 SQL )
 *
 *  @ param  dataBase
 *
 *  @ param  model
 *
 *  @ param  isCloseDB
 *
 *  @ return BOOL
 */
+ (BOOL)swpExecuteDeleteModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB {
    
    __block BOOL executionStatus = NO;
    if (![[self class] swpExecuteDBOperation:dataBase dbOpenBlock:^{

        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingDeleteModelsSQL:[model class] swpDBID:[model valueForKey:@"swpDBID"]]];
        
    } isCloseDB:isCloseDB]) return executionStatus;

    return executionStatus;
}

#pragma mark - SwpFMDB Execute Verify Table SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteVerifyThatTheTableExistsSQL:table:   ( 执行 验证 表是否 存在 SQL )
 *
 *  @ param  dataBase           数据库
 *
 *  @ param  modelClass         数据模型
 *
 *  @ return BOOL
 */
+ (BOOL)swpExecuteVerifyThatTheTableExistsSQL:(FMDatabase *)dataBase table:(Class)modelClass {
    return [dataBase tableExists:NSStringFromClass(modelClass)];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteVerifyThatTheTableExistsSQL:table:isCloseDB: ( 执行 验证 表是否 存在 SQL )
 *
 *  @ param dataBase
 *
 *  @ param modelClass
 *
 *  @ param isCloseDB
 *
 *  @ return BOOL
 */
+ (BOOL)swpExecuteVerifyThatTheTableExistsSQL:(FMDatabase *)dataBase table:(Class)modelClass isCloseDB:(BOOL)isCloseDB {
    
    
    __block BOOL executionStatus = NO;
    
    if (![[self class] swpExecuteDBOperation:dataBase dbOpenBlock:^{
    
        FMResultSet *resultSet = [dataBase executeQuery:[SwpStitchingSQL swpStitchingVerifyThatTheTableExistsSQL:modelClass]];

        
        while ([resultSet next]) {
            // 表不存在
            if (![resultSet intForColumn:@"count"]) {
                executionStatus = NO;
                return;
            }
            executionStatus = YES;
        }
        
    } isCloseDB:isCloseDB]) return NO;
    
    return executionStatus;
    
}

#pragma mark - SwpExecuteSQL Execute Operation Methods - Private
/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteDBOperation:dbOpenBlock:isCloseDB:   ( 数据库 操作 打开 - 关闭 数据库 )
 *
 *  @ param  dataBase
 *
 *  @ param  dbOpenBlock
 *
 *  @ param  isCloseDB
 */
+ (BOOL)swpExecuteDBOperation:(FMDatabase *)dataBase dbOpenBlock:(void(^)())dbOpenBlock isCloseDB:(BOOL)isCloseDB {
    
    if (![[self class] swpExecuteOpenDB:dataBase]) {
        NSLog(@"数据库未打开");
        return NO;
    }
    
    if (dbOpenBlock) dbOpenBlock();

    if (isCloseDB) [dataBase close];
    
    return YES;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteOpenDB:  ( 数据库 操作 打开 数据库 )
 *
 *  @ param  dataBase
 *
 *  @ return BOOL
 */
+ (BOOL)swpExecuteOpenDB:(FMDatabase *)dataBase {
    return [dataBase open];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteOpenDB:  ( 数据库 操作 关闭 数据库 )
 *
 *  @ param  dataBase
 */
+ (void)swpExecuteCloseDB:(FMDatabase *)dataBase {
    [dataBase close];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteCloseDB:isCloseDB:   ( 数据库 操作 关闭 数据库 )
 *
 *  @ param  dataBase
 *
 *  @ param  isCloseDB
 */
+ (void)swpExecuteCloseDB:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB {
    if (isCloseDB) [[self class] swpExecuteCloseDB:dataBase];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteGetQueryDataPackagingModel:table:    ( 取出 查询 数据封装成模型 )
 *
 *  @ param  resultSet
 *
 *  @ param  modelClass
 *
 *  @ return id
 */
+ (id)swpExecuteGetQueryDataPackagingModel:(FMResultSet *)resultSet table:(Class)modelClass {
    
    __block id model       = [modelClass new];
    
    BOOL queryDataSuccess  = NO;
    
    while ([resultSet next]) {
        
        queryDataSuccess = YES;
        
        [[SwpFMDBTools swpFMDBToolsGetAllPropertysNames:modelClass] enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            //  取出数据, 包装数据, 放入模型
            [model setValue:[SwpFMDBTools swpFMDBToolsPackingData:[resultSet objectForColumnName:key]] forKey:key];
        }];
    }

    return queryDataSuccess ? model : nil;;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpExecuteGetQueryDataPackagingModels:table:   ( 取出 查询 数据封装成模型 )
 *
 *  @ param resultSet
 *
 *  @ param modelClass
 *
 *  @ return id
 */
+ (NSArray *)swpExecuteGetQueryDataPackagingModels:(FMResultSet *)resultSet table:(Class)modelClass {

    NSMutableArray *models = [NSMutableArray array];
    
    while ([resultSet next]) {
        
        id model = [[modelClass class] new];
        [[SwpFMDBTools swpFMDBToolsGetAllPropertysNames:modelClass] enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            //  取出数据, 包装数据, 放入模型
            [model setValue:[SwpFMDBTools swpFMDBToolsPackingData:[resultSet objectForColumnName:key]] forKey:key];
        }];
        
        [models addObject:model];
    }
    return models;
}






@end
