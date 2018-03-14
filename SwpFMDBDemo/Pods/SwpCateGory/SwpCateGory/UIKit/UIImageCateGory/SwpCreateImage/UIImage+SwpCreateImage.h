//
//  UIImage+SwpCreateImage.h
//  swp_song
//
//  Created by swp_song on 2018/3/4.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (SwpCreateImage)

/**
 *  @author swp_song
 *
 *  @brief  swpCreateImageWithColor ( 创建，一张图片，根据 color )
 */
+ (UIImage * _Nonnull (^)(UIColor * _Nullable))swpCreateImageWithColor;

/**
 *  @author swp_song
 *
 *  @brief  swpCreateImageWithColor: ( 创建，一张图片，根据 color )
 *
 *  @param  color   color
 *
 *  @return UIImage
 */
+ (UIImage *)swpCreateImageWithColor:(UIColor * _Nullable)color;

/**
 *  @author swp_song
 *
 *  @brief  swpCreateImageWithColorAndFrame ( 创建，一张图片，根据 color，frame )
 */
+ (UIImage * _Nonnull (^)(UIColor * _Nullable, CGRect))swpCreateImageWithColorAndFrame;

/**
 *  @author swp_song
 *
 *  @brief  swpCreateImageWithColor:frame:  ( 创建，一张图片，根据 color，frame )
 *
 *  @param  color   color
 *
 *  @param  frame   frame
 *
 *  @return UIImage
 */
+ (UIImage *)swpCreateImageWithColor:(UIColor * _Nullable)color frame:(CGRect)frame;


@end
NS_ASSUME_NONNULL_END
