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
 *  @ author swp_song
 *
 *  @ brief  swpFMDBDemoToolsObtainDataIndexPath:   ( 取出 数据 所有 的索引 )
 *
 *  @ param  dataSource
 *
 *  @ return NSArray<NSIndexPath *> *
 */
+ (NSArray<NSIndexPath *> *)swpFMDBDemoToolsObtainDataIndexPath:(NSArray *)dataSource;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsExecuteInMainQueue:afterDelaySecs: ( 主线程 延时 执行 )
 *
 *  @ param  block
 *
 *  @ param  sec
 */
+ (void)swpFMDBDemoToolsExecuteInMainQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBDemoToolsShowDatabaseOperationCompletedAlert:clickSeeBlock:    ( 显示 AlertViewController)
 *
 *  @ param  controller
 *
 *  @ param  block
 */
+ (void)swpFMDBDemoToolsShowDatabaseOperationCompletedAlert:(UIViewController *)controller clickSeeBlock:(void(^)())block;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBDemoToolsShowDataIsEmptyDataAlert:  ( 显示 AlertViewController)
 *
 *  @ param  controller
 */
+ (void)swpFMDBDemoToolsShowDataIsEmptyDataAlert:(UIViewController *)controller;

@end
NS_ASSUME_NONNULL_END
