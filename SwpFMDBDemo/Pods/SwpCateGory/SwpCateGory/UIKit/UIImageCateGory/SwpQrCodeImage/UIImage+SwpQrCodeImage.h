//
//  UIImage+SwpQrCodeImage.h
//  swp_song
//
//  Created by swp_song on 16/8/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SwpQrCodeImage)

/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageWithString:clarity:   ( 生成二维码， 设置清晰度 )
 *
 *  @param  string  string
 *
 *  @param  clarity clarity
 *
 *  @return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string clarity:(CGFloat)clarity;

/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageWithString:setSize:color: ( 生成二维码, 设置清晰度，二维码颜色 )
 *
 *  @param  string  string
 *
 *  @param  clarity clarity
 *
 *  @param  color   color
 *
 *  @return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string clarity:(CGFloat)clarity color:(UIColor *)color;


/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageWithString:clarity:icon:iconWidth:    ( 生成二维码, 设置清晰度, 默认黑色, 中间填充图片 )
 *
 *  @param  string      string
 *
 *  @param  clarity     clarity
 *
 *  @param  icon        icon
 *
 *  @param  iconWidth   iconWidth
 *
 *  @return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string clarity:(CGFloat)clarity icon:(UIImage *)icon iconWidth:(CGFloat)iconWidth;

/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageWithString:clarity:color:icon:iconWidth:  ( 生成二维码, 设置清晰度, 二维码颜色, 中间填充图片 )
 *
 *  @param  string      string
 *
 *  @param  clarity     clarity
 *
 *  @param  color       color
 *
 *  @param  icon        icon
 *
 *  @param  iconWidth   iconWidth
 *
 *  @return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string clarity:(CGFloat)clarity color:(UIColor *)color icon:(UIImage *)icon iconWidth:(CGFloat)iconWidth;


@end
NS_ASSUME_NONNULL_END
