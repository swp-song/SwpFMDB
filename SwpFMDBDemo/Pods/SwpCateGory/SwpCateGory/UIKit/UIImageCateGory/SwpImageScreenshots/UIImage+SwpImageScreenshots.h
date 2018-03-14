//
//  UIImage+SwpImageScreenshots.h
//  swp_song
//
//  Created by swp_song on 2018/2/1.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (SwpImageScreenshots)

/**
 *  @author swp_song
 *
 *  @brief  swpImageScreenshotsChain    ( view 生成 image )
 */
+ (UIImage * _Nonnull (^)(UIView * _Nonnull))swpImageScreenshotsChain;

/**
 *  @author swp_song
 *
 *  @brief  swpImageToolsSnapshotImage: ( view 生成 image )
 *
 *  @param  view    view
 *
 *  @return UIImage
 */
+ (UIImage *)swpImageScreenshots:(UIView *)view;

/**
 *  @author swp_song
 *
 *  @brief  swpImageScreenshotsFullScreenChain   ( 截取整个屏幕，转换成 image )
 */
+ (UIImage * _Nonnull (^)(void))swpImageScreenshotsFullScreenChain;

/**
 *  @author swp_song
 *
 *  @brief  swpImageScreenshotsFullScreen   ( 截取整个屏幕，转换成 image )
 *
 *  @return UIImage
 */
+ (UIImage *)swpImageScreenshotsFullScreen;

@end
NS_ASSUME_NONNULL_END
