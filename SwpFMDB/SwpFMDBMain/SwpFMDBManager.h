//
//  SwpFMDBManager.h
//  FMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SwpFMDBDataTypes.h"

@class FMDatabase, SwpFMDB;

NS_ASSUME_NONNULL_BEGIN
@interface SwpFMDBManager : NSObject

#pragma mark - SwpFMDBManager Verify Table Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  executeVerifyThatTheTableExists:   ( 验证表是否存在 )
 *
 *  @ param  modelClass
 *
 *  @ return BOOL
 */
+ (BOOL)executeVerifyThatTheTableExists:(Class)modelClass dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB;

#pragma mark - SwpFMDBManager Create Table Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  createTable:isCloseDB:executionUpdateComplete: ( 创建表 )
 *
 *  @ param  modelClass
 *
 *  @ param  isCloseDB
 *
 *  @ param  executionUpdateComplete
 */
+ (void)createTable:(Class)modelClass swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)executionUpdateComplete;

#pragma mark - SwpFMDBManager Insert Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  insertModel:swpFMDB:dataBase:isCloseDB:executionUpdateComplete:    ( 插入 单条 数据 )
 *
 *  @ param  model
 *
 *  @ param  swpFMDB
 *
 *  @ param  dataBase
 *
 *  @ param  isCloseDB
 *
 *  @ param  executionUpdateComplete
 */
+ (void)insertModel:(id)model swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)executionUpdateComplet;

/**!
 *  @ author swp_song
 *
 *  @ brief  insertModels:swpFMDB:dataBase:isCloseDB:executionUpdateComplete:   ( 插入 多条 数据 )
 *
 *  @ param  models
 *
 *  @ param  swpFMDB
 *
 *  @ param  dataBase
 *
 *  @ param  isCloseDB
 *
 *  @ param  executionUpdateComplete
 */
+ (void)insertModels:(NSArray *)models swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)executionUpdateComplete;

#pragma mark - SwpFMDBManager Update Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  updateModel:swpFMDB:dataBase:isCloseDB:executionUpdateComplete:    ( 更新 单条数据 数据 )
 *
 *  @ param  model
 *
 *  @ param  swpFMDB
 *
 *  @ param  dataBase
 *
 *  @ param  isCloseDB
 *
 *  @ param  executionUpdateComplete
 */
+ (void)updateModel:(id)model swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)executionUpdateComplete;

/**!
 *  @ author swp_song
 *
 *  @ brief  updateModels:swpFMDB:dataBase:isCloseDB:executionUpdateComplete:    ( 更新 一组 数据 )
 *
 *  @ param  models
 *
 *  @ param  swpFMDB
 *
 *  @ param  dataBase
 *
 *  @ param  isCloseDB
 *
 *  @ param  executionUpdateComplete
 */
+ (void)updateModels:(NSArray *)models swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)executionUpdateComplete;

#pragma mark - SwpFMDBManager Select Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  selectModel:bySwpDBID:swpFMDB:dataBase:isCloseDB:executionSelectModelComplete: ( 查询 单条 数据 )
 *
 *  @ param modelClass
 *
 *  @ param swpDBID
 *
 *  @ param swpFMDB
 *
 *  @ param dataBase
 *
 *  @ param isCloseDB
 *
 *  @ param executionSelectModelComplete
 */
+ (void)selectModel:(Class)modelClass bySwpDBID:(NSString *)swpDBID swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionSelectModelComplete:(nullable SwpFMDBExecutionSelectModelComplete)executionSelectModelComplete;

/**!
 *  @ author swp_song
 *
 *  @ brief  selectModels:swpFMDB:dataBase:isCloseDB:executionSelectModelsComplete: ( 查询 全部 数据 )
 *
 *  @ param  modelClass
 *
 *  @ param  swpDBID
 *
 *  @ param  swpFMDB
 *
 *  @ param  dataBase
 *
 *  @ param  isCloseDB
 *
 *  @ param  executionSelectModelComplete
 */
+ (void)selectModels:(Class)modelClass swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionSelectModelsComplete:(nullable SwpFMDBExecutionSelectModelsComplete)executionSelectModelsComplete;

#pragma mark - SwpFMDBManager Delegate Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  delegateModel:swpFMDB:dataBase:isCloseDB:executionSelectModelsComplete: ( 删除 表中 指定数据 )
 *
 *  @ param  model
 *
 *  @ param  swpFMDB
 *
 *  @ param  dataBase
 *
 *  @ param  isCloseDB
 *
 *  @ param  executionUpdateComplete
 */
+ (void)delegateModel:(id)model swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)executionUpdateComplete;

@end
NS_ASSUME_NONNULL_END
