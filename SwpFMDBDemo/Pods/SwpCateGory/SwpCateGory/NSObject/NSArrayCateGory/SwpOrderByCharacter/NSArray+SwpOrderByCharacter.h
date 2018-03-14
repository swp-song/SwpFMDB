//
//  NSArray+SwpOrderByCharacter.h
//  swp_song
//
//  Created by swp_song on 2017/6/19.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SwpOrderByCharacter)

/**
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacter ( 按 A ~ Z 数组中数据排序 < 一组字典 | 一组字符串 > )
 */
+ (NSArray * _Nonnull (^)(NSArray * _Nonnull, NSString * _Nullable))swpOrderByCharacter;


/**
 *  @author swp_song
 *
 *  @brief  swpOrderByCharacter:key:    ( 按 A ~ Z 数组中数据排序 < 一组字典 | 一组字符串 > )
 *
 *  @param  aDatas  aDatas              ( 数据源, 必须是一组字典 | 一组字符串 )
 *
 *  @param  key     key                 ( sDatas 如果是一组字典, key 则是需要分组排序字典中的 key, 其他可以为 nil )
 *
 *  @return NSArray
 */
+ (NSArray *)swpOrderByCharacter:(NSArray *)aDatas key:(NSString * _Nullable )key;

@end

NS_ASSUME_NONNULL_END
