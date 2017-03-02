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

- (SwpDataDisplayView *(^)())swpDataDisplayViewShow;

- (SwpDataDisplayView *(^)())swpDataDisplayViewHidden;

@property (nonatomic, copy) void(^swpDataDisplayViewClickEvent)(SwpDataDisplayView *swpDataDisplayView);

//@property (nonatomic, assign) id model;


- (SwpDataDisplayView *(^)(id model))model;

@end
NS_ASSUME_NONNULL_END
