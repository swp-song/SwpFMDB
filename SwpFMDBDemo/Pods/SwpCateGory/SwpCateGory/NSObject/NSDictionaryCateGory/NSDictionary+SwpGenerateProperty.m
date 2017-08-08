//
//  NSDictionary+SwpGenerateProperty.m
//  swp_song
//
//  Created by swp_song on 2016/11/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "NSDictionary+SwpGenerateProperty.h"

@implementation NSDictionary (SwpGenerateProperty)


/**!
 *  @ author swp_song
 *
 *  @ brief  swpGenerateProperty:   ( 创建 所有 属性  )
 *
 *  @ return NSString
 */
- (NSString *)swpGenerateProperty {
    return [self swpStitchingString];
}



/**!
 *  @ author swp_song
 *
 *  @ brief  swpStitchingString:    ( 拼接属性 字符串 )
 *
 *  @ return NSString
 */
- (NSString *)swpStitchingString {
    
    NSMutableString *propertys = [NSMutableString string];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        id dictionaryKey    = key;
        id dictionaryValen  = value;
        if ([dictionaryKey isEqual:@"id"]) {
            dictionaryKey = [NSString stringWithFormat:@"%@_", key];
        }
        
        NSString *property = [self swpVerificationPropertyType:dictionaryKey value:dictionaryValen];
        [propertys appendFormat:@"\n /*!  !*/ \n %@ \n", property];
        
    }];
    return propertys.copy;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpVerificationPropertyType:   ( 验证 属性 类型 )
 *
 *  @ return NSString
 */
- (NSString *)swpVerificationPropertyType:(id)key value:(id)value {
    
    if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
        // BOOL
        return [NSString stringWithFormat:@"@property (nonatomic, assign, getter = is%@) BOOL %@;", [key capitalizedString], key];
    } else if ([value isKindOfClass:[NSNumber class]]) {
        // NSInteger
        return [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger     %@;", key];
        
    } else if ([value isKindOfClass:[NSString class]]) {
        // NSString
        return [NSString stringWithFormat:@"@property (nonatomic, copy  ) NSString      *%@;", key];
        
    } else if ([value isKindOfClass:[NSDictionary class]]) {
        // NSDictionary
        return [NSString stringWithFormat:@"@property (nonatomic, copy  ) NSDictionary  *%@;", key];
    } else if ([value isKindOfClass:[NSArray class]]) {
        // NSArray
       return [NSString stringWithFormat:@"@property (nonatomic, copy  ) NSArray       *%@;",  key];
    } else {
        return @"";
    }
}




@end
