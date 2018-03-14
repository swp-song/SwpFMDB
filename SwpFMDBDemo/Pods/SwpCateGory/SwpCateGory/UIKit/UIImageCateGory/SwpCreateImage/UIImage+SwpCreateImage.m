//
//  UIImage+SwpCreateImage.m
//  swp_song
//
//  Created by swp_song on 2018/3/4.
//  Copyright © 2018年 swp-song. All rights reserved.
//

#import "UIImage+SwpCreateImage.h"

@implementation UIImage (SwpCreateImage)

/**
 *  @author swp_song
 *
 *  @brief  swpCreateImageWithColor: ( 创建，一张图片，根据 color )
 */
+ (UIImage * _Nonnull (^)(UIColor *))swpCreateImageWithColor {
    return ^(UIColor *color) {
        return [self.class swpCreateImageWithColor:color];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCreateImageWithColor: ( 创建，一张图片，根据 color )
 *
 *  @param  color   color
 *
 *  @return UIImage
 */
+ (UIImage *)swpCreateImageWithColor:(UIColor *)color {
    return [self.class swpCreateImageWithColor:color frame:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)];
}


/**
 *  @author swp_song
 *
 *  @brief  swpCreateImageWithColorAndFrame:    ( 创建，一张图片，根据 color，frame )
 */
+ (UIImage * _Nonnull (^)(UIColor * _Nonnull, CGRect))swpCreateImageWithColorAndFrame {
    
    return ^(UIColor *color, CGRect frame) {
        return [self.class swpCreateImageWithColor:color frame:frame];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpCreateImageWithColor:    ( 创建，一张图片，根据 color，frame )
 *
 *  @param  color   color
 *
 *  @param  frame   frame
 *
 *  @return UIImage
 */
+ (UIImage *)swpCreateImageWithColor:(UIColor *)color frame:(CGRect)frame {
    
    frame = CGRectEqualToRect(frame, CGRectZero) ? CGRectMake(0.0f, 0.0f, 1.0f, 1.0f) : frame;
    color = color ? color : [UIColor blackColor];
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context    = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, frame);
    UIImage *image          = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
