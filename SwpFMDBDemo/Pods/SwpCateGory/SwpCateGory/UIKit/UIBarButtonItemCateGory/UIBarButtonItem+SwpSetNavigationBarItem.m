//
//  UIBarButtonItem+SwpSetNavigationBarItem.m
//  swp_song
//
//  Created by swp_song on 16/6/2.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UIBarButtonItem+SwpSetNavigationBarItem.h"

@implementation UIBarButtonItem (SwpSetNavigationBarItem)

/**!
 *  @author swp_song
 *
 *  @ brief  swpSetNavigationBarItemImage:setHighlightedImageName:seTtag:action:setLeftBarButtonItem:setTarget:setAction:    ( 设置 导航控制器 按钮 按钮 < 图片 > )
 *
 *  @ param  normalImageName             默认 图片
 *
 *  @ param  highlightedImageName        点击 图片
 *
 *  @ param  tag                         tag
 *
 *  @ param  leftBarButtonItem           左 / 右 侧按钮   YES -> 左
 *
 *  @ param  target                      监听
 *
 *  @ param  action                      监听 方法
 *
 *  @ return UIBarButtonItem
 */
+ (UIBarButtonItem *)swpSetNavigationBarItemImage:(NSString *)normalImageName setHighlightedImageName:(NSString *)highlightedImageName seTtag:(NSInteger)tag setLeftBarButtonItem:(BOOL)leftBarButtonItem setTarget:(id)target setAction:(SEL)action {
    
    UIButton *button                  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag                        = tag;
    button.frame                      = CGRectMake(0, 0, 30, 30);
    button.contentHorizontalAlignment = leftBarButtonItem ? UIControlContentHorizontalAlignmentLeft : UIControlContentHorizontalAlignmentRight;
    [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}


/**!
 *  @author swp_song
 *
 *  @ brief  swpSetNavigationBarItemTitle:setFontColot:setFontSize:setTag:setLeftBarButtonItem:setAarget:setAction:
 *
 *  @ param  title                       文字
 *
 *  @ param  fontColot                   文字 颜色
 *
 *  @ param  fontSize                    文字 大小
 *
 *  @ param  tag                         tag
 *
 *  @ param  leftBarButtonItem           左 / 右 侧按钮   YES -> 左
 *
 *  @ param  target                      监听
 *
 *  @ param  action                      监听 方法
 *
 *  @ return UIBarButtonItem
 */
+ (UIBarButtonItem *)swpSetNavigationBarItemTitle:(NSString *)title setFontColot:(UIColor *)fontColot setFontSize:(CGFloat)fontSize setTag:(NSInteger)tag setLeftBarButtonItem:(BOOL)leftBarButtonItem setAarget:(id)target setAction:(SEL)action {
    
    UIButton *button                  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag                        = tag;
    button.frame                      = CGRectMake(0, 0, 44, 30);
    button.titleLabel.font            = [UIFont systemFontOfSize:fontSize];
    button.contentHorizontalAlignment = leftBarButtonItem ? UIControlContentHorizontalAlignmentLeft : UIControlContentHorizontalAlignmentRight;
    [button setTitleColor:fontColot forState:UIControlStateNormal];
    [button setTitleColor:fontColot forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
