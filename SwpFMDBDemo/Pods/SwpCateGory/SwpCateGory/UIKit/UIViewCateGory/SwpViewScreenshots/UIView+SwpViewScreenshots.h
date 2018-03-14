//
//  UIView+SwpViewScreenshots.h
//  swp_song
//
//  Created by swp_song on 2018/2/1.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIView (SwpViewScreenshots)


/**
 *  @author swp_song
 *
 *  @brief  swpViewToolsSnapshotImageChain  ( view 生成图片 )
 */
- (UIImage * _Nonnull (^)(void))swpViewScreenshotsChain;

/**
 *  @author swp_song
 *
 *  @brief  swpViewScreenshots  ( view 生成图片 )
 *
 *  @return UIImage
 */
- (UIImage *)swpViewScreenshots;

@end
NS_ASSUME_NONNULL_END
