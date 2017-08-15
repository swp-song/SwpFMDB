//
//  SwpFMDBDemoTools.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/26.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBDemoTools.h"

@import UIKit;

@implementation SwpFMDBDemoTools

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDemoToolsObtainDataIndexPath:    ( 取出数据所有的索引 )
 *
 *  @param  dataSource  dataSource
 *
 *  @return NSArray
 */
+ (NSArray<NSIndexPath *> *)swpFMDBDemoToolsObtainDataIndexPath:(NSArray *)dataSource {
    NSMutableArray<NSIndexPath *> *indexPaths = [NSMutableArray array];
    [dataSource enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [indexPaths addObject:[NSIndexPath indexPathForItem:idx inSection:0]];
    }];
    return [NSArray arrayWithArray:indexPaths];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsExecuteInMainQueue:afterDelaySecs:  ( 主线程延时执行 )
 *
 *  @param  block   block
 *
 *  @param  sec sec
 */
+ (void)swpFMDBDemoToolsExecuteInMainQueue:(dispatch_block_t)block afterDelaySecs:(NSTimeInterval)sec  {
    NSParameterAssert(block);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sec * NSEC_PER_SEC)), dispatch_get_main_queue(), block);
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDemoToolsShowDatabaseOperationCompletedAlert:clickSeeBlock:  ( 显示 AlertViewController)
 *
 *  @param  controller  controller
 *
 *  @param  block       block
 */
+ (void)swpFMDBDemoToolsShowDatabaseOperationCompletedAlert:(UIViewController *)controller clickSeeBlock:(void(^)())block {
    [[self class] swpFMDBDemoToolsShowAlertViewController:controller alertControllerWithTitle:@"数据库操作完毕" message:@"是否查看数据 ? " isShowSeeButton:YES clickSeeBlock:block];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDemoToolsShowDataIsEmptyDataAlert:   ( 显示 AlertViewController )
 *
 *  @param  controller  controller
 */
+ (void)swpFMDBDemoToolsShowDataIsEmptyDataAlert:(UIViewController *)controller  {
    [[self class] swpFMDBDemoToolsShowAlertViewController:controller alertControllerWithTitle:@"数据为空" message:nil isShowSeeButton:NO clickSeeBlock:nil];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDemoToolsShowAlertViewController:alertControllerWithTitle:message:isShowSeeButton:clickSeeBlock: ( 显示 AlertViewController)
 *
 *  @param  controller      controller
 *
 *  @param  title           title
 *
 *  @param  message         message
 *
 *  @param  isShowSeeButton isShowSeeButton
 *
 *  @param  block           block
 */
+ (void)swpFMDBDemoToolsShowAlertViewController:(UIViewController *)controller alertControllerWithTitle:(NSString *)title message:(NSString *)message isShowSeeButton:(BOOL)isShowSeeButton clickSeeBlock:(void(^)())block {
    
     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction      *see             = [UIAlertAction actionWithTitle:@"查看" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (block) block();
    }];
    
    UIAlertAction      *cancel          = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    if (isShowSeeButton) [alertController addAction:see];
    [alertController addAction:cancel];
    
    [controller presentViewController:alertController animated:YES completion:nil];
    
    
}

@end
