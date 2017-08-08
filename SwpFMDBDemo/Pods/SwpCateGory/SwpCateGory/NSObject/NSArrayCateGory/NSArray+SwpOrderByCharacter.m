//
//  NSArray+SwpOrderByCharacter.m
//  SwpCateGoryDemo
//
//  Created by swp_song on 2017/6/19.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import "NSArray+SwpOrderByCharacter.h"


@import UIKit;

@implementation NSArray (SwpOrderByCharacter)

/**!
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacter ( 按字符分组顺序 < 一组字典 | 一组字符串 > )
 */
+ (NSArray * _Nonnull (^)(NSArray * _Nonnull, NSString * _Nullable))swpOrderByCharacter {
    
    return ^(NSArray *aDatas, NSString *key) {
        return [self.class swpOrderByCharacter_:aDatas key_:key];
    };
}

/**!
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacter:key:    ( 按字符分组顺序 < 一组字典 | 一组字符串 > )
 *
 *  @param  aDatas  aDatas              ( 数据源, 必须是一组字典 | 一组字符串 )
 *
 *  @param  key     key                 ( sDatas 如果是一组字典, key 则是需要分组排序字典中的 key, 其他可以为 nil )
 *
 *  @return NSArray
 */
+ (NSArray *)swpOrderByCharacter:(NSArray *)aDatas key:(NSString *)key {
    return [self.class swpOrderByCharacter_:aDatas key_:key];
}

#pragma mark - Private Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacter_:key_:  ( 按字符分组顺序 < 一组字典 | 一组字符串 > )
 *
 *  @param  aDatas_     aDatas_     ( 数据源, 必须是一组字典 | 一组字符串 )
 *
 *  @param  key_        key_        ( sDatas 如果是一组字典, key 则是需要分组排序字典中的 key, 其他可以为 nil )
 *
 *  @return NSArray
 */
+ (NSArray *)swpOrderByCharacter_:(NSArray *)aDatas_ key_:(NSString *)key_ {
    
    NSAssert(aDatas_, @"parameters aDatas can't nil ");
    
    key_ = key_.length ? key_ : @"swp_key";
    
    UILocalizedIndexedCollation *indexedCollation = [UILocalizedIndexedCollation currentCollation];
    
    //  数据原处理包装数据
    NSArray *datas      = [self.class swpOrderByCharacterPackagingDictionary:aDatas_ key:key_];
    
    NSAssert(datas, @" parameters aDatas format error ");
    
    //  创建 26 个分组数据
    NSArray *sections   = [self.class swpOrderByCharacterCreateCreate26Section:indexedCollation];
    
    //  数组排序
    NSArray *sortings   = [self.class swpOrderByCharacterSortingArray:sections datas:datas key:key_ indexedCollation:indexedCollation];
    
    //  返回处理完结果
    return [self.class swpOrderByCharacterDataProcessing:sortings key:key_];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacterCreateCreate26Section:   ( 创建 26 字幕分组数组 )
 *
 *  @param  indexedCollation    indexedCollation
 *
 *  @return NSArray
 */
+ (NSArray *)swpOrderByCharacterCreateCreate26Section:(UILocalizedIndexedCollation *)indexedCollation {
    
    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:indexedCollation.sectionTitles.count];
    for (int i=0; i<indexedCollation.sectionTitles.count; i++) {
        NSMutableArray *obj = [NSMutableArray array];
        [objects addObject:obj];
    }
    return objects.copy;
}


/**!
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacterPackagingDictionary: ( 包装数据成字典 )
 *
 *  @param  datas    datas
 *
 *  @param  key      key
 *
 *  @return NSArray
 */
+ (NSArray *)swpOrderByCharacterPackagingDictionary:(NSArray *)datas key:(NSString *)key {
    
    __block NSMutableArray *array = @[].mutableCopy;
    
    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (![obj isKindOfClass:NSDictionary.class] && ![obj isKindOfClass:NSString.class]) {
            array = nil;
            * stop = YES;
            return ;
        }
        
        if ([obj isKindOfClass:NSDictionary.class]) {
            array = datas.mutableCopy;
            * stop = YES;
            return;
        }
        NSMutableArray *dictionary = @{}.mutableCopy;
        [dictionary setValue:obj forKey:key];
        [array addObject:dictionary];
    }];
    return array.copy;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacterFirstCharacterWithString:    ( 取出字符串首字母 < 大写 > )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpOrderByCharacterFirstCharacterWithString:(NSString *)string {
    if ([self.class swpOrderByCharacterStringContainsEmoji:string]) return @"";
    NSMutableString *str = [NSMutableString stringWithString:string];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pingyin = [str capitalizedString];
    return [pingyin substringToIndex:1];
}







/**!
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacterStringContainsEmoji: ( 验证字符串中是否含有 < Emoji > )
 *
 *  @param  string  string
 *
 *  @return BOOL
 */
+ (BOOL)swpOrderByCharacterStringContainsEmoji:(NSString *)string {

    __block BOOL returnValue = NO;

    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])  options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    
    return returnValue;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacterSortingArray:datas:key:indexedCollation: ( 数组排序 )
 *
 *  @param  sectionDatas        sectionDatas
 *
 *  @param  datas               datas
 *
 *  @param  key                 key
 *
 *  @param  indexedCollation    indexedCollation
 *
 *  @return NSArray
 */
+ (NSArray *)swpOrderByCharacterSortingArray:(NSArray *)sectionDatas datas:(NSArray *)datas key:(NSString *)key indexedCollation:(UILocalizedIndexedCollation *)indexedCollation {
    
    NSMutableArray *sections = sectionDatas.mutableCopy;
    
    [datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSAssert(obj[key], @" parameters key error ");
        NSInteger       section       = [indexedCollation sectionForObject:obj[key] collationStringSelector:@selector(uppercaseString)];
        NSMutableArray *sectionObject = sections[section];
        
        [sectionObject addObject:obj];
    }];
    return sections.copy;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacterDataProcessing:key:  ( 去除空数组 )
 *
 *  @param  datas   datas
 *
 *  @param  key     key
 *
 *  @return NSArray
 */
+ (NSArray *)swpOrderByCharacterDataProcessing:(NSArray *)datas key:(NSString *)key{
    
    
    //  数组去重
    NSMutableArray *array = datas.mutableCopy;
    [array enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.count == 0) {
            [array removeObject:obj];
        }
    }];
    
    //  包装数据
    NSMutableArray *aDatas = @[].mutableCopy;
    [array enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableDictionary *dictionary = @{}.mutableCopy;
        NSString *firstString = [self swpOrderByCharacterFirstCharacterWithString:obj.firstObject[key]];
        [dictionary setObject:firstString.length  ? firstString : @"#" forKey:@"first_letter"];
        [dictionary setObject:obj forKey:@"list_datas"];
        [aDatas addObject:dictionary.copy];
    }];
    
    return aDatas.copy;
}


@end

