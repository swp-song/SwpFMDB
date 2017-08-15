//
//  SwpFMDBManager.h
//  swp_song
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
 *  @author swp_song
 *
 *  @brief  executeVerifyThatTheTableExists:    ( 验证表是否存在 )
 *
 *  @param  modelClass  modelClass
 *
 *  @return BOOL
 */
+ (BOOL)executeVerifyThatTheTableExists:(Class)modelClass dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB;

#pragma mark - SwpFMDBManager Create Table Methods
/**!
 *  @author swp_song
 *
 *  @brief  createTable:isCloseDB:executionUpdateComplete:  ( 创建表 )
 *
 *  @param  modelClass              modelClass
 *
 *  @param  isCloseDB               isCloseDB
 *
 *  @param  executionUpdateComplete executionUpdateComplete
 */
+ (void)createTable:(Class)modelClass swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)executionUpdateComplete;

#pragma mark - SwpFMDBManager Insert Methods
/**!
 *  @author swp_song
 *
 *  @brief  insertModel:swpFMDB:dataBase:isCloseDB:executionUpdateComplete: ( 插入单条数据 )
 *
 *  @param  model                   model
 *
 *  @param  swpFMDB                 swpFMDB
 *
 *  @param  dataBase                dataBase
 *
 *  @param  isCloseDB               isCloseDB
 *
 *  @param  executionUpdateComplet  executionUpdateComplet
 */
+ (void)insertModel:(NSObject *)model swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)executionUpdateComplet;

/**!
 *  @author swp_song
 *
 *  @brief  insertModels:swpFMDB:dataBase:isCloseDB:executionUpdateComplete:    ( 插入多条数据 )
 *
 *  @param  models                  models
 *
 *  @param  swpFMDB                 swpFMDB
 *
 *  @param  dataBase                dataBase
 *
 *  @param  isCloseDB               isCloseDB
 *
 *  @param  executionUpdateComplete executionUpdateComplete
 */
+ (void)insertModels:(NSArray *)models swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)executionUpdateComplete;

#pragma mark - SwpFMDBManager Update Methods
/**!
 *  @author swp_song
 *
 *  @brief  updateModel:swpFMDB:dataBase:isCloseDB:executionUpdateComplete: ( 更新单条数据 )
 *
 *  @param  model                   model
 *
 *  @param  swpFMDB                 swpFMDB
 *
 *  @param  dataBase                dataBase
 *
 *  @param  isCloseDB               isCloseDB
 *
 *  @param  executionUpdateComplete executionUpdateComplete
 */
+ (void)updateModel:(NSObject *)model swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)executionUpdateComplete;

/**!
 *  @author swp_song
 *
 *  @brief  updateModels:swpFMDB:dataBase:isCloseDB:executionUpdateComplete:    ( 更新一组数据 )
 *
 *  @param  models                  models
 *
 *  @param  swpFMDB                 swpFMDB
 *
 *  @param  dataBase                dataBase
 *
 *  @param  isCloseDB               isCloseDB
 *
 *  @param  executionUpdateComplete executionUpdateComplete
 */
+ (void)updateModels:(NSArray *)models swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)executionUpdateComplete;

#pragma mark - SwpFMDBManager Select Methods
/**!
 *  @author swp_song
 *
 *  @brief  selectModel:bySwpDBID:swpFMDB:dataBase:isCloseDB:executionSelectModelComplete:  ( 查询单条数据 )
 *
 *  @param  modelClass                      modelClass
 *
 *  @param  swpDBID                         swpDBID
 *
 *  @param  swpFMDB                         swpFMDB
 *
 *  @param  dataBase                        dataBase
 *
 *  @param  isCloseDB                       isCloseDB
 *
 *  @param  executionSelectModelComplete    executionSelectModelComplete
 */
+ (void)selectModel:(Class)modelClass bySwpDBID:(NSString *)swpDBID swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionSelectModelComplete:(SwpFMDBExecutionSelectModelComplete)executionSelectModelComplete;

/**!
 *  @author swp_song
 *
 *  @brief  selectModels:swpFMDB:dataBase:isCloseDB:executionSelectModelsComplete:  ( 查询全部数据 )
 *
 *  @param  modelClass                      modelClass
 *
 *  @param  swpFMDB                         swpFMDB
 *
 *  @param  dataBase                        dataBase
 *
 *  @param  isCloseDB                       isCloseDB
 *
 *  @param  executionSelectModelsComplete   executionSelectModelsComplete
 */
+ (void)selectModels:(Class)modelClass swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionSelectModelsComplete:(SwpFMDBExecutionSelectModelsComplete _Nullable)executionSelectModelsComplete;

#pragma mark - SwpFMDBManager Delete Data Methods
/**!
 *  @author swp_song
 *
 *  @brief  delegateModel:swpFMDB:dataBase:isCloseDB:executionSelectModelsComplete: ( 删除指定数据 )
 *
 *  @param  model                   model
 *
 *  @param  swpFMDB                 swpFMDB
 *
 *  @param  dataBase                dataBase
 *
 *  @param  isCloseDB               isCloseDB
 *
 *  @param  executionUpdateComplete executionUpdateComplete
 */
+ (void)delegateModel:(NSObject *)model swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)executionUpdateComplete;

/**!
 *  @author swp_song
 *
 *  @brief  delegateModels:swpFMDB:dataBase:isCloseDB:executionSelectModelsComplete:    ( 删除一组数据 )
 *
 *  @param  models                  models
 *
 *  @param  swpFMDB                 swpFMDB
 *
 *  @param  dataBase                dataBase
 *
 *  @param  isCloseDB               isCloseDB
 *
 *  @param  executionUpdateComplete executionUpdateComplete
 */
+ (void)delegateModels:(NSArray *)models swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)executionUpdateComplete;

/**!
 *  @author swp_song
 *
 *  @brief  clearModels:swpFMDB:dataBase:isCloseDB:executionSelectModelsComplete:   ( 清空全部数据 )
 *
 *  @param  modelClass              modelClass
 *
 *  @param  swpFMDB                 swpFMDB
 *
 *  @param  dataBase                dataBase
 *
 *  @param  isCloseDB               isCloseDB
 *
 *  @param  executionUpdateComplete executionUpdateComplete
 */
+ (void)clearModels:(Class)modelClass swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)executionUpdateComplete;

#pragma mark - SwpFMDBManager Delete Table Methods
/**!
 *  @author swp_song
 *
 *  @brief  deleteTable:swpFMDB:dataBase:isCloseDB:executionSelectModelsComplete:   ( 删除表数据 )
 *
 *  @param  table       table
 *
 *  @param  swpFMDB     swpFMDB
 *
 *  @param  dataBase    dataBase
 *
 *  @param  isCloseDB   isCloseDB
 *
 *  @param  executionUpdateComplete executionUpdateComplete
 */
+ (void)deleteTable:(Class)table swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete _Nullable)executionUpdateComplete;

@end
NS_ASSUME_NONNULL_END
