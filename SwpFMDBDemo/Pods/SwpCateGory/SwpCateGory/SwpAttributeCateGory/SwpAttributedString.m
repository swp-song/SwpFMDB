//
//  SwpAttributedString.m
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpAttributedString.h"

@implementation SwpAttributedString

#pragma mark - SwpAttributed Delegate Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpAttributeName    ( 设置 Attributed Key )
 *
 *  @ return swpAttributeName
 */
- (NSString *)swpAttributeName {
    return nil;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpAttributeValue   ( 设置 Attributed Value )
 *
 *  @ return swpAttributeValue
 */
- (id)swpAttributeValue {
    return nil;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpAttributeEffectiveStringRange    ( 设置 Attributed 生效的范围   )
 *
 *  @ return NSRange
 */
- (NSRange)swpAttributeEffectiveStringRange {
    return self.swpAttributedEffectRange;
}

@end
