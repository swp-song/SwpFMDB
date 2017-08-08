//
//  NSMutableAttributedString+SwpAttributed.h
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SwpAttributedDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@interface NSMutableAttributedString (SwpAttributed)

/**!
 *  @ author swp_song
 *
 *  @ brief  addStringAttribute: ( 添加 富文本 )
 *
 *  @ param  stringAttribute
 */
- (void)addStringAttribute:(id<SwpAttributedDelegate>)stringAttribute;

/**!
 *  @ author swp_song
 *
 *  @ brief  removeStringAttribute:  ( 移除 富文本 )
 *
 *  @ param  stringAttribute
 */
- (void)removeStringAttribute:(id<SwpAttributedDelegate>)stringAttribute;

@end
NS_ASSUME_NONNULL_END
