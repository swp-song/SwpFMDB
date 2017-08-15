//
//  SwpFMDBBase.h
//  swp_song
//
//  Created by swp_song on 2017/7/31.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SwpFMDBDataTypes.h"

@class SwpFMDB, FMDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface SwpFMDBBase : NSObject

/**!
 *  @author swp_song
 *
 *  @brief  shareManager    ( 单利方法, 快速初始化  )
 *
 *  @return SwpFMDB
 */
+ (instancetype)shareManager;

/**!
 *  @author swp_song
 *
 *  @brief  shareManagerChain   ( 单利方法, 快速初始化 )
 */
+ (__kindof SwpFMDBBase * _Nonnull (^)())shareManagerChain;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBInTransaction:   ( 开启事务 )
 *
 *  @param  block   block
 */
- (void)swpFMDBBaseInTransaction:(void (^ _Nullable)(FMDatabase * _Nonnull dataBase, BOOL * _Nonnull rollback))block;


@end
NS_ASSUME_NONNULL_END
