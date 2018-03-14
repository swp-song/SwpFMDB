//
//  UIView+SwpViewScreenshots.m
//  swp_song
//
//  Created by swp_song on 2018/2/1.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "UIView+SwpViewScreenshots.h"

@implementation UIView (SwpViewScreenshots)

/**
 *  @author swp_song
 *
 *  @brief  swpViewToolsSnapshotImageChain  ( view 生成图片 )
 */
- (UIImage * _Nonnull (^)(void))swpViewScreenshotsChain {
    return ^(){
        return [self swpViewScreenshots];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpViewScreenshots  ( view 生成图片 )
 *
 *  @return UIImage
 */
- (UIImage *)swpViewScreenshots {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
