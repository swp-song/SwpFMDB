//
//  NSString+SwpMD5Encryption.m
//  swp_song
//
//  Created by swp_song on 2017/10/23.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import "NSString+SwpMD5Encryption.h"

#import <CommonCrypto/CommonDigest.h>


@implementation NSString (SwpMD5Encryption)

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
+ (NSString *)swpMD5Encryption:(NSString *)string {
    
    if (!string.length) return @"";
    
    //  要进行UTF8的转码
    const    char *input = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *encryptString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [encryptString appendFormat:@"%02x", result[i]];
    }
    return encryptString;
}

#pragma mark - MD5 32 Bit Methods
/**
 *  @author swp_song
 *
 *  @brief  swpMD5EncryptionChain   ( 字符串 MD5 加密 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5EncryptionChain {
    
    return ^(NSString *string){
        return [self swpMD5Encryption:string];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32Bit:  ( 字符串 MD5，32 位加密 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption32Bit:(NSString *)string {
    return [self.class swpMD5Encryption:string];
}

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitChain  ( 字符串 MD5，32 位加密 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption32BitChain {
    return ^(NSString *string){
        return [self swpMD5Encryption32Bit:string];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitForLowerCase:  ( 字符串 MD5，32 位加密，转换成小写 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption32BitForLowerCase:(NSString *)string {
    return [self.class swpMD5Encryption32Bit:string].lowercaseString;
}

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitForLowerCaseChain  ( 字符串 MD5，32 位加密，转换成小写 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption32BitForLowerCaseChain {
    return ^(NSString *string){
        return [self swpMD5Encryption32BitForLowerCase:string];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitForUpperCase:  ( 字符串 MD5，32 位加密，转换成大写 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption32BitForUpperCase:(NSString *)string {
    return [self.class swpMD5Encryption32Bit:string].uppercaseString;
}

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption32BitForUpperCaseChain  ( 字符串 MD5，32 位加密，转换成小写 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption32BitForUpperCaseChain {
    return ^(NSString *string){
        return [self swpMD5Encryption32BitForUpperCase:string];
    };
}

#pragma mark - MD5 16 Bit
/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16Bit:  ( 字符串 MD5，16 位加密 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption16Bit:(NSString *)string {
    
    if (!string.length) return @"";
    NSString *MD532BitString = [self swpMD5Encryption32Bit:string];
    NSString *MD516BitString = [MD532BitString substringWithRange:NSMakeRange(8, 16)];
    return MD516BitString;
}

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitChain  ( 字符串 MD5，16 位加密 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption16BitChain {
    return ^(NSString *string){
        return [self swpMD5Encryption16Bit:string];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitForLowerCase:  ( 字符串 MD5，16 位加密，转换成小写 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption16BitForLowerCase:(NSString *)string {
    return [self.class swpMD5Encryption16Bit:string].lowercaseString;
}

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitForLowerCaseChain  ( 字符串 MD5，16 位加密，转换成小写 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption16BitForLowerCaseChain {
    return ^(NSString *string){
        return [self swpMD5Encryption16BitForLowerCase:string];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitForUpperCase:  ( 字符串 MD5，16 位加密，转换成大写 )
 *
 *  @param  string string
 *
 *  @return NSString
 */
+ (NSString *)swpMD5Encryption16BitForUpperCase:(NSString *)string {
    return [self.class swpMD5Encryption16Bit:string].uppercaseString;
}

/**
 *  @author swp_song
 *
 *  @brief  swpMD5Encryption16BitForUpperCaseChain  ( 字符串 MD5，16 位加密，转换成大写 )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpMD5Encryption16BitForUpperCaseChain {
    return ^(NSString *string){
        return [self swpMD5Encryption16BitForUpperCase:string];
    };
}




@end

