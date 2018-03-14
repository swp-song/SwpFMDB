//
//  UIColor+SwpColor.m
//  swp_song
//
//  Created by swp_song on 16/6/3.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UIColor+SwpColor.h"

@implementation UIColor (SwpColor)

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimal ( 使用十六进制值设置颜色 )
 */
+ (UIColor * _Nonnull (^)(NSInteger))swpColorWithHexadecimal {
    return ^(NSInteger hexadecimalValue){
        return [self.class swpColorWithHexadecimal:hexadecimalValue];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimal:    ( 使用十六进制值设置颜色 )
 *
 *  @param  hexadecimalValue    hexadecimalValue
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithHexadecimal:(NSInteger)hexadecimalValue {
    return [UIColor swpColorWithHexadecimal:hexadecimalValue alpha:1.0];
}


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimal ( 使用十六进制值设置颜色 )
 */
+ (UIColor * _Nonnull (^)(NSInteger, CGFloat))swpColorWithHexadecimalAlpha {
    return ^(NSInteger hexadecimalValue, CGFloat alpha){
        return [self.class swpColorWithHexadecimal:hexadecimalValue alpha:alpha];
    };
}


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
+ (UIColor *)swpColorWithHexadecimal:(NSInteger)hexadecimalValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hexadecimalValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexadecimalValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexadecimalValue & 0xFF)) / 255.0 alpha:alpha];
}


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimalString   ( 使用字符串设置十六进制颜色 0x Or # < Null 颜色 Clear Color > )
 */
+ (UIColor * _Nonnull (^)(NSString * _Nullable))swpColorWithHexadecimalString {
    return ^(NSString *hexadecimalStringValue) {
        return [self.class swpColorWithHexadecimalString:hexadecimalStringValue];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimalString:  ( 使用字符串设置十六进制颜色 0x Or # < Null 颜色 Clear Color > )
 *
 *  @param  hexadecimalStringValue  hexadecimalStringValue
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithHexadecimalString:(NSString * _Nullable)hexadecimalStringValue {
    return [UIColor swpColorWithHexadecimalString:hexadecimalStringValue alpha:1.0];
}


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithHexadecimalStringAlpha  ( 使用字符串设置十六进制颜色 0x Or # < Null 颜色 Clear Color > )
 */
+ (UIColor * _Nonnull (^)(NSString * _Nullable, CGFloat))swpColorWithHexadecimalStringAlpha {
    return ^(NSString *hexadecimalStringValue, CGFloat alpha) {
        return [self.class swpColorWithHexadecimalString:hexadecimalStringValue alpha:alpha];
    };
}

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
+ (UIColor *)swpColorWithHexadecimalString:(NSString * _Nullable)hexadecimalStringValue alpha:(CGFloat)alpha {
    
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


/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRGB ( 使用 R G B 色值设置颜色 )
 */
+ (UIColor * _Nonnull (^)(CGFloat, CGFloat, CGFloat))swpColorWithRGB {
    return ^(CGFloat red, CGFloat green, CGFloat blue) {
        return [self.class swpColorWithRGB:red green:green blue:blue];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRGB:green:blue: ( 使用 R G B 色值设置颜色 )
 *
 *  @param  red     red
 *
 *  @param  green   green
 *
 *  @param  blue    blue
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithRGB:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    return [UIColor swpColorWithRGB:red green:green blue:blue alpha:1.0];
}

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRGB ( 使用 R G B 色值设置颜色 )
 */
+ (UIColor * _Nonnull (^)(CGFloat, CGFloat, CGFloat, CGFloat))swpColorWithRGBA {
    return ^(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
        return [self.class swpColorWithRGB:red green:green blue:blue alpha:alpha];
    };
}

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
+ (UIColor *)swpColorWithRGB:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRandom  ( 生成一个随机色 )
 */
+ (UIColor * _Nonnull (^)(void))swpColorWithRandom {
    return ^() {
        return [self.class swpColorWithRandom_];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpColorWithRandom  ( 生成一个随机色 )
 *
 *  @return UIColor
 */
+ (UIColor *)swpColorWithRandom_ {
    return [UIColor swpColorWithRGB:arc4random_uniform(256) green:arc4random_uniform(256) blue:arc4random_uniform(256)];
}



// 注意转换出来的字符串不带＃号, 测试方法
+ (NSString*)toStrByUIColor:(UIColor *)color {
    CGFloat r, g, b, a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    NSLog(@"%i", (int)(r * 255.0f));
    NSLog(@"%i", (int)(g * 255.0f));
    NSLog(@"%i", (int)(b * 255.0f));
    int rgb = (int) (r * 255.0f) << 16 | (int)(g * 255.0f) << 8 | (int)(b * 255.0f) << 0;
    return [NSString stringWithFormat:@"%06x", rgb].uppercaseString;
}

+ (NSString*)toStrByUIColor1:(NSInteger)hexadecimalValue {
    
    NSLog(@"%ld", (long)(hexadecimalValue & 0xFF0000) >> 16);
    NSLog(@"%ld", (long)(hexadecimalValue & 0xFF00) >> 8);
    NSLog(@"%ld", (long)(hexadecimalValue & 0xFF));
    return nil;
}




@end
