//
//  UIImage+SwpImageScreenshots.m
//  swp_song
//
//  Created by swp_song on 2018/2/1.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "UIImage+SwpImageScreenshots.h"

@implementation UIImage (SwpImageScreenshots)

/**
 *  @author swp_song
 *
 *  @brief  swpImageScreenshotsChain    ( view 生成 image )
 */
+ (UIImage * _Nonnull (^)(UIView * _Nonnull))swpImageScreenshotsChain {
    return ^(UIView *view){
        return [self.class swpImageScreenshots:view];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpImageToolsSnapshotImage: ( view 生成 image )
 *
 *  @param  view    view
 *
 *  @return UIImage
 */
+ (UIImage *)swpImageScreenshots:(UIView *)view {
    if (!view) return nil;
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


/**
 *  @author swp_song
 *
 *  @brief  swpImageScreenshotsFullScreenChain   ( 截取整个屏幕，转换成 image )
 */
+ (UIImage * _Nonnull (^)(void))swpImageScreenshotsFullScreenChain {
    
    return ^(){
        return [self.class swpImageScreenshotsFullScreen];
    };
}



/**
 *  @author swp_song
 *
 *  @brief  swpImageScreenshotsFullScreen   ( 截取整个屏幕，转换成 image )
 *
 *  @return UIImage
 */
+ (UIImage *)swpImageScreenshotsFullScreen {
    return [UIImage imageWithData:[self.class swpImageScreenshotsFullScreenData]];
}


/**
 *  @author swp_song
 *
 *  @brief  swpImageScreenshotsFullScreenData   ( 截取整个屏幕，转换成 Data )
 *
 *  @return NSData
 */
+ (NSData *)swpImageScreenshotsFullScreenData {
    
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = UIApplication.sharedApplication.statusBarOrientation;
    
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        imageSize = UIScreen.mainScreen.bounds.size;
    } else {
        imageSize = CGSizeMake(UIScreen.mainScreen.bounds.size.height, UIScreen.mainScreen.bounds.size.width);
    }
    
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [UIApplication.sharedApplication.windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull window, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        
        switch (orientation) {
            case UIInterfaceOrientationLandscapeLeft:
            {
                CGContextRotateCTM(context, M_PI_2);
                CGContextTranslateCTM(context, 0, -imageSize.width);
            }
                break;
                
            case UIInterfaceOrientationLandscapeRight:
            {
                CGContextRotateCTM(context, -M_PI_2);
                CGContextTranslateCTM(context, -imageSize.height, 0);
            }
                break;
                
            case UIInterfaceOrientationPortraitUpsideDown:
            {
                CGContextRotateCTM(context, M_PI);
                CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
            }
                break;
            default:
                break;
        }
        
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
            
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
            
        } else {
            [window.layer renderInContext:context];
        }
        
        CGContextRestoreGState(context);
    }];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImagePNGRepresentation(image);
}


@end
