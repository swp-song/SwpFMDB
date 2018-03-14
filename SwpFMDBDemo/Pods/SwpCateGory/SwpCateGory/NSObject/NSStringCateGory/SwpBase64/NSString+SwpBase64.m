//
//  NSString+SwpBase64.m
//  swp_song
//
//  Created by swp_song on 2017/10/23.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import "NSString+SwpBase64.h"

@implementation NSString (SwpBase64)

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
+ (NSString *)swpBase64EncodedString:(NSString *)string {
    if (!string.length) return @"";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}


/**
 *  @author swp_song
 *
 *  @brief  swpBase64EncodedStringChain ( Base64 Encoded )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpBase64EncodedStringChain {
    return ^(NSString *string){
        return [self swpBase64EncodedString:string];
    };
}

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
+ (NSString *)swpBase64DecodedString:(NSString *)string {
    if (!string.length) return @"";
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/**
 *  @author swp_song
 *
 *  @brief  swpBase64DecodedStringChain ( Base64 Decoded )
 */
+ (NSString * _Nonnull (^)(NSString * _Nonnull))swpBase64DecodedStringChain {
    return ^(NSString *string){
        return [self swpBase64DecodedString:string];
    };
}

@end
