//
//  SwpDataDisplayView.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/28.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpDataDisplayView : UIView

/**!
 *  @author swp_song
 *
 *  @brief  swpDataDisplayViewShow: ( SwpDataDisplayView 显示 )
 */
- (SwpDataDisplayView * _Nonnull (^)())swpDataDisplayViewShow;

/**!
 *  @author swp_song
 *
 *  @brief  swpDataDisplayViewHidden:   ( swpDataDisplayViewHidden 隐藏 )
 */
- (SwpDataDisplayView * _Nonnull (^)())swpDataDisplayViewHidden;

@property (nonatomic, copy) void(^swpDataDisplayViewClickEvent)(SwpDataDisplayView *swpDataDisplayView);

/**!
 *  @ author swp_song
 *
 *  @ brief  model: ( 设置数据 )
 */
- (SwpDataDisplayView * _Nonnull (^)(id _Nonnull))model;

@end
NS_ASSUME_NONNULL_END
