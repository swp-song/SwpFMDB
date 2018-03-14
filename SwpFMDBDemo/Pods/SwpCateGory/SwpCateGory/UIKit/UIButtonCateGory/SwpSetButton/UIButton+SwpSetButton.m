//
//  UIButton+SwpSetButton.m
//  swp_song
//
//  Created by swp_song on 16/6/2.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UIButton+SwpSetButton.h"

@implementation UIButton (SwpSetButton)

/**
 *  @author swp_song
 *
 *  @brief  swpSetButtonTextStyle:setTitle:setFontSize:setFontColor:setTag:setTarget:setAction: ( 设置文字按钮基本属性 )
 *
 *  @param  button              button
 *
 *  @param  title               文字
 *
 *  @param  fontSize            文字 大小
 *
 *  @param  fontColor           文字 颜色
 *
 *  @param  tag                 tag
 *
 *  @param  target              监听
 *
 *  @param  action              监听 方法
 */
+ (void)swpSetButtonTextStyle:(UIButton *)button setTitle:(NSString *)title setFontSize:(CGFloat)fontSize setFontColor:(UIColor *)fontColor setTag:(NSInteger)tag setTarget:(id)target setAction:(SEL)action {
    button.tag             = tag;
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:fontColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}


/**
 *  @author swp_song
 *
 *  @brief  swpSetButtonSubmitStyle:setBackgroundColor:setFontColor:setTitle:setFontSize:setCornerRadius:setTag:setTarget:setAction:    ( 设置为提交按钮 )
 *
 *  @param  button              button
 *
 *  @param  backgroundColor     背景 颜色
 *
 *  @param  fontColor           文字 颜色
 *
 *  @param  title               文字
 *
 *  @param  fontSize            文字 大小
 *
 *  @param  cornerRadius        圆角
 *
 *  @param  tag                 tag
 *
 *  @param  target              监听
 *
 *  @param  action              监听方法
 */
+ (void)swpSetButtonSubmitStyle:(UIButton *)button setBackgroundColor:(UIColor *)backgroundColor setFontColor:(UIColor *)fontColor setTitle:(NSString *)title setFontSize:(CGFloat)fontSize setCornerRadius:(CGFloat)cornerRadius setTag:(NSInteger)tag setTarget:(id)target setAction:(SEL)action {
    
    button.layer.cornerRadius  = cornerRadius;
    button.layer.masksToBounds = YES;
    button.tag                 = tag;
    button.backgroundColor     = backgroundColor;
    button.titleLabel.font     = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:fontColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}


/**
 *  @author swp_song
 *
 *  @brief  swpSetButtonCheckBoxStyle:setTitle:setFontSize:setTitleColor:setNormalImageName:setSelectedImage:setTag:setTarget:setAction:    ( 设置 按钮 为 单选按钮 样式 )
 *
 *  @param  button              button
 *
 *  @param  title               文字
 *
 *  @param  fontSize            字体 大小
 *
 *  @param  titleColor          字体 颜色
 *
 *  @param  normalImageName     默认 图片
 *
 *  @param  selectedImagName    选中 图片
 *
 *  @param  tag                 tag
 *
 *  @param  target              监听
 *
 *  @param  action              监听方法
 */
+ (void)swpSetButtonCheckBoxStyle:(UIButton *)button setTitle:(NSString *)title setFontSize:(CGFloat)fontSize setTitleColor:(UIColor *)titleColor setNormalImageName:(NSString *)normalImageName setSelectedImage:(NSString *)selectedImagName setTag:(NSInteger)tag setTarget:(id)target setAction:(SEL)action {
    button.tag                        = tag;
    button.titleLabel.font            = [UIFont systemFontOfSize:fontSize];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.titleEdgeInsets            = UIEdgeInsetsMake(1, 5, 0, 0);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImagName] forState:UIControlStateSelected];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}


/**
 *  @author swp_song
 *
 *  @brief  swpSetNavigationButtonWithImage:setHighlightedImageName:setTag:setLeftButton:setTarget:setAction:   ( 设置 导航控制器 按钮 < 图片 >  )
 *
 *  @param  normalImageName         默认 图片
 *
 *  @param  highlightedImageName    点击 图片
 *
 *  @param  tag                     tag
 *
 *  @param  leftBarButton           左 / 右 侧按钮   YES -> 左
 *
 *  @param  target                  监听
 *
 *  @param  action                  监听 方法
 *
 *  @return UIButton
 */
+ (UIButton *)swpSetNavigationButtonWithImage:(NSString *)normalImageName setHighlightedImageName:(NSString *)highlightedImageName setTag:(NSInteger)tag setLeftButton:(BOOL)leftBarButton setTarget:(id)target setAction:(SEL)action {
    UIButton *button                  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag                        = tag;
    button.frame                      = CGRectMake(0, 0, 44, 30);
    button.contentHorizontalAlignment = leftBarButton ? UIControlContentHorizontalAlignmentLeft : UIControlContentHorizontalAlignmentRight;
    [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


/**
 *  @author swp_song
 *
 *  @brief  swpSetNavigationButtonWithTitle:setFontColot:setFontSize:setTag:setLeftButton:setTarget:setAction:  ( 设置 导航控制器 按钮 < 文字 > )
 *
 *  @param  title           文字
 *
 *  @param  fontColot       字体 颜色
 *
 *  @param  fontSize        字体 大小
 *
 *  @param  tag             tag
 *
 *  @param  leftBarButton   左 / 右 侧按钮   YES -> 左
 *
 *  @param  target          监听
 *
 *  @param  action          监听 方法
 *
 *  @return UIButton
 */
+ (UIButton *)swpSetNavigationButtonWithTitle:(NSString *)title setFontColot:(UIColor *)fontColot setFontSize:(CGFloat)fontSize setTag:(NSInteger)tag setLeftButton:(BOOL)leftBarButton setTarget:(id)target setAction:(SEL)action {
    
    UIButton *button                  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame                      = CGRectMake(0, 0, 44, 30);
    button.tag                        = tag;
    button.titleLabel.font            = [UIFont systemFontOfSize:fontSize];
    button.contentHorizontalAlignment = leftBarButton ? UIControlContentHorizontalAlignmentLeft : UIControlContentHorizontalAlignmentRight;
    [button setTitleColor:fontColot forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
