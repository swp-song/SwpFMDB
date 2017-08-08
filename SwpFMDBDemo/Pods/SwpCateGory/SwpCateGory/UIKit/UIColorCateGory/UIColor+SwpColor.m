//
//  UIColor+SwpColor.m
//  swp_song
//
//  Created by swp_song on 16/6/3.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UIColor+SwpColor.h"

@implementation UIColor (SwpColor)

/**!
 *  @ author swp_song
 *
 *  @ brief  swpColorWithHexadecimal: ( 使用 十六进制值 设置 颜色 )
 *
 *  @ param  hexadecimalValue
 *
 *  @ return UIColor
 */
+ (UIColor *)swpColorWithHexadecimal:(NSInteger)hexadecimalValue {
    return [UIColor swpColorWithHexadecimal:hexadecimalValue alpha:1.0];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpColorWithHexadecimal:alpha: ( 使用 十六进制值 设置 颜色 )
 *
 *  @ param  hexadecimalValue
 *
 *  @ param  alpha
 *
 *  @ return UIColor
 */
+ (UIColor *)swpColorWithHexadecimal:(NSInteger)hexadecimalValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hexadecimalValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexadecimalValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexadecimalValue & 0xFF)) / 255.0 alpha:alpha];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpColorWithHexadecimalString:  ( 字符串 十六进制 颜色 0x or # < null 颜色 clearColor > )
 *
 *  @ param  hexadecimalValue
 *
 *  @ return UIColor
 */
+ (UIColor *)swpColorWithHexadecimalString:(NSString *)hexadecimalStringValue {
    return [UIColor swpColorWithHexadecimalString:hexadecimalStringValue alpha:1.0];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpColorWithHexadecimalString:alpha:    ( 字符串 十六进制 颜色 0x or # < null 颜色 clearColor > )
 *
 *  @ param  hexadecimalStringValue
 *
 *  @ param  alpha
 *
 *  @ return UIColor
 */
+ (UIColor *)swpColorWithHexadecimalString:(NSString *)hexadecimalStringValue alpha:(CGFloat)alpha {
    
    NSString *cString = [[hexadecimalStringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6)  return [UIColor clearColor];
    
    // strip "0X" or "#" if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])  cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location    = 0;
    range.length      = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location    = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location    = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [self swpColorWithRGB:(float)r green:(float)g blue:(float)b alpha:alpha];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpColorWithRGB:green:blue: ( 使用 R G B 色值 设置 颜色  )
 *
 *  @ param  red
 *
 *  @ param  green
 *
 *  @ param  blue
 *
 *  @ return UIColor
 */
+ (UIColor *)swpColorWithRGB:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor swpColorWithRGB:red green:green blue:blue alpha:1.0];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpColorWithRGB:green:blue:alpha:   ( 使用 R G B 色值 设置 颜色 )
 *
 *  @ param  red
 *
 *  @ param  green
 *
 *  @ param  blue
 *
 *  @ param  alpha
 *
 *  @ return UIColor
 */
+ (UIColor *)swpColorWithRGB:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpColorWithRandom  ( 生成一个 随机色 )
 *
 *  @ return UIColor
 */
+ (UIColor *)swpColorWithRandom {
    return [UIColor swpColorWithRGB:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
}





@end
