//
//  SwpFMDBBase.m
//  swp_song
//
//  Created by swp_song on 2017/7/31.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBBase.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "FMDB.h"                        //  FMDB
#import "SwpFMDBTools.h"                //  Tools
/*! ---------------------- Tool       ---------------------- !*/
@interface SwpFMDBBase ()

/*! 数据库 操作 !*/
@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;

@end

@implementation SwpFMDBBase

static id _swpFMDBBase;

#pragma mark - Override Methods
/**
 *  @author swp_song
 *
 *  @brief  allocWithZone:  ( Override  allocWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _swpFMDBBase = [super allocWithZone:zone];
    });
    return _swpFMDBBase;
}

/**
 *  @author swp_song
 *
 *  @brief  copyWithZone:   ( Override  copyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
- (id)copyWithZone:(NSZone *)zone {
    return  _swpFMDBBase;
}


/**
 *  @author swp_song
 *
 *  @brief  copyWithZone:   ( Override  copyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
+ (id)copyWithZone:(struct _NSZone *)zone {
    return  _swpFMDBBase;
}

/**
 *  @author swp_song
 *
 *  @brief  mutableCopyWithZone:    ( Override  mutableCopyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return _swpFMDBBase;
}

/**
 *  @author swp_song
 *
 *  @brief  mutableCopyWithZone:    ( Override  mutableCopyWithZone )
 *
 *  @param  zone    zone
 *
 *  @return id
 */
- (id)mutableCopyWithZone:(NSZone *)zone {
    return _swpFMDBBase;
}

/**
 *  @author swp_song
 *
 *  @brief  init    ( Override init )
 *
 *  @return id
 */
- (instancetype)init {
    
    if (self = [super init]) {
        self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:[SwpFMDBTools swpFMDBToolsGetSqlFilePath]];
    }
    return self;
}


#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  shareManager   ( 单利方法, 快速初始化 )
 *
 *  @return SwpFMDB
 */
+ (instancetype)shareManager {
    return [self new];
}


/**
 *  @author swp_song
 *
 *  @brief  shareManagerChain   ( 单利方法, 快速初始化 )
 */
+ (__kindof SwpFMDBBase * _Nonnull (^)(void))shareManagerChain {
    
    return ^() {
        return [self.class shareManager];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpFMDBInTransaction:   ( 开启事务 )
 *
 *  @param  block   block
 */
- (void)swpFMDBBaseInTransaction:(void (^)(FMDatabase * _Nonnull dataBase, BOOL * _Nonnull rollback))block {
    // 开启事务
    [self.databaseQueue inTransaction:^(FMDatabase *dataBase, BOOL *rollback) {
        
        if (block) block (dataBase, rollback);
        if (!rollback) {
            * rollback = YES;
            return;
        }
    }];
    
}

@end

