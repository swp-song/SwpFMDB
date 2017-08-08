//
//  NSDictionary+SwpGenerateProperty.h
//  swp_song
//
//  Created by swp_song on 2016/11/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SwpGenerateProperty)

/**!
 *  @ author swp_song
 *
 *  @ brief  swpGenerateProperty:   ( 创建 所有 属性  )
 *
 *  @ return NSString
 */
- (NSString *)swpGenerateProperty;

@end
NS_ASSUME_NONNULL_END
