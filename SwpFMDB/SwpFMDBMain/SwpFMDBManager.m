//
//  SwpFMDBManager.m
//  swp_song
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBManager.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "FMDB.h"                        //  FMDB
#import "SwpFMDBTools.h"                //  Tools
#import "SwpExecuteSQL.h"               //  SQL Tools
/*! ---------------------- Tool       ---------------------- !*/

@implementation SwpFMDBManager

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
+ (BOOL)executeVerifyThatTheTableExists:(Class)modelClass dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB {
    return [SwpExecuteSQL swpExecuteVerifyThatTheTableExistsSQL:dataBase table:modelClass isCloseDB:isCloseDB];
}

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
+ (void)createTable:(Class)modelClass swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete)executionUpdateComplete {
    
    // 断言 验证
    [SwpFMDBTools swpFMDBToolsVerifySystemDataTypesAssert:[[modelClass class] new]];
    
    if ([[self class] executeVerifyThatTheTableExists:modelClass dataBase:dataBase isCloseDB:isCloseDB]) {
        // 表存在
        if (executionUpdateComplete) executionUpdateComplete(swpFMDB, YES);
        return;
    }
    
    BOOL executionStatus = [SwpExecuteSQL swpExecuteCreateTableSQL:dataBase table:modelClass isCloseDB:isCloseDB];
    if (executionUpdateComplete) executionUpdateComplete(swpFMDB, executionStatus);
}

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
 *  @param  executionUpdateComplete executionUpdateComplete
 */
+ (void)insertModel:(id)model swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete)executionUpdateComplete {
    
    [[self class] createTable:[model class] swpFMDB:swpFMDB dataBase:dataBase isCloseDB:isCloseDB executionUpdateComplete:nil];
    BOOL executionStatus  = [SwpExecuteSQL swpExecuteInsertModelSQL:dataBase model:model isCloseDB:isCloseDB];
    if (executionUpdateComplete) executionUpdateComplete(swpFMDB, executionStatus);
}

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
+ (void)insertModels:(NSArray *)models swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete)executionUpdateComplete {
    
    [[self class] createTable:[models.firstObject class] swpFMDB:swpFMDB dataBase:dataBase isCloseDB:isCloseDB executionUpdateComplete:nil];
    
    [models enumerateObjectsUsingBlock:^(id  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        // 最后一条数据
        if (idx == models.count - 1) {
            BOOL executionStatus  = [SwpExecuteSQL swpExecuteInsertModelSQL:dataBase model:model isCloseDB:isCloseDB];
            if (executionUpdateComplete) executionUpdateComplete(swpFMDB, executionStatus);
            return;
        }
        [SwpExecuteSQL swpExecuteInsertModelSQL:dataBase model:model isCloseDB:NO];
    }];
    
}

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
+ (void)updateModel:(id)model swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete)executionUpdateComplete {
    

    if (![[self class] executeVerifyThatTheTableExists:[model class] dataBase:dataBase isCloseDB:isCloseDB]) {
        // 不存在
        if (executionUpdateComplete) executionUpdateComplete(swpFMDB, NO);
        return;
    }
    
    BOOL executionStatus = [SwpExecuteSQL swpExecuteUpdateModelSQL:dataBase model:model isCloseDB:isCloseDB];
    
    if (executionUpdateComplete) executionUpdateComplete(swpFMDB, executionStatus);
    
}

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
+ (void)updateModels:(NSArray *)models swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete)executionUpdateComplete {
    
    
    [models enumerateObjectsUsingBlock:^(id  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        [SwpFMDBTools swpFMDBToolsVerifySystemDataTypesAssert:model];
        
        if (![[self class] executeVerifyThatTheTableExists:[model class] dataBase:dataBase isCloseDB:isCloseDB]) {
            // 不存在
            if (executionUpdateComplete) executionUpdateComplete(swpFMDB, NO);
            return;
        }
        
        // 最后一条 数据
        if (idx == models.count - 1) {
            BOOL executionStatus = [SwpExecuteSQL swpExecuteUpdateModelSQL:dataBase model:model isCloseDB:isCloseDB];
            if (executionUpdateComplete) executionUpdateComplete(swpFMDB, executionStatus);
            return;
        }
        
        [SwpExecuteSQL swpExecuteUpdateModelSQL:dataBase model:model isCloseDB:NO];
    }];

}

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
+ (void)selectModel:(Class)modelClass bySwpDBID:(NSString *)swpDBID swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionSelectModelComplete:(SwpFMDBExecutionSelectModelComplete)executionSelectModelComplete {
    
    if (![[self class] executeVerifyThatTheTableExists:modelClass dataBase:dataBase isCloseDB:isCloseDB]) {
        // 表不存在
        id model = nil;
        if (executionSelectModelComplete) executionSelectModelComplete(swpFMDB, NO, model);
        return;
    }
    id model = [SwpExecuteSQL swpExecuteSelectModelSQL:dataBase table:modelClass bySwpDBID:swpDBID isCloseDB:YES];
    if (executionSelectModelComplete) executionSelectModelComplete(swpFMDB, model ? YES: NO, model);
}

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
+ (void)selectModels:(Class)modelClass swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionSelectModelsComplete:(SwpFMDBExecutionSelectModelsComplete)executionSelectModelsComplete {
    
    if (![[self class] executeVerifyThatTheTableExists:modelClass dataBase:dataBase isCloseDB:isCloseDB]) {
        // 表不存在
        id model = nil;
        if (executionSelectModelsComplete) executionSelectModelsComplete(swpFMDB, NO, model);
        return;
    }
    NSArray *models = [SwpExecuteSQL swpExecuteSelectModelsSQL:dataBase table:modelClass isCloseDB:YES];
    if (executionSelectModelsComplete) executionSelectModelsComplete(swpFMDB, models.count && models ? YES : NO, models);
}


