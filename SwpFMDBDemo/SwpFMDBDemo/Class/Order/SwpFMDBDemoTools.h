//
//  SwpFMDBDemoTools.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/26.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

NS_ASSUME_NONNULL_BEGIN
@interface SwpFMDBDemoTools : NSObject


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDemoToolsObtainDataIndexPath:    ( 取出数据所有的索引 )
 *
 *  @param  dataSource  dataSource
 *
 *  @return NSArray
 */
+ (NSArray<NSIndexPath *> *)swpFMDBDemoToolsObtainDataIndexPath:(NSArray *)dataSource;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsExecuteInMainQueue:afterDelaySecs:  ( 主线程延时执行 )
 *
 *  @param  block   block
 *
 *  @param  sec sec
 */
+ (void)swpFMDBDemoToolsExecuteInMainQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDemoToolsShowDatabaseOperationCompletedAlert:clickSeeBlock:  ( 显示 AlertViewController )
 *
 *  @param  controller  controller
 *
 *  @param  block       block
 */
+ (void)swpFMDBDemoToolsShowDatabaseOperationCompletedAlert:(UIViewController *)controller clickSeeBlock:(void(^)(void))block;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDemoToolsShowDataIsEmptyDataAlert:   ( 显示 AlertViewController )
 *
 *  @param  controller  controller
 */
+ (void)swpFMDBDemoToolsShowDataIsEmptyDataAlert:(UIViewController *)controller;

@end
NS_ASSUME_NONNULL_END
