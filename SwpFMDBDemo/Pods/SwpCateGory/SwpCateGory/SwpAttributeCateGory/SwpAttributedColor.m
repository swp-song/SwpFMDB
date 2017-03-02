//
//  SwpAttributedColor.m
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpAttributedColor.h"

#import <UIKit/UIKit.h>

@implementation SwpAttributedColor


#pragma mark - SwpAttributed Delegate Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpAttributeName    ( 设置 Attributed Color Key )
 *
 *  @ return swpAttributeName
 */
- (NSString *)swpAttributeName {
    return NSForegroundColorAttributeName;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpAttributeValue   ( 设置 Attributed Color )
 *
 *  @ return swpAttributeValue
 */
- (id)swpAttributeValue {
    return self.swpAttributedColor ? self.swpAttributedColor : [UIColor blackColor];
}

@end
