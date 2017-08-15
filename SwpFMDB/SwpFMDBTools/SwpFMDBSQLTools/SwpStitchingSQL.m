//
//  SwpStitchingSQL.m
//  swp_song
//
//  Created by swp_song on 2017/2/11.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpStitchingSQL.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpFMDBTools.h"               // Tools
/*! ---------------------- Tool       ---------------------- !*/

@implementation SwpStitchingSQL

#pragma mark - Swp Stitching Verify Table SQL Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingVerifyThatTheTableExistsSQL:    ( 验证表是否存 SQL )
 *
 *  @param  table   table    < 表名称 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingVerifyThatTheTableExistsSQL:(Class)table {
    return [NSString stringWithFormat:@"select count(*) as 'count' from sqlite_master where type ='table' and name = '%@'", NSStringFromClass(table)];
}

#pragma mark - Swp Stitching Create Table SQL Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingCreateTableSQL: ( 拼接创建表 SQL 语句 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingCreateTableSQL:(Class)table {
    
    NSMutableString *createTableSQL = [NSMutableString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT ,", NSStringFromClass(table)];
    
    NSArray<NSString *> *properties = [SwpFMDBTools swpFMDBToolsGetAllPropertysNames:table];
    
    [properties enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [createTableSQL appendFormat:@"%@,", key];
    }];
    
    [createTableSQL deleteCharactersInRange:NSMakeRange(createTableSQL.length - 1, 1)];
    [createTableSQL appendString:@")"];
    
    return createTableSQL.copy;
}

#pragma mark - Swp Stitching Inster SQL Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingInsertSQL:  ( 拼接插入数据 SQL 语句 )
 *
 *  @param  model   model   < 数据源 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingInsertSQL:(id)model {
    
    NSArray<NSString *> *propertys = [SwpFMDBTools swpFMDBToolsGetAllPropertysNames:[model class]];
    NSMutableString *insterSQL     = [NSMutableString stringWithFormat:@"INSERT OR REPLACE INTO %@ (", [model class]];
    NSMutableString *insterValue   = [NSMutableString string];
    
    [propertys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        
        id value = [model valueForKey:key];
        
        if (value == nil) value = @"";
        
        if ([SwpFMDBTools swpFMDBToolsVerifySystemCollectionType:value]) {
            value = [SwpFMDBTools swpFMDBToolsSetConversionJSONSting:value];
        }
        
        value = value ? [NSString stringWithFormat:@"'%@'", value] : value;
        
        // 拼接 插入 数据 value
        [insterValue appendString:idx == propertys.count - 1 ? [NSString stringWithFormat:@"%@", value] : [NSString stringWithFormat:@"%@,", value]];
        [insterSQL appendFormat:@"%@,", key];
    }];
    
    [insterSQL deleteCharactersInRange:NSMakeRange(insterSQL.length - 1, 1)];
    [insterSQL appendFormat:@") VALUES (%@);", insterValue];
    
    return insterSQL;
}

#pragma mark - Swp Stitching Update SQL Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingUpdateSQLConditionSwpDBID:  ( 拼接修改数据 SQL 语句，根据 swpDBID 修改数据 )
 *
 *  @param  model   model   < 数据源 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingUpdateSQLConditionSwpDBID:(id)model {
    return [self.class swpStitchingUpdateSQL:model conditionKey:@"swpDBID" conditionValue:[model valueForKey:@"swpDBID"]];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingUpdateSQL:conditionKey:conditionValue:  ( 拼接修改数据 SQL 语句，根据 SQL 条件修改 )
 *
 *  @param  model   model   < 数据源 >
 *
 *  @param  key     key     < 条件 key >
 *
 *  @param  value   value   < 条件 value >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingUpdateSQL:(id)model conditionKey:(NSString *)key conditionValue:(NSString *)value {
    
    NSArray<NSString *> *propertys = [SwpFMDBTools swpFMDBToolsGetAllPropertysNames:[model class]];
    NSMutableString     *updateSQL = [NSMutableString stringWithFormat:@"UPDATE %@ SET ", [model class]];
    [propertys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        id value = [model valueForKey:key];
        
        if (value == nil) value = @"";
        
        if ([SwpFMDBTools swpFMDBToolsVerifySystemCollectionType:value]) {
            value = [SwpFMDBTools swpFMDBToolsSetConversionJSONSting:value];
        }
        
        value = value ? [NSString stringWithFormat:@"'%@'", value] : value;
        
        [updateSQL appendString:idx == propertys.count - 1 ? [NSString stringWithFormat:@"%@ = %@", key, value] : [NSString stringWithFormat:@"%@ = %@, ", key, value]];
    }];
    [updateSQL appendFormat:@" WHERE %@ = '%@';", key, value];
    return updateSQL.copy;
}

