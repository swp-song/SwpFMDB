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

#pragma mark - SwpQrCodeImage Public Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageWithString:   ( 生成 二维码 )
 *
 *  @ param  string
 *
 *  @ param  width
 *
 *  @ return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string size:(CGFloat)width;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageWithString:setSize:setColor:  ( 生成 二维码, 颜色 )
 *
 *  @ param  string
 *
 *  @ param  width
 *
 *  @ param  color
 *
 *  @ return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string size:(CGFloat)width color:(UIColor *)color;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageWithString:size:icon:iconWidth  ( 生成 二维码, 默认颜色 < 黑色 >, 中间填充图片 )
 *
 *  @ param  string
 *
 *  @ param  width
 *
 *  @ param  icon
 *
 *  @ param  iconWidth
 *
 *  @ return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string size:(CGFloat)width icon:(UIImage *)icon iconWidth:(CGFloat)iconWidth;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageWithString:size:color:icon:iconWidth  ( 生成 二维码, 颜色, 中间填充图片 )
 *
 *  @ param  string
 *
 *  @ param  width
 *
 *  @ param  color
 *
 *  @ param  icon
 *
 *  @ param  iconWidth
 *
 *  @ return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string size:(CGFloat)width color:(UIColor *)color icon:(UIImage *)icon iconWidth:(CGFloat)iconWidth;


@end
NS_ASSUME_NONNULL_END
