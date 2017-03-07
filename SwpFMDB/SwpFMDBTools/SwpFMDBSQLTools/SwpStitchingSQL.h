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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingVerifyThatTheTableExistsSQL:   ( 验证 表 是否存 SQL )
 *
 *  @ param  modelClass
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingVerifyThatTheTableExistsSQL:(Class)modelClass;

#pragma mark - Swp Stitching  Create Table SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingCreateTableSQL ( 拼接 创表 语句 )
 *
 *  @ param  modelClass
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingCreateTableSQL:(Class)modelClass;

#pragma mark - Swp Stitching Inster SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingInsertSQL: ( 拼接 插入数据 SQL )
 *
 *  @ param  model
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingInsertSQL:(id)model;

#pragma mark - Swp Stitching Update SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingUpdateSQLConditionSwpDBID: ( 拼接 修改数据 SQL )
 *
 *  @ param  model
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingUpdateSQLConditionSwpDBID:(id)model;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingUpdateSQL:conditionKey:conditionValue: ( 拼接 修改数据 SQL )
 *
 *  @ param  model
 *
 *  @ param  key
 *
 *  @ param  value
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingUpdateSQL:(id)model conditionKey:(NSString *)key conditionValue:(NSString *)value;

#pragma mark - Swp Stitching Select SQL Methods

/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingSelectModelSQL:swpBDID:    ( 根据 key 查询 value 数据 < 单条数据 > )
 *
 *  @ param  modelClass
 *
 *  @ param  swpBDID
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingSelectModelSQL:(Class)modelClass swpDBID:(NSString *)swpDBID;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingSelectModelSQL:swpBDID:    ( 查询 根据 swpBDID 数据 SQL < 单条数据 > )
 *
 *  @ param  modelClass
 *
 *  @ param  swpBDID
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingSelectDataSQL:(Class)modelClass key:(NSString *)key value:(NSString *)value;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingSelectDataSQL:key:value:   ( 查询 全部 数据 SQL < 单条数据 > )
 *
 *  @ param  modelClass
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingSelectModelsSQL:(Class)modelClass;

#pragma mark - Swp Stitching Delete SQL Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingDeleteModelSQL:key:value: ( 删除 单条 数据 SQL < 单条数据 > )
 *
 *  @ param  modelClass
 *
 *  @ param  key
 *
 *  @ param  value
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingDeleteModelSQL:(Class)modelClass key:(NSString *)key value:(NSString *)value;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingDeleteModelSQL:swpDBID:   ( 删除 单条 数据 SQL 根据 swpDBID < 单条数据 > )
 *
 *  @ param  modelClass
 *
 *  @ param  swpDBID
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingDeleteModelSQL:(Class)modelClass swpDBID:(NSString *)swpDBID;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingDeleteModelsSQL:models:    ( 删除 一组 数据 SQL 根据 swpDBID < 删除一组数据 > )
 *
 *  @ param  modelClass
 *
 *  @ param  models
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingDeleteModelsSQL:(Class)modelClass models:(NSArray *)models;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingClearModelsSQL:    ( 清空表数据 )
 *
 *  @ param  modelClass
 *
 *  @ return NSString
 */
+ (NSString *)swpStitchingClearModelsSQL:(Class)modelClass;

@end
NS_ASSUME_NONNULL_END
