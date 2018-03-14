//
//  NSString+SwpBase64.h
//  swp_song
//
//  Created by swp_song on 2017/10/23.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSString (SwpBase64)

#pragma mark - Base64 Encoded Methods
/**
 *  @author swp_song
 *
 *  @brief  swpBase64EncodedString: ( Base64 Encoded )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpBase64EncodedString:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpBase64EncodedStringChain ( Base64 Encoded )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpBase64EncodedStringChain;

#pragma mark - Base64 Decoded Methods
/**
 *  @author swp_song
 *
 *  @brief  swpBase64DecodedString: ( Base64 Decoded )
 *
 *  @param  string  string
 *
 *  @return NSString
 */
+ (NSString *)swpBase64DecodedString:(NSString *)string;

/**
 *  @author swp_song
 *
 *  @brief  swpBase64DecodedStringChain ( Base64 Decoded )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpBase64DecodedStringChain;

@end
NS_ASSUME_NONNULL_END