#pragma mark - SwpFMDBManager Delegate Methods
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
+ (void)delegateModel:(id)model swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete)executionUpdateComplete {
    
    if (![[self class] executeVerifyThatTheTableExists:[model class] dataBase:dataBase isCloseDB:isCloseDB]) {
        // 不存在
        if (executionUpdateComplete) executionUpdateComplete(swpFMDB, NO);
        return;
    }
    
    BOOL executionStatus = [SwpExecuteSQL swpExecuteDeleteModelSQL:dataBase model:model isCloseDB:isCloseDB];
    if (executionUpdateComplete) executionUpdateComplete(swpFMDB, executionStatus);
    
}

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
+ (void)delegateModels:(NSArray *)models swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete)executionUpdateComplete {

    __block BOOL result = NO;
    __block id   model  = nil;
    
    // 验证数据
    [SwpFMDBTools swpFMDBToolsVerifyArrayInSameTypeOfData:models verificationMessage:^(BOOL verificationResult, id  _Nonnull verificationModel) {
        result = verificationResult;
        model  = verificationModel;
    }];
    
    if (!result || !model) {
        if (executionUpdateComplete) executionUpdateComplete(swpFMDB, NO);
        return;
    }
    
    // 验证表
    if (![[self class] executeVerifyThatTheTableExists:[model class] dataBase:dataBase isCloseDB:isCloseDB]) {
        // 不存在
        if (executionUpdateComplete) executionUpdateComplete(swpFMDB, NO);
        return;
    }
    
    BOOL executionStatus = [SwpExecuteSQL swpExecuteDeleteModelsSQL:dataBase table:[model class] models:models isCloseDB:isCloseDB];
    if (executionUpdateComplete) executionUpdateComplete(swpFMDB, executionStatus);
    
}

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
+ (void)clearModels:(Class)modelClass swpFMDB:(SwpFMDB *)swpFMDB dataBase:(FMDatabase *)dataBase isCloseDB:(BOOL)isCloseDB executionUpdateComplete:(SwpFMDBExecutionUpdateComplete)executionUpdateComplete {
    
    // 验证表
    if (![[self class] executeVerifyThatTheTableExists:modelClass dataBase:dataBase isCloseDB:isCloseDB]) {
        // 不存在
        if (executionUpdateComplete) executionUpdateComplete(swpFMDB, NO);
        return;
    }
    
    BOOL executionStatus = [SwpExecuteSQL swpExecuteClearModelSQL:dataBase table:modelClass isCloseDB:YES];
    if (executionUpdateComplete) executionUpdateComplete(swpFMDB, executionStatus);

}



@end

