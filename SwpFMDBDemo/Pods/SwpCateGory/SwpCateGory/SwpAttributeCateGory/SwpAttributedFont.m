//
//  SwpAttributedFont.m
//  SwpFormwork
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpAttributedFont.h"

#import <UIKit/UIKit.h>

@implementation SwpAttributedFont


#pragma mark - SwpAttributed Delegate Methods
/**!
 *  @ author swp_song
 *
 *  @  brief  swpAttributeName    ( 设置 Attributed Font Key )
 *
 *  @ return swpAttributeName
 */
- (NSString *)swpAttributeName {
    return NSFontAttributeName;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpAttributeValue   ( 设置 Attributed Font )
 *
 *  @ return swpAttributeValue
 */
- (id)swpAttributeValue {
    return self.swpAttributedFont ? self.swpAttributedFont : [UIFont systemFontOfSize:[UIFont systemFontSize]];
}
@end
