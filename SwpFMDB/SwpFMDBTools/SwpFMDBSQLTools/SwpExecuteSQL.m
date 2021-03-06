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
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteCreateTableSQL:table:isCloseDB:   ( 执行创建表 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteCreateTableSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB {
    return [self.class swpExecuteCreateTableSQL:dataBase table:table fields:nil isCloseDB:isCloseDB];
}

/**
 *  @author swp_song
 *
 *  @brief  swpExecuteCreateTableSQL:table:fields:isCloseDB:    ( 执行创建表 SQL 语句, 可自定义字段 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @param  fields      fields      < 字段数组 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteCreateTableSQL:(FMDatabase *)dataBase table:(Class)table fields:(NSArray *)fields isCloseDB:(BOOL)isCloseDB {
    
    __block BOOL executionStatus = NO;
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        // 创建表
        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingCreateTableSQL:table fields:fields]];
    } isCloseDB:isCloseDB]) return NO;
    
    return executionStatus;
}

/**
 *  @author swp_song
 *
 *  @brief  swpExecuteUpdateFields:table:isCloseDB: ( 执行字段更新 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteUpdateFields:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB {
    __block BOOL executionStatus = NO;
    
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        
        NSArray *dbFields       = [SwpExecuteSQL swpExecuteSelectPropertysSQL:dataBase table:table isCloseDB:isCloseDB];
        NSArray *updateFields   = [SwpFMDBTools swpFMDBToolsGetPropertysNames:table];
        
        if ([dbFields isEqualToArray:updateFields]) return;
        
        //  增加字段
        NSArray *addFields  = [updateFields filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"NOT (SELF in %@)", dbFields]];
        executionStatus     = [self.class swpExecuteTableAddFields:dataBase table:table fields:addFields];
        if (executionStatus) return;
        
        //  减少字段
        executionStatus     = [self.class swpExecuteTableDropFields:dataBase table:table dbFields:dbFields updateFields:updateFields];
        
    } isCloseDB:isCloseDB]) return NO;
    
    return executionStatus;
}

#pragma mark - SwpExecuteSQL Execute Insert SQL Methods
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteInsertModelSQL:model:isCloseDB:   ( 执行插入数据 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  model       model       < 数据源 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteInsertModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB {
    
    
    __block BOOL executionStatus = NO;
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        
        // 有数据, 修改数据
        if ([self.class swpExecuteSelectModelSQL:dataBase table:[model class] bySwpDBID:[model valueForKey:@"swpDBID"] isCloseDB:NO]) {
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
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteUpdateModelSQL:model:isCloseDB:  ( 执行更新数据 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  model       model       < 数据源 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteUpdateModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB {
    
    __block BOOL executionStatus = NO;
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        
//        if (![SwpExecuteSQL swpExecuteVerifyThatTheTableExistsSQL:dataBase table:[model class]]) {
//            executionStatus = NO;
//            return;
//        }
//        
        // 判断 是否 数据是否存在
        if (![self.class swpExecuteSelectModelSQL:dataBase table:[model class] bySwpDBID:[model valueForKey:@"swpDBID"] isCloseDB:NO]) {
            executionStatus = NO;
            return;
        }
        
        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingUpdateSQLConditionSwpDBID:model]];
    } isCloseDB:isCloseDB]) return NO;
    
    return executionStatus;
}


#pragma mark - SwpExecuteSQL Execute Select SQL Methods
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteSelectModelSQL:table:bySwpDBID:isCloseDB:    ( 执行查询 SQL 语句，根据主键 swpDBDI 查询单条数据 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  modelClass  modelClass  < 表名称 >
 *
 *  @param  swpDBID     swpDBID     < 主键 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return id
 */
+ (id)swpExecuteSelectModelSQL:(FMDatabase *)dataBase table:(Class)modelClass bySwpDBID:(NSString *)swpDBID isCloseDB:(BOOL)isCloseDB {
    
    __block id model = [[modelClass class] new];
    
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        
        FMResultSet *resultSet = [dataBase executeQuery:[SwpStitchingSQL swpStitchingSelectModelSQL:modelClass swpDBID:swpDBID]];
        model = [self.class swpExecuteGetQueryDataPackagingModel:resultSet table:modelClass];
    } isCloseDB:isCloseDB]) return nil;
    
    return model;
}

/**
 *  @author swp_song
 *
 *  @brief  swpExecuteSelectModelsSQL:table:isCloseDB:  ( 执行查询全部数据 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  modelClass  modelClass  < 表名称 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return NSArray
 */
+ (NSArray *)swpExecuteSelectModelsSQL:(FMDatabase *)dataBase table:(Class)modelClass isCloseDB:(BOOL)isCloseDB {

    __block NSArray *models = [NSArray array];
    
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        FMResultSet *resultSet = [dataBase executeQuery:[SwpStitchingSQL swpStitchingSelectModelsSQL:modelClass]];
        models = [self.class swpExecuteGetQueryDataPackagingModels:resultSet table:modelClass];
        
    } isCloseDB:isCloseDB]) return models;

    return models;
}


