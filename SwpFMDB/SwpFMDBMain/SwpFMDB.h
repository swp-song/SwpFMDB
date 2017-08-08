//
//  SwpFMDB.h
//  swp_song
//
//  Created by swp_song on 2017/2/9.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBBase.h"

NS_ASSUME_NONNULL_BEGIN


@interface SwpFMDB : SwpFMDBBase

#pragma mark - SwpFMDB Verify Table Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBExecuteVerifyThatTheTableExists: ( 验证数据库中 '表' 是否存在 )
 *
 *  @param  modelClass  modelClass
 *
 *  @return BOOL
 */
- (BOOL)swpFMDBExecuteVerifyThatTheTableExists:(Class)modelClass;

#pragma mark - SwpFMDB Create Table Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBCreateTable:swpFMDBExecutionUpdateComplete:  ( 创建数据库中 '表' )
 *
 *  @param  modelClass  modelClass          modelClass
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBCreateTable:(Class)modelClass swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;


#pragma mark - SwpFMDB Insert Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBInsertModel:swpFMDBExecutionUpdateComplete: ( 插入单条数据 )
 *
 *  @param  model                           model
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBInsertModel:(id)model swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBInsertModels:swpFMDBExecutionUpdateComplete: ( 插入一组数据 )
 *
 *  @param  models                          models
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBInsertModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;


#pragma mark - SwpFMDB Update Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBUpdateModel:swpFMDBExecutionUpdateComplete:  ( 更新单条数据 )
 *
 *  @param  model                           model
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBUpdateModel:(id)model swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBUpdateModels:swpFMDBExecutionUpdateComplete: ( 更新一组数据 )
 *
 *  @param  models                          models
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBUpdateModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete;


#pragma mark - SwpFMDB Select Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBSelectModel:bySwpDBID:swpFMDBExecutionSelectModelComplete:   ( 查询单条数据 )
 *
 *  @param  modelClass                          modelClass
 *
 *  @param  swpDBID                             swpDBID
 *
 *  @param  swpFMDBExecutionSelectModelComplete swpFMDBExecutionSelectModelComplete
 */
- (void)swpFMDBSelectModel:(Class)modelClass bySwpDBID:(NSString *)swpDBID swpFMDBExecutionSelectModelComplete:(SwpFMDBExecutionSelectModelComplete)swpFMDBExecutionSelectModelComplete;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBSelectModels:swpFMDBExecutionSelectModelsComplete:   ( 查询全部数据 )
 *
 *  @param  modelClass                              modelClass
 *
 *  @param  swpFMDBExecutionSelectModelsComplete    swpFMDBExecutionSelectModelsComplete
 */
- (void)swpFMDBSelectModels:(Class)modelClass swpFMDBExecutionSelectModelsComplete:(SwpFMDBExecutionSelectModelsComplete)swpFMDBExecutionSelectModelsComplete;

#pragma mark - SwpFMDB Delete Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDelegateModel:swpFMDBExecutionUpdateComplete:    ( 删除单条数据 )
 *
 *  @param  model                           model
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBDelegateModel:(id)model swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)swpFMDBExecutionUpdateComplete;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDelegateModels:swpFMDBExecutionUpdateComplete:   ( 删除一组数据 )
 *
 *  @param  models                          models
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBDelegateModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)swpFMDBExecutionUpdateComplete;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBClearModel:swpFMDBExecutionUpdateComplete:  ( 清空全部数据 )
 *
 *  @param  modelsClass                     modelsClass
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBClearModel:(Class)modelsClass swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)swpFMDBExecutionUpdateComplete;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBSelectTest:  ( 测试方法 )
 */
- (void)swpFMDBSelectTest;

@end
NS_ASSUME_NONNULL_END
