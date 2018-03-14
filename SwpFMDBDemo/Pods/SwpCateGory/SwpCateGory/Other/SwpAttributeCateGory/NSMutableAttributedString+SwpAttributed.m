//
//  NSMutableAttributedString+SwpAttributed.m
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "NSMutableAttributedString+SwpAttributed.h"

@implementation NSMutableAttributedString (SwpAttributed)

/**
 *  @author swp_song
 *
 *  @brief  addStringAttribute: ( 添加 富文本 )
 *
 *  @param  stringAttribute stringAttribute
 */
- (void)addStringAttribute:(id<SwpAttributedDelegate>)stringAttribute {
    [self addAttribute:[stringAttribute swpAttributeName]
                 value:[stringAttribute swpAttributeValue]
                 range:[stringAttribute swpAttributeEffectiveStringRange]];
}


/**
 *  @author swp_song
 *
 *  @brief  removeStringAttribute:  ( 移除富文本 )
 *
 *  @param  stringAttribute stringAttribute
 */
- (void)removeStringAttribute:(id<SwpAttributedDelegate>)stringAttribute {
    [self removeAttribute:[stringAttribute swpAttributeName]
                    range:[stringAttribute swpAttributeEffectiveStringRange]];
}

@end
