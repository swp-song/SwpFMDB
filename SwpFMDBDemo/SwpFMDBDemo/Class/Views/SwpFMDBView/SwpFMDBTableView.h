//
//  SwpFMDBTableView.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpFMDBTableView : UITableView

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDatas    ( 设置数据 )
 */
- (SwpFMDBTableView * _Nonnull (^)(NSArray * _Nonnull))swpFMDBDatas;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBTableViewClickCell:  ( 点击 cell 回调 )
 *
 *  @param  swpFMDBTableViewClickCell   swpFMDBTableViewClickCell
 */
- (void)swpFMDBTableViewClickCell:(void (^ _Nullable)(SwpFMDBTableView * _Nonnull swpFMDBTableView, NSIndexPath * _Nonnull indexPath))swpFMDBTableViewClickCell;

@end
NS_ASSUME_NONNULL_END