/**
 *  @author swp_song
 *
 *  @brief  swpExecuteSelectPropertySQL:table:isCloseDB:    ( 执行查询表中全部字段 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return NSArray
 */
+ (NSArray *)swpExecuteSelectPropertysSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB {
    
    __block NSArray *models = [NSArray array];
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        FMResultSet *resultSet = [dataBase executeQuery:[SwpStitchingSQL swpStitchingSelectPropertysSQL:table]];
        models = [self.class swpExecuteGetQueryPropertys:resultSet];
    } isCloseDB:isCloseDB]) return models;
    
    return models;
}


#pragma mark - SwpExecuteSQL Execute Delete Data SQL Methods
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteDeleteModelSQL:model:isCloseDB:   ( 执行删除单条数据 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  model       model       < 数据源 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteDeleteModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB {
    
    __block BOOL executionStatus = NO;
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        
        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingDeleteModelSQL:[model class] swpDBID:[model valueForKey:@"swpDBID"]]];
        
    } isCloseDB:isCloseDB]) return executionStatus;

    return executionStatus;
}

/**
 *  @author swp_song
 *
 *  @brief  swpExecuteDeleteModelsSQL:table:models:isCloseDB:   ( 执行删除一组数据 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @param  models      models      < 数据源 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteDeleteModelsSQL:(FMDatabase *)dataBase table:(Class)table models:(NSArray *)models isCloseDB:(BOOL)isCloseDB {
    
    __block BOOL executionStatus = NO;
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingDeleteModelsSQL:table models:models]];
    } isCloseDB:isCloseDB]) return executionStatus;
    return executionStatus;
}


/**
 *  @author swp_song
 *
 *  @brief  swpExecuteClearModelSQL:table:isCloseDB:    ( 执行清空表内所有数据, SQL )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteClearModelSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB {
    
    __block BOOL executionStatus = NO;
    
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingClearModelsSQL:table]];
    } isCloseDB:isCloseDB]) return executionStatus;
    
    return executionStatus;
}

#pragma mark - SwpExecuteSQL Execute Delete Table SQL Methods
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteDeleteTaleSQL:table:isCloseDB:    ( 执行删除表, SQL )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteDeleteTaleSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB {
    
    __block BOOL executionStatus = NO;
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
        executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingDeleteTaleSQL:table]];
    } isCloseDB:isCloseDB]) return executionStatus;
    
    return executionStatus;
}

#pragma mark - SwpFMDB Execute Verify Table SQL Methods
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteVerifyThatTheTableExistsSQL:table:    ( 执行验证表是否存在 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteVerifyThatTheTableExistsSQL:(FMDatabase *)dataBase table:(Class)table {
    return [dataBase tableExists:NSStringFromClass(table)];
}

/**
 *  @author swp_song
 *
 *  @brief  swpExecuteVerifyThatTheTableExistsSQL:table:isCloseDB: ( 执行验证表是否存在 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteVerifyThatTheTableExistsSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB {
    
    
    __block BOOL executionStatus = NO;
    
    if (![self.class swpExecuteDBOperation:dataBase dbOpenBlock:^{
    
        FMResultSet *resultSet = [dataBase executeQuery:[SwpStitchingSQL swpStitchingVerifyThatTheTableExistsSQL:table]];

        
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
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteDBOperation:dbOpenBlock:isCloseDB:   ( 数据库 操作 打开 - 关闭 数据库 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  dbOpenBlock dbOpenBlock < 数据打开成功回调 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 */
+ (BOOL)swpExecuteDBOperation:(FMDatabase *)dataBase dbOpenBlock:(void(^)(void))dbOpenBlock isCloseDB:(BOOL)isCloseDB {
    
    if (![self.class swpExecuteOpenDB:dataBase]) {
        NSLog(@"数据库未打开");
        return NO;
    }
    
    if (dbOpenBlock) dbOpenBlock();

    if (isCloseDB) [dataBase close];
    
    return YES;
}


/**
 *  @author swp_song
 *
 *  @brief  swpExecuteOpenDB:   ( 打开数据库 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteOpenDB:(FMDatabase *)dataBase {
    return [dataBase open];
}


/**
 *  @author swp_song
 *
 *  @brief  swpExecuteOpenDB:   ( 关闭数据库 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 */
+ (void)swpExecuteCloseDB:(FMDatabase *)dataBase {
    [dataBase close];
}

/**
 *  @author swp_song
 *
 *  @brief  swpExecuteCloseDB:isCloseDB:    ( 关闭数据库 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 */
+ (void)swpExecuteCloseDB:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB {
    if (isCloseDB) [self.class swpExecuteCloseDB:dataBase];
}


