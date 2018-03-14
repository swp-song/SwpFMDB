//
//  SwpAttributedString.h
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SwpAttributedDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@interface SwpAttributedString : NSObject <SwpAttributedDelegate>

/* 设置 Attributed 生效的范围 */
@property (nonatomic, assign) NSRange swpAttributedEffectRange;

@end
NS_ASSUME_NONNULL_END
