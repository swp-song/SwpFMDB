//
//  UIView+SwpExtension.h
//  swp_song
//
//  Created by swp_song on 16/6/3.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIView (SwpExtension)

/*! x值       !*/
@property (nonatomic, assign) CGFloat x;
/*! y值       !*/
@property (nonatomic, assign) CGFloat y;
/*! 中心x     !*/
@property (nonatomic, assign) CGFloat centerX;
/*! 中心y     !*/
@property (nonatomic, assign) CGFloat centerY;
/*! 宽度      !*/
@property (nonatomic, assign) CGFloat width;
/*! 高度      !*/
@property (nonatomic, assign) CGFloat height;
/*! 宽高      !*/
@property (nonatomic, assign) CGSize  size;
/*! 起点 x, y !*/
@property (nonatomic, assign) CGPoint origin;

@end
NS_ASSUME_NONNULL_END
