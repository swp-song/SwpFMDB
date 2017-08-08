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
+ (nullable UIFont *)swpFontWithName:(NSString *)fontName size:(CGFloat)fontSize;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontAppleSDGothicNeoThinWithFontSize:    ( 加载 系统 字体 AppleSDGothicNeo )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (nullable UIFont *)swpFontAppleSDGothicNeoThinWithFontSize:(CGFloat)size;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontAvenirWithFontSize:  ( 加载 系统 字体 Avenir )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (nullable UIFont *)swpFontAvenirWithFontSize:(CGFloat)size;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontAvenirLightWithFontSize:  ( 加载 系统 字体 Avenir-Light )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (nullable UIFont *)swpFontAvenirLightWithFontSize:(CGFloat)size;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontHeitiSCWithFontSize:  ( 加载 系统 字体 Heiti SC )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (nullable UIFont *)swpFontHeitiSCWithFontSize:(CGFloat)size;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontHelveticaNeueFontSize:  ( 加载 系统 字体 HelveticaNeue )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (nullable UIFont *)swpFontHelveticaNeueFontSize:(CGFloat)size;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontHelveticaNeueBoldFontSize:  ( 加载 系统 字体 HelveticaNeue-Bold )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (nullable UIFont *)swpFontHelveticaNeueBoldFontSize:(CGFloat)size;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontGillSansItalicFontSize:  ( 加载 系统 字体 GillSans-Italic )
 *
 *  @ param  size
 *
 *  @ return UIFont
 */
+ (nullable UIFont *)swpFontGillSansItalicFontSize:(CGFloat)size;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontGetSystemFontNameList:   ( 获取 系统 字体 数组 列表 )
 *
 *  @ return NSArray
 */
+ (NSArray<NSString *> *)swpFontGetSystemFontNameList;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFontGetSystemFontDictionary  ( 获取 系统 字体 字典 列表  )
 *
 *  @ return NSDictionary<NSString *, NSArray<NSString *> *> *
 */
+ (NSDictionary<NSString *, NSArray<NSString *> *> *)swpFontGetSystemFontDictionaryList;

@end
NS_ASSUME_NONNULL_END
