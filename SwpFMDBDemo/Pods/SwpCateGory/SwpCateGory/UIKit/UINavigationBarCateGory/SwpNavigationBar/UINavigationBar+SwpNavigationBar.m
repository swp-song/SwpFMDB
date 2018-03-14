//
//  UINavigationBar+SwpNavigationBar.m
//  swp_song
//
//  Created by swp_song on 2017/8/9.
//  Copyright © 2017年 swp-song. All rights reserved.
//

#import "UINavigationBar+SwpNavigationBar.h"

/* ---------------------- Tool       ---------------------- */
#import <objc/message.h>                // RunTime
/* ---------------------- Tool       ---------------------- */

static char coverViewKey;

@interface UINavigationBar ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* Cover View */
@property (nonatomic, strong) UIView *coverView;
/* ---------------------- UI   Property  ---------------------- */

@end


@implementation UINavigationBar (SwpNavigationBar)

#pragma mark - Public Methods

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetBackgroundColorChain  ( Set NavigationBar BackgroundColor )
 */
- (__kindof UINavigationBar * _Nonnull (^)(UIColor * _Nonnull))swpNavigationBarSetBackgroundColorChain {
    return ^(UIColor *backgroundColor){
        return [self swpNavigationBarSetBackgroundColor:backgroundColor];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetBackgroundColor: ( Set NavigationBar BackgroundColor )
 *
 *  @param  backgroundColor backgroundColor
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarSetBackgroundColor:(UIColor *)backgroundColor {
    if (!self.coverView) {
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        if (@available(iOS 11.0, *)) {
            CGFloat height = [UIApplication sharedApplication].statusBarFrame.size.height;
            self.coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + height)];
        } else {
            self.coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        }
        
        self.coverView.userInteractionEnabled = NO;
        // Should not set `UIViewAutoresizingFlexibleHeight`
        self.coverView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.subviews.firstObject insertSubview:self.coverView atIndex:0];
    }
    self.coverView.backgroundColor = backgroundColor;
    
    return self;
}


/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetTranslationYChain    ( Set NavigationBar TranslationY )
 */
- (__kindof UINavigationBar * _Nonnull (^)(CGFloat))swpNavigationBarSetTranslationYChain {
    return ^(CGFloat translationY) {
        return [self swpNavigationBarSetTranslationY:translationY];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarTranslationY:   ( Set NavigationBar TranslationY )
 *
 *  @param  translationY    translationY
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarSetTranslationY:(CGFloat)translationY {
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
    return self;
}



/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetAlphaChain   ( Set NavigationBar Alpha )
 */
- (__kindof UINavigationBar * _Nonnull (^)(CGFloat))swpNavigationBarSetAlphaChain {
    return ^(CGFloat alpha) {
        return [self swpNavigationBarSetAlpha:alpha];
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetAlpha:   ( Set NavigationBar Alpha )
 *
 *  @param  alpha   alpha
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarSetAlpha:(CGFloat)alpha {
    
    if (@available(iOS 11, *)) {
        
        [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
            
            if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarContentView")]) {
                
                for (UIView *view in [obj subviews])
                {
                    view.alpha = alpha;
                }
            }
        }];
        
    } else {
        
        [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
            view.alpha = alpha;
        }];
        
        [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
            view.alpha = alpha;
        }];
        
        UIView *titleView = [self valueForKey:@"_titleView"];
        titleView.alpha = alpha;
        //    when viewController first load, the titleView maybe nil
        [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
                obj.alpha = alpha;
            }
            if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")]) {
                obj.alpha = alpha;
            }
        }];
        
    }
    return self;
}

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetBottomLineViewHiddenChain    ( Set NavigationBar Bottom LineView Hidden  )
 */
- (__kindof UINavigationBar * _Nonnull (^)(BOOL))swpNavigationBarSetBottomLineViewHiddenChain {
    
    return ^(BOOL hidden) {
        return [self swpNavigationBarSetBottomLineViewHidden:hidden];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarSetBottomLineViewHidden:    ( Set NavigationBar Bottom LineView Hidden  )
 *
 *  @param  hidden  hidden
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarSetBottomLineViewHidden:(BOOL)hidden {
    UIImageView *lineView = [self findLineImageViewUnder:self];
    lineView.hidden       = hidden;
    return self;
}


/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarResetChain  ( Reset )
 */
- (__kindof UINavigationBar * _Nonnull (^)(void))swpNavigationBarResetChain {
    return ^() {
        return [self swpNavigationBarReset];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpNavigationBarReset   ( Reset )
 *
 *  @return UINavigationBar
 */
- (instancetype)swpNavigationBarReset {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.coverView removeFromSuperview];
    self.coverView = nil;
    return self;
}

#pragma mark - Private Tools Methods

/**
 *  @author swp_song
 *
 *  @brief  findLineImageViewUnder: ( 查找底部 imageView )
 *
 *  @param  view    view
 *
 *  @return UIImageView
 */
- (UIImageView *)findLineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findLineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


#pragma mark - Private Property Methods
/**
 *  @author swp_song
 *
 *  @brief  coverView   ( Reset )
 *
 *  @return UIView
 */
- (UIView *)coverView {
    return objc_getAssociatedObject(self, &coverViewKey);
}


/**
 *  @author swp_song
 *
 *  @brief  setCoverView:   ( Reset )
 *
 *  @param  coverView   coverView
 */
- (void)setCoverView:(UIView *)coverView {
    objc_setAssociatedObject(self, &coverViewKey, coverView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end
