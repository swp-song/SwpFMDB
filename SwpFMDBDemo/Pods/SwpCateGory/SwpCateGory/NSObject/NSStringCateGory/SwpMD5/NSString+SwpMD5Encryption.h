//
//  NSString+SwpMD5Encryption.h
//  swp_song
//
//  Created by swp_song on 2017/10/23.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSString (SwpMD5Encryption)

#pragma mark - MD5 Methods
/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption:   ( 字符串 MD5 加密 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption:(NSString *)string;

#pragma mark - MD5 32 Bit Methods
/**
 *  @author swp_song
 *
 *  @brief  swpMD5EncryptionChain   ( 字符串 MD5 加密 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5EncryptionChain;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32Bit:  ( 字符串 MD5，32 位加密 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption32Bit:(NSString *)string;


/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitChain  ( 字符串 MD5，32 位加密 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption32BitChain;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitForLowerCase:  ( 字符串 MD5，32 位加密，转换成小写 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption32BitForLowerCase:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitForLowerCaseChain  ( 字符串 MD5，32 位加密，转换成小写 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption32BitForLowerCaseChain;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitForUpperCase:  ( 字符串 MD5，32 位加密，转换成大写 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption32BitForUpperCase:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitForUpperCaseChain  ( 字符串 MD5，32 位加密，转换成小写 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption32BitForUpperCaseChain;

#pragma mark - MD5 16 Bit Methods
/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16Bit:  ( 字符串 MD5，16 位加密 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption16Bit:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitChain  ( 字符串 MD5，16 位加密 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption16BitChain;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitForLowerCase:  ( 字符串 MD5，16 位加密，转换成小写 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption16BitForLowerCase:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitForLowerCaseChain  ( 字符串 MD5，16 位加密，转换成小写 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption16BitForLowerCaseChain;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitForUpperCase:  ( 字符串 MD5，16 位加密，转换成大写 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption16BitForUpperCase:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitForUpperCaseChain  ( 字符串 MD5，16 位加密，转换成大写 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption16BitForUpperCaseChain;


@end
NS_ASSUME_NONNULL_END
