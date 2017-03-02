//
//  UIImage+SwpBarCodeImage.h
//  Demo
//
//  Created by swp_song on 16/8/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (SwpBarCodeImage)

#pragma mark - SwpBarCode Public Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpBarCodeImageCreateWithString:size:   ( 生成 二维码 条形码, 默认 黑白色 )
 *
 *  @ param  string
 *
 *  @ param  size
 *
 *  @ return UIImage
 */
+ (UIImage *)swpBarCodeImageCreateWithString:(NSString *)string size:(CGSize)size;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpBarCodeImageCreateWithString:size:barCodeColor:backGroundColor:  ( 生成 二维码 条形码, 设置 颜色 )
 *
 *  @ param  string
 *
 *  @ param  size
 *
 *  @ param  barCodeColor
 *
 *  @ param  backGroundColor
 *
 *  @ return UIImage
 */
+ (UIImage *)swpBarCodeImageCreateWithString:(NSString *)string size:(CGSize)size barCodeColor:(nullable UIColor *)barCodeColor backGroundColor:(nullable UIColor *)backGroundColor;

@end
NS_ASSUME_NONNULL_END
