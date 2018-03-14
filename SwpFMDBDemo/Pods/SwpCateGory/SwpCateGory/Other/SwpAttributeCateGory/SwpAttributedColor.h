//
//  SwpAttributedColor.h
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpAttributedString.h"

@class UIColor;

NS_ASSUME_NONNULL_BEGIN
@interface SwpAttributedColor : SwpAttributedString

/* 设置 Attribute Color */
@property (nonatomic, strong) UIColor *swpAttributedColor;

@end
NS_ASSUME_NONNULL_END
