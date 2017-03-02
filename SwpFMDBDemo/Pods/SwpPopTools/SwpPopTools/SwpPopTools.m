//
//  SwpPopTools.m
//  swp_song
//
//  Created by swp_song on 2017/1/19.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpPopTools.h"

@import UIKit;


@interface SwpPopTools ()

@property (nonatomic, strong) UIView *currentView;

@end

static id _swpPopTools;

@implementation SwpPopTools


#pragma mark - Override Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  allocWithZone: ( Override  allocWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _swpPopTools = [super allocWithZone:zone];
    });
    return _swpPopTools;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
- (id)copyWithZone:(NSZone *)zone {
    return  _swpPopTools;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  copyWithZone:  ( Override  copyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
+ (id)copyWithZone:(struct _NSZone *)zone {
    return  _swpPopTools;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  mutableCopyWithZone:   ( Override  mutableCopyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return _swpPopTools;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  mutableCopyWithZone: ( Override  mutableCopyWithZone )
 *
 *  @ param  zone
 *
 *  @ return id
 */
- (id)mutableCopyWithZone:(NSZone *)zone {
    return _swpPopTools;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  init    ( Override init )
 *
 *  @ return SwpRequest
 */
- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    return self;
}



/**!
 *  @ author swp_song
 *
 *  @ brief  popToolsView:animated:animatedCompletion:  ( 将一个 view 动画 添加 到 Window 上 )
 *
 *  @ param  view
 *
 *  @ param  animated
 *
 *  @ param  animatedCompletion
 */
- (void)popToolsView:(UIView *)view animated:(BOOL)animated animatedCompletion:(void(^)())animatedCompletion {
    
    _currentView             = view;
    CGFloat halfScreenWidth  = [[UIScreen mainScreen] bounds].size.width  * 0.5;
    CGFloat halfScreenHeight = [[UIScreen mainScreen] bounds].size.height * 0.5;
    // 屏幕中心
    CGPoint screenCenter     = CGPointMake(halfScreenWidth, halfScreenHeight);
    view.center              = screenCenter;
    UIWindow *keyWindow      = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:view];
    
    if (animated) {
        // 将view宽高缩至无限小（点）
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, CGFLOAT_MIN, CGFLOAT_MIN);
        [UIView animateWithDuration:0.3 animations:^{
            
            // 以动画的形式将view慢慢放大至原始大小的1.2倍
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
            
        } completion:^(BOOL finished) {
            
            // 以动画的形式将view恢复至原始大小
            [UIView animateWithDuration:0.2 animations:^{
                view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                // 动画 执行完成
                if (animatedCompletion) animatedCompletion();
            }];
            
        }];
    }
}


/**!
 *  @ author swp_song
 *
 *  @ brief  popToolsViewCloseAnimated:animatedCompletion:  ( 关闭 一个 view )
 *
 *  @ param  animated
 *
 *  @ param  animatedCompletion
 */
- (void)popToolsViewCloseAnimated:(BOOL)animated animatedCompletion:(void(^)())animatedCompletion {
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            _currentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                _currentView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
            } completion:^(BOOL finished) {
                [_currentView removeFromSuperview];
                if (animatedCompletion) animatedCompletion();
            }];
        }];
    } else {
        [_currentView removeFromSuperview];
         if (animatedCompletion) animatedCompletion();
    }
}


#pragma mark - Public Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  shareInstance ( 单利 )
 
 *  @ return SwpPopTools
 */
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _swpPopTools = [[SwpPopTools alloc] init];
    });
    return _swpPopTools;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPopToolsView:animatedCompletion:( 将一个 view 动画 添加 到 Window 上 )
 *
 *  @ param  view
 *
 *  @ param  animated
 */
+ (void)swpPopToolsView:(UIView *)view animated:(BOOL)animated {
    [[self class] swpPopToolsView:view animated:animated animatedCompletion:nil];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpPopToolsView:animated:animatedCompletion:   ( 将一个 view 动画 添加 到 Window 上 )
 *
 *  @ param  view
 *
 *  @ param  animated
 *
 *  @ param  animatedCompletion
 */
+ (void)swpPopToolsView:(UIView *)view animated:(BOOL)animated animatedCompletion:(void(^)())animatedCompletion {
    [[SwpPopTools sharedInstance] popToolsView:view animated:animated animatedCompletion:animatedCompletion];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPopToolsViewCloseAnimated:  ( 关闭 一个 view )
 *
 *  @ param  animated
 */
+ (void)swpPopToolsViewCloseAnimated:(BOOL)animated {
    [[self class] swpPopToolsViewCloseAnimated:animated animatedCompletion:nil];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpPopToolsViewCloseAnimated:animatedCompletion:   ( 关闭 一个 view )
 *
 *  @ param  animated
 *
 *  @ param  animatedCompletion
 */
+ (void)swpPopToolsViewCloseAnimated:(BOOL)animated animatedCompletion:(void(^)())animatedCompletion {
    [[SwpPopTools sharedInstance] popToolsViewCloseAnimated:animated animatedCompletion:animatedCompletion];
}


@end
