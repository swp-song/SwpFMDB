//
//  UINavigationBar+SwpNavigationBar.h
//  swp_song
//
//  Created by swp_song on 2017/8/9.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UINavigationBar (SwpNavigationBar)

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetBackgroundColorChain  ( Set NavigationBar BackgroundColor )
 */
- (__kindof UINavigationBar * _Nonnull (^)(UIColor * _Nonnull))swpNavigationBarSetBackgroundColorChain;

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetBackgroundColor: ( Set NavigationBar BackgroundColor )
 *
 *  @param  backgroundColor backgroundColor
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarSetBackgroundColor:(UIColor *)backgroundColor;

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetTranslationYChain    ( Set NavigationBar TranslationY )
 */
- (__kindof UINavigationBar * _Nonnull (^)(CGFloat))swpNavigationBarSetTranslationYChain;

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarTranslationY:   ( Set NavigationBar TranslationY )
 *
 *  @param  translationY    translationY
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarSetTranslationY:(CGFloat)translationY;


/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetAlphaChain   ( Set NavigationBar Alpha )
 */
- (__kindof UINavigationBar * _Nonnull (^)(CGFloat))swpNavigationBarSetAlphaChain;

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetAlpha:   ( Set NavigationBar Alpha )
 *
 *  @param  alpha   alpha
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarSetAlpha:(CGFloat)alpha;


/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetBottomLineViewHiddenChain    ( Set NavigationBar Bottom LineView Hidden  )
 */
- (__kindof UINavigationBar * _Nonnull (^)(BOOL))swpNavigationBarSetBottomLineViewHiddenChain;

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetBottomLineViewHidden:    ( Set NavigationBar Bottom LineView Hidden  )
 *
 *  @param  hidden  hidden
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarSetBottomLineViewHidden:(BOOL)hidden;

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarResetChain  ( Reset )
 */
- (__kindof UINavigationBar * _Nonnull (^)(void))swpNavigationBarResetChain;

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarReset   ( Reset )
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarReset;




@end
NS_ASSUME_NONNULL_END
