//
//  SelectModelsViewController.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/3/2.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SelectModelsViewController : UIViewController

/**!
 *  @author swp_song
 *
 *  @brief  models: ( 设置数据 )
 */
- (SelectModelsViewController * _Nonnull (^)(NSArray * _Nonnull, Class  _Nonnull __unsafe_unretained))models;

@end
NS_ASSUME_NONNULL_END
