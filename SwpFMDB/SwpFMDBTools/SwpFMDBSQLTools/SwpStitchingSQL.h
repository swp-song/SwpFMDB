//
//  SwpStitchingSQL.h
//  swp_song
//
//  Created by swp_song on 2017/2/11.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN
@interface SwpStitchingSQL : NSObject

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
+ (NSString *)swpStitchingVerifyThatTheTableExistsSQL:(Class)table;

#pragma mark - Swp Stitching  Create Table SQL Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingCreateTableSQL: ( 拼接创建表 SQL 语句 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingCreateTableSQL:(Class)table;

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
+ (NSString *)swpStitchingInsertSQL:(id)model;

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
+ (NSString *)swpStitchingUpdateSQLConditionSwpDBID:(id)model;

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
+ (NSString *)swpStitchingUpdateSQL:(id)model conditionKey:(NSString *)key conditionValue:(NSString *)value;

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
+ (NSString *)swpStitchingSelectModelSQL:(Class)table swpDBID:(NSString *)swpDBID;

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
+ (NSString *)swpStitchingSelectDataSQL:(Class)table key:(NSString *)key value:(NSString *)value;

/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingSelectModelsSQL:    ( 拼接查询全部数据 SQL 语句 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingSelectModelsSQL:(Class)table;

#pragma mark - Swp Stitching Delete SQL Methods

/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingDeleteModelSQL:swpDBID: ( 拼接查询全部数据 SQL 语句, 根据 swpDBID 删除 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @param  swpDBID swpDBID < swpDBID 主键  >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingDeleteModelSQL:(Class)table swpDBID:(NSString *)swpDBID;

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
+ (NSString *)swpStitchingDeleteModelSQL:(Class)table key:(NSString *)key value:(NSString *)value;

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
+ (NSString *)swpStitchingDeleteModelsSQL:(Class)table models:(NSArray *)models;

/**!
 *  @author swp_song
 *
 *  @brief  swpStitchingClearModelsSQL: ( 拼接清空表中所有数据 SQL 语句 )
 *
 *  @param  table   table   < 表名称 >
 *
 *  @return NSString
 */
+ (NSString *)swpStitchingClearModelsSQL:(Class)table;
@end
NS_ASSUME_NONNULL_END
