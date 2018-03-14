//
//  UIColor+SwpColor.h
//  swp_song
//
//  Created by swp_song on 16/6/3.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SwpColor)


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimal ( 使用十六进制值设置颜色 )
 */
+ (UIColor * _Nonnull (^)(NSInteger))swpColorWithHexadecimal;

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimal:    ( 使用十六进制值设置颜色 )
 *
 *  @param  hexadecimalValue    hexadecimalValue
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithHexadecimal:(NSInteger)hexadecimalValue;


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimal ( 使用十六进制值设置颜色 )
 */
+ (UIColor * _Nonnull (^)(NSInteger, CGFloat))swpColorWithHexadecimalAlpha;

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimal:alpha:  ( 使用十六进制值设置颜色 )
 *
 *  @param  hexadecimalValue    hexadecimalValue
 *
 *  @param  alpha               alpha
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithHexadecimal:(NSInteger)hexadecimalValue alpha:(CGFloat)alpha;

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimalString   ( 使用字符串设置十六进制颜色 0x Or # < Null 颜色 Clear Color > )
 */
+ (UIColor * _Nonnull (^)(NSString * _Nullable))swpColorWithHexadecimalString;

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimalString:  ( 使用字符串设置十六进制颜色 0x Or # < Null 颜色 Clear Color > )
 *
 *  @param  hexadecimalStringValue  hexadecimalStringValue
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithHexadecimalString:(NSString * _Nullable)hexadecimalStringValue;


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimalStringAlpha  ( 使用字符串设置十六进制颜色 0x Or # < Null 颜色 Clear Color > )
 */
+ (UIColor * _Nonnull (^)(NSString * _Nullable, CGFloat))swpColorWithHexadecimalStringAlpha;


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimalString:alpha:    ( 使用字符串设置十六进制颜色 0x Or # < Null 颜色 Clear Color >  )
 *
 *  @param  hexadecimalStringValue  hexadecimalStringValue
 *
 *  @param  alpha                   alpha
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithHexadecimalString:(NSString * _Nullable)hexadecimalStringValue alpha:(CGFloat)alpha;


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRGB ( 使用 R G B 色值设置颜色 )
 */
+ (UIColor * _Nonnull (^)(CGFloat, CGFloat, CGFloat))swpColorWithRGB;

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRGB:green:blue: ( 使用 R G B 色值设置颜色  )
 *
 *  @param  red     red
 *
 *  @param  green   green
 *
 *  @param  blue    blue
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithRGB:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRGB ( 使用 R G B 色值设置颜色 )
 */
+ (UIColor * _Nonnull (^)(CGFloat, CGFloat, CGFloat, CGFloat))swpColorWithRGBA;

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRGB:green:blue:alpha:   ( 使用 R G B 色值设置颜色 )
 *
 *  @param  red     red
 *
 *  @param  green   green
 *
 *  @param  blue    blue
 *
 *  @param  alpha   alpha
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithRGB:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRandom  ( 生成一个随机色 )
 */
+ (UIColor * _Nonnull (^)(void))swpColorWithRandom;

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRandom_ ( 生成一个随机色 )
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithRandom_;

// 注意转换出来的字符串不带＃号
+ (NSString*)toStrByUIColor:(UIColor *)color;

+ (NSString*)toStrByUIColor1:(NSInteger)hexadecimalValue;



@end
NS_ASSUME_NONNULL_END
