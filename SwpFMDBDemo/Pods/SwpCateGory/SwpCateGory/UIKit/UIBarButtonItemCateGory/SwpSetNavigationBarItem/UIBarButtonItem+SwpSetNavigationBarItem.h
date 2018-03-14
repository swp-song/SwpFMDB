//
//  UIBarButtonItem+SwpSetNavigationBarItem.h
//  swp_song
//
//  Created by swp_song on 16/6/2.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIBarButtonItem (SwpSetNavigationBarItem)

/**
 *  @author swp_song
 *
 *  @brief  swpSetNavigationBarItemImage:setHighlightedImageName:seTtag:action:setLeftBarButtonItem:setTarget:setAction:    ( 设置 导航控制器 按钮 按钮 < 图片 > )
 *
 *  @param  normalImageName         默认 图片
 *
 *  @param  highlightedImageName    点击 图片
 *
 *  @param  tag                     tag
 *
 *  @param  leftBarButtonItem       左 / 右 侧按钮   YES -> 左
 *
 *  @param  target                  监听
 *
 *  @param  action                  监听 方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)swpSetNavigationBarItemImage:(NSString *)normalImageName setHighlightedImageName:(NSString *)highlightedImageName seTtag:(NSInteger)tag setLeftBarButtonItem:(BOOL)leftBarButtonItem setTarget:(nullable id)target setAction:(nullable SEL)action;

/**
 *  @author swp_song
 *
 *  @brief  swpSetNavigationBarItemTitle:setFontColot:setFontSize:setTag:setLeftBarButtonItem:setAarget:setAction:
 *
 *  @param  title               文字
 *
 *  @param  fontColot           文字 颜色
 *
 *  @param  fontSize            文字 大小
 *
 *  @param  tag                 tag
 *
 *  @param  leftBarButtonItem   左 / 右 侧按钮   YES -> 左
 *
 *  @param  target              监听
 *
 *  @param  action              监听 方法
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *)swpSetNavigationBarItemTitle:(NSString *)title setFontColot:(UIColor *)fontColot setFontSize:(CGFloat)fontSize setTag:(NSInteger)tag setLeftBarButtonItem:(BOOL)leftBarButtonItem setAarget:(nullable id)target setAction:(nullable SEL)action;

@end
NS_ASSUME_NONNULL_END
