//
//  SwpAttributedDelegate.h
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SwpAttributedDelegate <NSObject>

@required
/**
 *  @author swp_song
 *
 *  @brief  swpAttributeName    ( 属性名字 )
 *
 *  @return NSString
 */
- (NSString *)swpAttributeName;

/**
 *  @author swp_song
 *
 *  @brief  swpAttributeValue   ( 属性对应的值 )
 *
 *  @return id
 */
- (id)swpAttributeValue;

@optional


#pragma mark -
/**
 *  @author swp_song
 *
 *  @brief  swpAttributeEffectiveStringRange    ( 生效的范围 )
 *
 *  @return NSRange
 */
- (NSRange)swpAttributeEffectiveStringRange;


@end