#pragma mark - Swp Stitching Select SQL Methods

/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingSelectModelSQL:swpDBID: ( 拼接查询单条数据 SQL 语句，根据 swpDBID 查询 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @param  swpDBID swpDBID < swpDBID 主键  >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingSelectModelSQL:(Class)table swpDBID:(NSString *)swpDBID {
    return [[self class] swpStitchingSelectDataSQL:table key:@"swpDBID" value:swpDBID];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingSelectDataSQL:key:value:    ( 拼接查询单条数据 SQL 语句, 根据查询条件 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @param  key     key     < 条件 key >
 *
 *  @param  value   value   < 条件 value >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingSelectDataSQL:(Class)table key:(NSString *)key value:(NSString *)value {
    return [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@ = '%@';", NSStringFromClass(table), key, value];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingSelectModelsSQL:    ( 拼接查询全部数据 SQL 语句 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingSelectModelsSQL:(Class)table {
    return [NSString stringWithFormat:@"SELECT * FROM %@;", NSStringFromClass(table)];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingSelectPropertysSQL: ( 拼接查询全部字段 SQL 语句 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingSelectPropertysSQL:(Class)table {
    return [NSString stringWithFormat: @"pragma table_info('%@')", table];
}

#pragma mark - Swp Stitching Delete SQL Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingDeleteModelSQL:swpDBID: ( 拼接删除单条数据 SQL 语句, 根据 swpDBID 删除 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @param  swpDBID swpDBID < swpDBID 主键  >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingDeleteModelSQL:(Class)table swpDBID:(NSString *)swpDBID {
    return [[self class] swpStitchingDeleteModelSQL:table key:@"swpDBID" value:swpDBID];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingDeleteModelSQL:key:value:   ( 拼接删除单条数据 SQL 语句, 根据查询条件 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @param  key     key     < 条件 key >
 *
 *  @param  value   value   < 条件 value >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingDeleteModelSQL:(Class)table key:(NSString *)key value:(NSString *)value {
    return [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = '%@';", NSStringFromClass(table), key, value];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingDeleteModelsSQL:models: ( 拼接删除一组数据 SQL 语句 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @param  models  models  < 数据源 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingDeleteModelsSQL:(Class)table models:(NSArray *)models {
    
    NSMutableString *deleteSQL = [NSMutableString stringWithFormat:@"DELETE FROM %@ WHERE swpDBID IN ( ", [table class]];
    [models enumerateObjectsUsingBlock:^(id _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@", [model valueForKey:@"swpDBID"]);
        [deleteSQL appendFormat:@"'%@', ", [model valueForKey:@"swpDBID"]];
    }];
    
    [deleteSQL deleteCharactersInRange:NSMakeRange(deleteSQL.length - 2, 1)];
    [deleteSQL appendString:@");"];
    return [NSString stringWithFormat:@"%@", deleteSQL];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingClearModelsSQL: ( 拼接清空表中所有数据 SQL 语句 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingClearModelsSQL:(Class)table {
    return [NSString stringWithFormat:@"DELETE FROM %@", NSStringFromClass(table)];
}


@end
