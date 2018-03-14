//
//  NSUserDefaults+SwpUserDefaults.m
//  swp_song
//
//  Created by swp_song on 16/6/2.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "NSUserDefaults+SwpUserDefaults.h"

@implementation NSUserDefaults (SwpUserDefaults)

/**
 *  @author swp_song
 *
 *  @brief  swpUserDefaultSetObject:forKey: ( NSUserDefaults 存入 数据 )
 *
 *  @param  object  object
 *
 *  @param  key     key
 */
+ (void)swpUserDefaultSetObject:(id)object forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
}

/**
 *  @author swp_song
 *
 *  @brief  swpUserDefaultGetObject:    ( 取出 NSUserDefaults 存储的数据 )
 *
 *  @param  key     key
 *
 *  @return id
 */
+ (id)swpUserDefaultGetObject:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

/**
 *  @author swp_song
 *
 *  @brief  swpUserDefaultRemoveObjectForKey:   ( 移除 NSUserDefault )
 *
 *  @param  key key
 */
+ (void)swpUserDefaultRemoveObjectForKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

@end
