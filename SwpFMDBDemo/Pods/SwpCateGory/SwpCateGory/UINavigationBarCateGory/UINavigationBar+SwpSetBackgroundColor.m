//
//  UINavigationBar+SwpSetBackgroundColor.m
//  swp_song
//
//  Created by swp_song on 16/6/3.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UINavigationBar+SwpSetBackgroundColor.h"

#import <objc/runtime.h>

static char overlayKey;

@implementation UINavigationBar (SwpSetBackgroundColor)

/**!
 *  @ author swp_song
 *
 *  @ brief  overlay
 *
 *  @ return UIView
 */
- (UIView *)overlay {
    return objc_getAssociatedObject(self, &overlayKey);
}


/**!
 *  @ author swp_song
 *
 *  @ brief  setOverlay:
 *
 *  @ param  overlay
 */
- (void)setOverlay:(UIView *)overlay {
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpSetBackgroundColor:  ( 设置 导航控制器 颜色 )
 *
 *  @ param  backgroundColor
 */
- (void)swpSetBackgroundColor:(UIColor *)backgroundColor {
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;    // Should not set `UIViewAutoresizingFlexibleHeight`
        [[self.subviews firstObject] insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
}

@end
