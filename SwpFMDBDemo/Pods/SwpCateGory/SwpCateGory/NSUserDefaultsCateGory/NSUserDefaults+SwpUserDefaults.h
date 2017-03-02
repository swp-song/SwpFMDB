//
//  NSUserDefaults+SwpUserDefaults.h
//  swp_song
//
//  Created by swp_song on 16/6/2.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (SwpUserDefaults)

/**!
 *  @ author swp_song
 *
 *  @ brief  swpUserDefaultSetObject:forKey: ( NSUserDefaults 存入 数据 )
 *
 *  @ param  object
 *
 *  @ param  key
 */
+ (void)swpUserDefaultSetObject:(nullable id)object forKey:(nullable NSString *)key;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpUserDefaultGetObject:    ( 取出 NSUserDefaults 存储的数据 )
 *
 *  @ param  key
 *
 *  @ return id
 */
+ (nullable id)swpUserDefaultGetObject:(NSString *)key;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpUserDefaultRemoveObjectForKey:   ( 移除 NSUserDefault )
 *
 *  @ param  key
 */
+ (void)swpUserDefaultRemoveObjectForKey:(NSString *)key;

@end
NS_ASSUME_NONNULL_END
