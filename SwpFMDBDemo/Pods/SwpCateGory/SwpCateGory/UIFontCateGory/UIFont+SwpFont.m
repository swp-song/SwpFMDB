//
//  UIFont+SwpFont.m
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UIFont+SwpFont.h"

@implementation UIFont (SwpFont)


/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontWithName:size    ( 加载 字体 设置 字体 大小 )
 *
 *  @ param  fontName
 *
 *  @ param  fontSize
 *
 *  @ return UIFont
 */
+ (UIFont *)swpFontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    return [UIFont fontWithName:fontName size:fontSize];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontAppleSDGothicNeoThinWithFontSize:    ( 加载 系统 字体 AppleSDGothicNeo )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (UIFont *)swpFontAppleSDGothicNeoThinWithFontSize:(CGFloat)size {
    return [self swpFontWithName:@"AppleSDGothicNeo-Thin" size:size];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontAvenirWithFontSize:  ( 加载 系统 字体 Avenir )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (UIFont *)swpFontAvenirWithFontSize:(CGFloat)size {
    return [self swpFontWithName:@"Avenir" size:size];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontAvenirLightWithFontSize:  ( 加载 系统 字体 Avenir-Light )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (UIFont *)swpFontAvenirLightWithFontSize:(CGFloat)size {
    return [self swpFontWithName:@"Avenir-Light" size:size];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontHeitiSCWithFontSize:  ( 加载 系统 字体 Heiti SC )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (UIFont *)swpFontHeitiSCWithFontSize:(CGFloat)size {
    return [self swpFontWithName:@"Heiti SC" size:size];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontHelveticaNeueFontSize:  ( 加载 系统 字体 HelveticaNeue )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (UIFont *)swpFontHelveticaNeueFontSize:(CGFloat)size {
    return [self swpFontWithName:@"HelveticaNeue" size:size];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontHelveticaNeueBoldFontSize:  ( 加载 系统 字体 HelveticaNeue-Bold )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (UIFont *)swpFontHelveticaNeueBoldFontSize:(CGFloat)size {
    return [self swpFontWithName:@"HelveticaNeue-Bold" size:size];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpFontGillSansItalicFontSize:  ( 加载 系统 字体 GillSans-Italic )
 *
 *  @param  size
 *
 *  @return UIFont
 */
+ (UIFont *)swpFontGillSansItalicFontSize:(CGFloat)size {
    return [self swpFontWithName:@"GillSans-Italic" size:size];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontGetSystemFontNameList:   ( 获取 系统 字体 数组 列表 )
 *
 *  @ return NSArray
 */
+ (NSArray<NSString *> *)swpFontGetSystemFontNameList {
    return [UIFont familyNames];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontGetSystemFontDictionary  ( 获取 系统 字体 字典 列表  )
 *
 *  @ return NSDictionary<NSString *, NSArray<NSString *> *> *
 */
+ (NSDictionary<NSString *, NSArray<NSString *> *> *)swpFontGetSystemFontDictionaryList {
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    [[self swpFontGetSystemFontNameList] enumerateObjectsUsingBlock:^(NSString * _Nonnull familyName, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray<NSString *> *fontNames = [UIFont fontNamesForFamilyName:familyName];
        [dictionary setObject:fontNames forKey:familyName];
    }];
    return [NSDictionary dictionaryWithDictionary:dictionary];
}



@end
