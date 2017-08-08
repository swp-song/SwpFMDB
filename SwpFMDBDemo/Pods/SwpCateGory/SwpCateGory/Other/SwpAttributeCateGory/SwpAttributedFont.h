//
//  SwpAttributedFont.h
//  swp_song
//
//  Created by swp_song on 16/8/15.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpAttributedString.h"

@class UIFont;

NS_ASSUME_NONNULL_BEGIN
@interface SwpAttributedFont : SwpAttributedString

/*! 设置 Attribute Font !*/
@property (nonatomic, strong) UIFont *swpAttributedFont;

@end
NS_ASSUME_NONNULL_END
