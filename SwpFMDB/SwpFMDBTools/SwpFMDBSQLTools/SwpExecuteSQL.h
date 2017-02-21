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
+ (BOOL)swpExecuteCreateTableSQL:(FMDatabase *)dataBase table:(Class)modelClass isCloseDB:(BOOL)isCloseDB;

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
+ (BOOL)swpExecuteInsertModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB;

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
+ (BOOL)swpExecuteUpdateModelSQL:(FMDatabase *)dataBase model:(id)model isCloseDB:(BOOL)isCloseDB;

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
+ (id)swpExecuteSelectModelSQL:(FMDatabase *)dataBase table:(Class)modelClass bySwpDBID:(NSString *)swpDBID isCloseDB:(BOOL)isCloseDB;

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
+ (NSArray *)swpExecuteSelectModelsSQL:(FMDatabase *)dataBase table:(Class)modelClass isCloseDB:(BOOL)isCloseDB;


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
+ (BOOL)swpExecuteVerifyThatTheTableExistsSQL:(FMDatabase *)dataBase table:(Class)modelClass;


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
+ (BOOL)swpExecuteVerifyThatTheTableExistsSQL:(FMDatabase *)dataBase table:(Class)modelClass isCloseDB:(BOOL)isCloseDB;

@end
NS_ASSUME_NONNULL_END