#pragma makr -
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteGetQueryDataPackagingModel:table: ( 查询单条数据，包装数据 )
 *
 *  @param  resultSet   resultSet   < 结果集 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @return id
 */
+ (id)swpExecuteGetQueryDataPackagingModel:(FMResultSet *)resultSet table:(Class)table {
    
    __block id model       = [table new];
    
    BOOL queryDataSuccess  = NO;
    
    while ([resultSet next]) {
        
        queryDataSuccess = YES;
        
        [[SwpFMDBTools swpFMDBToolsGetAllPropertysNames:table] enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            //  取出数据, 包装数据, 放入模型
            [model setValue:[SwpFMDBTools swpFMDBToolsPackingData:[resultSet objectForColumn:key]] forKey:key];
        }];
    }

    return queryDataSuccess ? model : nil;;
}


/**
 *  @author swp_song
 *
 *  @brief  swpExecuteGetQueryDataPackagingModels:table:    ( 查询多条数据，包装数据 )
 *
 *  @param  resultSet   resultSet   < 结果集 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @return NSArray
 */
+ (NSArray *)swpExecuteGetQueryDataPackagingModels:(FMResultSet *)resultSet table:(Class)table {

    NSMutableArray *models = @[].mutableCopy;
    
    while ([resultSet next]) {
        
        id model = [table new];
        [[SwpFMDBTools swpFMDBToolsGetAllPropertysNames:table] enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            //  取出数据, 包装数据, 放入模型
            [model setValue:[SwpFMDBTools swpFMDBToolsPackingData:[resultSet objectForColumn:key]] forKey:key];
        }];
        
        [models addObject:model];
    }
    return models;
}



/**
 *  @author swp_song
 *
 *  @brief  swpExecuteGetQueryPropertys:    ( 查询数据库表中所有字段，包装数据 )
 *
 *  @param  resultSet   resultSet
 *
 *  @return NSArray
 */
+ (NSArray *)swpExecuteGetQueryPropertys:(FMResultSet *)resultSet {
    
    NSMutableArray *propertys = @[].mutableCopy;
    while ([resultSet next]) {
        NSString *field = [resultSet objectForColumn:@"name"];
        if ([field.uppercaseString isEqualToString:@"ID"]) continue;
        [propertys addObject:field];
    }
    return propertys.copy;
}


/**
 *  @author swp_song
 *
 *  @brief  swpExecuteTableAddFields:table:fields:  ( 表中添加新字段 )
 *
 *  @param dataBase dataBase
 *
 *  @param table    table
 *
 *  @param fields   fields
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteTableAddFields:(FMDatabase *)dataBase table:(Class)table fields:(NSArray<NSString *> *)fields  {
    __block BOOL executionStatus = NO;
    [fields enumerateObjectsUsingBlock:^(NSString * _Nonnull field, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![dataBase columnExists:field inTableWithName:NSStringFromClass(table)]) {
            executionStatus = [dataBase executeUpdate:[NSString stringWithFormat:@"ALTER TABLE %@ ADD COLUMN %@ DEFAULT '' ", NSStringFromClass(table), field]];
        }
    }];
    return executionStatus;
}



/**
 *  @author swp_song
 *
 *  @brief  swpExecuteTableDropFields:table:dbFields:updateFields:  ( 表中去除字段 )
 *
 *  @param  dataBase        dataBase
 *
 *  @param  table           table
 *
 *  @param  dbFields        dbFields
 *
 *  @param  updateFields    updateFields
 *
 *  @return BOOL
 */
+ (BOOL)swpExecuteTableDropFields:(FMDatabase *)dataBase table:(Class)table dbFields:(NSArray<NSString *> *)dbFields updateFields:(NSArray<NSString *> *)updateFields {
    
    BOOL executionStatus        = NO;
    
    //  创建临时表名
    NSString *temporaryTable    = [NSString stringWithFormat:@"%@Temporary", NSStringFromClass(table)];
    
    //  取出相同字段名
    NSArray  *sameFields        = [dbFields filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF in %@", updateFields]];
    
    //  创建临时表
    executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingCreateTemporaryTableSQL:table fields:updateFields]];
    
    //  未修改字段的表中数据迁移到, 临时表中
    executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingDataMigrationSQL:NSStringFromClass(table) toMigrationTable:temporaryTable fields:sameFields]];
    
    //  删除未修改字段的表
    executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingDeleteTaleSQL:table]];
    
    //  创建更新字段表
    executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingCreateTableSQL:table]];
    
    //  临时表中数据迁移到, 更新字段表中
    executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingDataMigrationSQL:temporaryTable toMigrationTable:NSStringFromClass(table)  fields:sameFields]];
    
    //  删除临时表
    executionStatus = [dataBase executeUpdate:[SwpStitchingSQL swpStitchingDeleteTaleSQLString:temporaryTable]];
    
    return executionStatus;
}







@end
