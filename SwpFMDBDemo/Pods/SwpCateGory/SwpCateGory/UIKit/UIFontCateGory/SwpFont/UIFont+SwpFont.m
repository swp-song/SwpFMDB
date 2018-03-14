//
//  UIFont+SwpFont.m
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UIFont+SwpFont.h"

@implementation UIFont (SwpFont)


/**
 *  @author swp_song
 *
 *  @brief  swpFontWithName:size：   ( 加载字体设置字体大小 )
 *
 *  @param  fontName    fontName
 *
 *  @param  fontSize    fontSize
 *
 *  @return UIFont
 */
+ (UIFont *)swpFontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    return [UIFont fontWithName:fontName size:fontSize];
}


/**
 *  @author swp_song
 *
 *  @brief  swpFontAvenirWithFontSize:  ( 加载系统 Avenir 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (UIFont *)swpFontAppleSDGothicNeoThinWithFontSize:(CGFloat)size {
    return [self swpFontWithName:@"AppleSDGothicNeo-Thin" size:size];
}

/**
 *  @author swp_song
 *
 *  @brief  swpFontAvenirLightWithFontSize: ( 加载 Avenir-Light 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (UIFont *)swpFontAvenirWithFontSize:(CGFloat)size {
    return [self swpFontWithName:@"Avenir" size:size];
}

/**
 *  @author swp_song
 *
 *  @brief  swpFontHeitiSCWithFontSize: ( 加载 Heiti SC 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (UIFont *)swpFontAvenirLightWithFontSize:(CGFloat)size {
    return [self swpFontWithName:@"Avenir-Light" size:size];
}

/**
 *  @author swp_song
 *
 *  @brief  swpFontHelveticaNeueFontSize:   ( 加载 HelveticaNeue 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (UIFont *)swpFontHeitiSCWithFontSize:(CGFloat)size {
    return [self swpFontWithName:@"Heiti SC" size:size];
}

/**
 *  @author swp_song
 *
 *  @brief  swpFontHelveticaNeueBoldFontSize:  ( 加载 HelveticaNeue-Bold 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (UIFont *)swpFontHelveticaNeueFontSize:(CGFloat)size {
    return [self swpFontWithName:@"HelveticaNeue" size:size];
}

/**
 *  @author swp_song
 *
 *  @brief  swpFontGillSansItalicFontSize:  ( 加载 GillSans-Italic 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */+ (UIFont *)swpFontHelveticaNeueBoldFontSize:(CGFloat)size {
    return [self swpFontWithName:@"HelveticaNeue-Bold" size:size];
}

/**
 *  @author swp_song
 *
 *  @brief  swpFontGillSansItalicFontSize:  ( 加载 GillSans-Italic 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (UIFont *)swpFontGillSansItalicFontSize:(CGFloat)size {
    return [self swpFontWithName:@"GillSans-Italic" size:size];
}

/**
 *  @author swp_song
 *
 *  @brief  swpFontGetSystemFontNameList:   ( 获取系统全部字体 )
 *
 *  @return NSArray
 */
+ (NSArray<NSString *> *)swpFontGetSystemFontNameList {
    return [UIFont familyNames];
}

/**
 *  @author swp_song
 *
 *  @brief  swpFontGetSystemFontDictionary  ( 获取系统全部字体，字典 )
 *
 *  @return NSDictionary
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
