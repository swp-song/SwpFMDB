//
//  SwpExecuteSQL.h
//  swp_song
//
//  Created by swp_song on 2017/2/11.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface SwpExecuteSQL : NSObject

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
+ (BOOL)swpExecuteCreateTableSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB;

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
+ (BOOL)swpExecuteCreateTableSQL:(FMDatabase *)dataBase table:(Class)table fields:(NSArray * _Nullable)fields isCloseDB:(BOOL)isCloseDB;

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
+ (BOOL)swpExecuteUpdateFields:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB;


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
+ (BOOL)swpExecuteInsertModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB;

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
+ (BOOL)swpExecuteUpdateModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB;


#pragma mark - SwpExecuteSQL Execute Select SQL Methods
/**
 *  @author swp_song
 *
 *  @brief  swpExecuteSelectModelSQL:table:bySwpDBID:isCloseDB:    ( 执行查询 SQL 语句，根据主键 swpDBDI 查询单条数据 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  modelClass  modelClass  < 创建表名称 >
 *
 *  @param  swpDBID     swpDBID     < 主键 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return id
 */
+ (id)swpExecuteSelectModelSQL:(FMDatabase *)dataBase table:(Class)modelClass bySwpDBID:(NSString *)swpDBID isCloseDB:(BOOL)isCloseDB;

/**
 *  @author swp_song
 *
 *  @brief  swpExecuteSelectModelsSQL:table:isCloseDB:  ( 执行查询全部数据 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  modelClass  modelClass  < 创建表名称 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return NSArray
 */
+ (NSArray *)swpExecuteSelectModelsSQL:(FMDatabase *)dataBase table:(Class)modelClass isCloseDB:(BOOL)isCloseDB;

/**
 *  @author swp_song
 *
 *  @brief  swpExecuteSelectPropertysSQL:table:isCloseDB:   ( 执行查询表中全部字段 SQL 语句 )
 *
 *  @param  dataBase    dataBase    < 数据库 >
 *
 *  @param  table       table       < 表名称 >
 *
 *  @param  isCloseDB   isCloseDB   < 是否关闭数据库 >
 *
 *  @return NSArray
 */
+ (NSArray *)swpExecuteSelectPropertysSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB;

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
+ (BOOL)swpExecuteDeleteModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB;

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
+ (BOOL)swpExecuteDeleteModelsSQL:(FMDatabase *)dataBase table:(Class)table models:(NSArray *)models isCloseDB:(BOOL)isCloseDB;


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
+ (BOOL)swpExecuteClearModelSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB;


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
+ (BOOL)swpExecuteDeleteTaleSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB;


#pragma mark -
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
+ (BOOL)swpExecuteVerifyThatTheTableExistsSQL:(FMDatabase *)dataBase table:(Class)table;


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
+ (BOOL)swpExecuteVerifyThatTheTableExistsSQL:(FMDatabase *)dataBase table:(Class)table isCloseDB:(BOOL)isCloseDB;



@end
NS_ASSUME_NONNULL_END
