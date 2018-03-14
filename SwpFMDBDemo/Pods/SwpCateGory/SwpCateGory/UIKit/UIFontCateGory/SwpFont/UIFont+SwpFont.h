//
//  UIFont+SwpFont.h
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIFont (SwpFont)

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
+ (nullable UIFont *)swpFontWithName:(NSString *)fontName size:(CGFloat)fontSize;

/**
 *  @author swp_song
 *
 *  @brief  swpFontAppleSDGothicNeoThinWithFontSize:    ( 加载 AppleSDGothicNeo 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (nullable UIFont *)swpFontAppleSDGothicNeoThinWithFontSize:(CGFloat)size;

/**
 *  @author swp_song
 *
 *  @brief  swpFontAvenirWithFontSize:  ( 加载系统 Avenir 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (nullable UIFont *)swpFontAvenirWithFontSize:(CGFloat)size;

/**
 *  @author swp_song
 *
 *  @brief  swpFontAvenirLightWithFontSize: ( 加载 Avenir-Light 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (nullable UIFont *)swpFontAvenirLightWithFontSize:(CGFloat)size;

/**
 *  @author swp_song
 *
 *  @brief  swpFontHeitiSCWithFontSize: ( 加载 Heiti SC 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (nullable UIFont *)swpFontHeitiSCWithFontSize:(CGFloat)size;

/**
 *  @author swp_song
 *
 *  @brief  swpFontHelveticaNeueFontSize:   ( 加载 HelveticaNeue 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (nullable UIFont *)swpFontHelveticaNeueFontSize:(CGFloat)size;

/**
 *  @author swp_song
 *
 *  @brief  swpFontHelveticaNeueBoldFontSize:  ( 加载 HelveticaNeue-Bold 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (nullable UIFont *)swpFontHelveticaNeueBoldFontSize:(CGFloat)size;

/**
 *  @author swp_song
 *
 *  @brief  swpFontGillSansItalicFontSize:  ( 加载 GillSans-Italic 字体  )
 *
 *  @param  size    size
 *
 *  @return UIFont
 */
+ (nullable UIFont *)swpFontGillSansItalicFontSize:(CGFloat)size;

/**
 *  @author swp_song
 *
 *  @brief  swpFontGetSystemFontNameList:   ( 获取系统全部字体 )
 *
 *  @return NSArray
 */
+ (NSArray<NSString *> *)swpFontGetSystemFontNameList;

/**
 *  @author swp_song
 *
 *  @brief  swpFontGetSystemFontDictionary  ( 获取系统全部字体，字典 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary<NSString *, NSArray<NSString *> *> *)swpFontGetSystemFontDictionaryList;

@end
NS_ASSUME_NONNULL_END
