//
//  SwpFMDB.h
//  swp_song
//
//  Created by swp_song on 2017/2/9.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SwpFMDBDataTypes.h"

NS_ASSUME_NONNULL_BEGIN


@interface SwpFMDB : NSObject

/**!
 *  @ author swp_song
 *
 *  @ brief  shareManager   ( 单利 方法 创建 SwpFMDB  )
 *
 *  @ return SwpFMDB
 */
+ (instancetype)shareManager;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBExecuteVerifyThatTheTableExists:    ( 验证数据库中 '表' 是否存在 )
 *
 *  @ param  modelClass
 *
 *  @ return BOOL
 */
- (BOOL)swpFMDBExecuteVerifyThatTheTableExists:(Class)modelClass;

#pragma mark - SwpFMDB Create Table Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBCreateTable:swpFMDBExecutionComplete:   ( 创建 数据库表 )
 *
 *  @ param  modelClass
 *
 *  @ param  swpFMDBExecutionComplete
 */
- (void)swpFMDBCreateTable:(Class)modelClass swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;

#pragma mark - SwpFMDB Insert Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBInsertModel:swpFMDBExecutionUpdateComplete: ( 插入 单条 数据 )
 *
 *  @ param  model
 *
 *  @ param  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBInsertModel:(id)model swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBInsertModels:swpFMDBExecutionUpdateComplete:    ( 插入 一组 数据 )
 *
 *  @ param  models
 *
 *  @ param  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBInsertModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;

#pragma mark - SwpFMDB Update Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBUpdateModel:swpFMDBExecutionUpdateComplete: ( 更新 单条 数据 )
 *
 *  @ param  model
 *
 *  @ param  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBUpdateModel:(id)model swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;
/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBUpdateModels:swpFMDBExecutionUpdateComplete:    ( 更新 一组 数据 )
 *
 *  @ param  models
 *
 *  @ param  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBUpdateModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;

#pragma mark - SwpFMDB Select Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBSelectModel:bySwpDBID:swpFMDBExecutionSelectModelComplete: ( 查询 单条 数据 )
 *
 *  @ param  modelClass
 *
 *  @ param  swpDBID
 *
 *  @ param  swpFMDBExecutionSelectModelComplete
 */
- (void)swpFMDBSelectModel:(Class)modelClass bySwpDBID:(NSString *)swpDBID swpFMDBExecutionSelectModelComplete:(nullable SwpFMDBExecutionSelectModelComplete)swpFMDBExecutionSelectModelComplete;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBSelectModels:swpFMDBExecutionSelectModelsComplete:   ( 查询 全部 数据 )
 *
 *  @ param  modelClass
 *
 *  @ param  swpFMDBExecutionSelectModelsComplete
 */
- (void)swpFMDBSelectModels:(Class)modelClass swpFMDBExecutionSelectModelsComplete:(nullable SwpFMDBExecutionSelectModelsComplete)swpFMDBExecutionSelectModelsComplete;

#pragma mark - SwpFMDB Delete Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBDelegateModel:swpFMDBExecutionUpdateComplete:   ( 删除 单条 数据 )
 *
 *  @ param  model
 *
 *  @ param  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBDelegateModel:(id)model swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBSelectTest: ( 测试方法 )
 */
- (void)swpFMDBSelectTest;

@end
NS_ASSUME_NONNULL_END
