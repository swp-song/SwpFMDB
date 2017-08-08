 //
//  SwpFMDB.m
//  swp_song
//
//  Created by swp_song on 2017/2/9.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDB.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpFMDBManager.h"              //  SwpFMDBManager
/*! ---------------------- Tool       ---------------------- !*/

@interface SwpFMDB ()

@end

@implementation SwpFMDB


#pragma mark - Private
/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBInTransaction:block   ( 单利 方法 创建 SwpFMDB  )
 *
 *  @ param  databaseQueue
 *
 *  @ param  block
 */
- (void)swpFMDBInTransaction:(void(^)(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback))block {

    __weak typeof(self) weakSelf = self;
    [self swpFMDBBaseInTransaction:^(FMDatabase * _Nonnull dataBase, BOOL * _Nonnull rollback) {
        __weak typeof(self) strongSelf = weakSelf;
        if (block) block (strongSelf, dataBase, rollback);
    }];
}



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
- (BOOL)swpFMDBExecuteVerifyThatTheTableExists:(Class)modelClass {
    __block BOOL exists = NO;
    // 开启 事务管理
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 验证数据库中 '表' 是否存在, YES 存在, NO 不存在
        exists = [SwpFMDBManager executeVerifyThatTheTableExists:modelClass dataBase:dataBase isCloseDB:YES];
    }];
    return exists;
}

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
- (void)swpFMDBCreateTable:(Class)modelClass swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    // 开启 事务管理
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 创建 数据库表
        [SwpFMDBManager createTable:modelClass swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}

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
- (void)swpFMDBInsertModel:(id)model swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    
    // 开启 事务管理
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 插入数据
        [SwpFMDBManager insertModel:model swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
    
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBInsertModels:swpFMDBExecutionUpdateComplete: ( 插入一组数据 )
 *
 *  @param  models                          models
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBInsertModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    
    // 开启 事务管理
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 插入 一组 数据
        [SwpFMDBManager insertModels:models swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}

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
- (void)swpFMDBUpdateModel:(id)model swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    
    // 开启 事务管理
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 更新 单条 数据
        [SwpFMDBManager updateModel:model swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
    
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBUpdateModels:swpFMDBExecutionUpdateComplete: ( 更新一组数据 )
 *
 *  @param  models                          models
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBUpdateModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    // 开启 事务管理
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 更新 一组 数据
        [SwpFMDBManager updateModels:models swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}

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
- (void)swpFMDBSelectModel:(Class)modelClass bySwpDBID:(NSString *)swpDBID swpFMDBExecutionSelectModelComplete:(SwpFMDBExecutionSelectModelComplete)swpFMDBExecutionSelectModelComplete {
    // 开启 事务管理
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 查询 单条 数据
        [SwpFMDBManager selectModel:modelClass bySwpDBID:swpDBID swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionSelectModelComplete:swpFMDBExecutionSelectModelComplete];
    }];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBSelectModels:swpFMDBExecutionSelectModelsComplete:   ( 查询全部数据 )
 *
 *  @param  modelClass                              modelClass
 *
 *  @param  swpFMDBExecutionSelectModelsComplete    swpFMDBExecutionSelectModelsComplete
 */
- (void)swpFMDBSelectModels:(Class)modelClass swpFMDBExecutionSelectModelsComplete:(SwpFMDBExecutionSelectModelsComplete)swpFMDBExecutionSelectModelsComplete {
    // 开启 事务管理
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 查询 一组 数据
        [SwpFMDBManager selectModels:modelClass swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionSelectModelsComplete:swpFMDBExecutionSelectModelsComplete];
    }];
}

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
- (void)swpFMDBDelegateModel:(id)model swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        [SwpFMDBManager delegateModel:model swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDelegateModels:swpFMDBExecutionUpdateComplete:   ( 删除一组数据 )
 *
 *  @param  models                          models
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBDelegateModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        [SwpFMDBManager delegateModels:models swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBClearModel:swpFMDBExecutionUpdateComplete:  ( 清空全部数据 )
 *
 *  @param  modelsClass                     modelsClass
 *
 *  @param  swpFMDBExecutionUpdateComplete  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBClearModel:(Class)modelsClass swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    
    [self swpFMDBInTransaction:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        [SwpFMDBManager clearModels:modelsClass swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBSelectTest:  ( 测试方法 )
 */
- (void)swpFMDBSelectTest  {
    
}



@end
