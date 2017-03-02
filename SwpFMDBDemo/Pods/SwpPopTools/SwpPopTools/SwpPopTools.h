//
//  SwpPopTools.h
//  swp_song
//
//  Created by swp_song on 2017/1/19.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIView;

NS_ASSUME_NONNULL_BEGIN

@interface SwpPopTools : NSObject

/**!
 *  @ author swp_song
 *
 *  @ brief  shareInstance ( 单利 )
 
 *  @ return SwpPopTools
 */
+ (instancetype)sharedInstance;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPopToolsView:animatedCompletion:( 将一个 view 动画 添加 到 Window 上 )
 *
 *  @ param  view
 *
 *  @ param  animated
 */
+ (void)swpPopToolsView:(UIView *)view animated:(BOOL)animated;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPopToolsView:animated:animatedCompletion:   ( 将一个 view 动画 添加 到 Window 上 )
 *
 *  @ param  view
 *
 *  @ param  animated
 *
 *  @ param  animatedCompletion
 */
+ (void)swpPopToolsView:(UIView *)view animated:(BOOL)animated animatedCompletion:(nullable void(^)())animatedCompletion;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPopToolsViewCloseAnimated:  ( 关闭 一个 view )
 *
 *  @ param  animated
 */
+ (void)swpPopToolsViewCloseAnimated:(BOOL)animated;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPopToolsViewCloseAnimated:animatedCompletion:   ( 关闭 一个 view )
 *
 *  @ param  animated
 *
 *  @ param  animatedCompletion
 */
+ (void)swpPopToolsViewCloseAnimated:(BOOL)animated animatedCompletion:(nullable void(^)())animatedCompletion;

@end
NS_ASSUME_NONNULL_END
