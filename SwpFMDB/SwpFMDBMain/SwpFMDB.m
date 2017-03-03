//
//  SwpFMDB.m
//  swp_song
//
//  Created by swp_song on 2017/2/9.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDB.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "FMDB.h"                        //  FMDB
#import "SwpFMDBTools.h"                //  Tools
#import "SwpFMDBManager.h"              //  SwpFMDBManager
/*! ---------------------- Tool       ---------------------- !*/

@interface SwpFMDB ()

/*! 数据库 操作 !*/
@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;

@end

@implementation SwpFMDB

static id _swpFMDB;

#pragma mark - Override Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  allocWithZone: ( Override  allocWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _swpFMDB = [super allocWithZone:zone];
    });
    return _swpFMDB;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
- (id)copyWithZone:(NSZone *)zone {
    return  _swpFMDB;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
+ (id)copyWithZone:(struct _NSZone *)zone {
    return  _swpFMDB;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  mutableCopyWithZone:   ( Override  mutableCopyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return _swpFMDB;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  mutableCopyWithZone: ( Override  mutableCopyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
- (id)mutableCopyWithZone:(NSZone *)zone {
    return _swpFMDB;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  init   ( Override init )
 *
 *  @ return SwpFMDB
 */
- (instancetype)init {
    
    if (self = [super init]) {
        self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:[SwpFMDBTools swpFMDBToolsGetSqlFilePath]];
    }
    return self;
}


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
- (void)swpFMDBInTransaction:(FMDatabaseQueue *)databaseQueue block:(void(^)(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback))block {
    __weak typeof(self) weakSelf = self;
    // 开启
    [databaseQueue inTransaction:^(FMDatabase *dataBase, BOOL *rollback) {
        __weak typeof(self) strongSelf = weakSelf;
        
        if (block) block (strongSelf, dataBase, rollback);
        
        if (!rollback) {
            * rollback = YES;
            return;
        }
        
    }];
}

#pragma mark - Public Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  shareManager   ( 单利 方法 创建 SwpFMDB  )
 *
 *  @ return SwpFMDB
 */
+ (instancetype)shareManager {
    
    static SwpFMDB *swpFMDB;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swpFMDB = [[self alloc] init];
    });
    return swpFMDB;
}

#pragma mark - SwpFMDB Verify Table Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBExecuteVerifyThatTheTableExists:    ( 验证数据库中 '表' 是否存在 )
 *
 *  @ param  modelClass
 *
 *  @ return BOOL
 */
- (BOOL)swpFMDBExecuteVerifyThatTheTableExists:(Class)modelClass {
    __block BOOL exists = NO;
    // 开启 事务管理
    [self swpFMDBInTransaction:self.databaseQueue block:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 验证数据库中 '表' 是否存在, YES 存在, NO 不存在
        exists = [SwpFMDBManager executeVerifyThatTheTableExists:modelClass dataBase:dataBase isCloseDB:YES];
    }];
    return exists;
}

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
- (void)swpFMDBCreateTable:(Class)modelClass swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    // 开启 事务管理
    [self swpFMDBInTransaction:self.databaseQueue block:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 创建 数据库表
        [SwpFMDBManager createTable:modelClass swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}

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
- (void)swpFMDBInsertModel:(id)model swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    
    // 开启 事务管理
    [self swpFMDBInTransaction:self.databaseQueue block:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 插入数据
        [SwpFMDBManager insertModel:model swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
    
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBInsertModels:swpFMDBExecutionUpdateComplete:    ( 插入 一组 数据 )
 *
 *  @ param  models
 *
 *  @ param  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBInsertModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    
    // 开启 事务管理
    [self swpFMDBInTransaction:self.databaseQueue block:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 插入 一组 数据
        [SwpFMDBManager insertModels:models swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}

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
- (void)swpFMDBUpdateModel:(id)model swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    
    // 开启 事务管理
    [self swpFMDBInTransaction:self.databaseQueue block:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 更新 单条 数据
        [SwpFMDBManager updateModel:model swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
    
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBUpdateModels:swpFMDBExecutionUpdateComplete:    ( 更新 一组 数据 )
 *
 *  @ param  models
 *
 *  @ param  swpFMDBExecutionUpdateComplete
 */
- (void)swpFMDBUpdateModels:(NSArray *)models swpFMDBExecutionUpdateComplete:(SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    // 开启 事务管理
    [self swpFMDBInTransaction:self.databaseQueue block:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 更新 一组 数据
        [SwpFMDBManager updateModels:models swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}

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
- (void)swpFMDBSelectModel:(Class)modelClass bySwpDBID:(NSString *)swpDBID swpFMDBExecutionSelectModelComplete:(SwpFMDBExecutionSelectModelComplete)swpFMDBExecutionSelectModelComplete {
    // 开启 事务管理
    [self swpFMDBInTransaction:self.databaseQueue block:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 查询 单条 数据
        [SwpFMDBManager selectModel:modelClass bySwpDBID:swpDBID swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionSelectModelComplete:swpFMDBExecutionSelectModelComplete];
    }];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBSelectModels:swpFMDBExecutionSelectModelsComplete:   ( 查询 全部 数据 )
 *
 *  @ param  modelClass
 *
 *  @ param  swpFMDBExecutionSelectModelsComplete
 */
- (void)swpFMDBSelectModels:(Class)modelClass swpFMDBExecutionSelectModelsComplete:(SwpFMDBExecutionSelectModelsComplete)swpFMDBExecutionSelectModelsComplete {
    // 开启 事务管理
    [self swpFMDBInTransaction:self.databaseQueue block:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        // 查询 一组 数据
        [SwpFMDBManager selectModels:modelClass swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionSelectModelsComplete:swpFMDBExecutionSelectModelsComplete];
    }];
}

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
- (void)swpFMDBDelegateModel:(id)model swpFMDBExecutionUpdateComplete:(nullable SwpFMDBExecutionUpdateComplete)swpFMDBExecutionUpdateComplete {
    
    [self swpFMDBInTransaction:self.databaseQueue block:^(SwpFMDB *swpFMDB, FMDatabase *dataBase, BOOL *rollback) {
        [SwpFMDBManager delegateModel:model swpFMDB:swpFMDB dataBase:dataBase isCloseDB:YES executionUpdateComplete:swpFMDBExecutionUpdateComplete];
    }];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBSelectTest: ( 测试方法 )
 */
- (void)swpFMDBSelectTest  {
    
}



@end
