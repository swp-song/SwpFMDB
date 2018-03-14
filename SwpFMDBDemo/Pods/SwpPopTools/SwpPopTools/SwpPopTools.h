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

/**
 *  @author swp_song
 *
 *  @brief  shareInstance ( 单利 )
 
 *  @return SwpPopTools
 */
+ (instancetype)sharedInstance;

/**
 *  @author swp_song
 *
 *  @brief  swpPopToolsView:animatedCompletion: ( 使用动画显示 pop view )
 *
 *  @param  view        view
 *
 *  @param  animated    animated
 */
+ (void)swpPopToolsView:(UIView *)view animated:(BOOL)animated;

/**
 *  @author swp_song
 *
 *  @brief  swpPopToolsView:animated:animatedCompletion:    ( SwpPopTools，显示 )
 *
 *  @param  view                view
 *
 *  @param  animated            animated
 *
 *  @param  animatedCompletion  animatedCompletion
 */
+ (void)swpPopToolsView:(UIView *)view animated:(BOOL)animated animatedCompletion:(void(^ _Nullable)(void))animatedCompletion;

/**
 *  @author swp_song
 *
 *  @brief  swpPopToolsViewCloseAnimated:   ( SwpPopTools，关闭 )
 *
 *  @param  animated    animated
 */
+ (void)swpPopToolsViewCloseAnimated:(BOOL)animated;

/**
 *  @author swp_song
 *
 *  @brief  swpPopToolsViewCloseAnimated:animatedCompletion:    ( SwpPopTools，关闭 )
 *
 *  @param  animated            animated
 *
 *  @param  animatedCompletion  animatedCompletion
 */
+ (void)swpPopToolsViewCloseAnimated:(BOOL)animated animatedCompletion:(void(^ _Nullable)(void))animatedCompletion;

@end
NS_ASSUME_NONNULL_END
