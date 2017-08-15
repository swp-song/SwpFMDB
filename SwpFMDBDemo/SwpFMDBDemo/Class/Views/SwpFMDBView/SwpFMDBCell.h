//
//  SwpFMDBCell.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/22.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpFMDBModel;
NS_ASSUME_NONNULL_BEGIN
@interface SwpFMDBCell : UITableViewCell

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBCellInit:    ( 快速初始化一个 Cell )
 */
+ (__kindof SwpFMDBCell * _Nonnull (^)(UITableView * _Nonnull, NSString * _Nonnull))swpFMDBCellInit;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBCellWithTableView:forCellReuseIdentifier:  ( 快速 初始化 一个 cell )
 *
 *  @ param  tableView
 *
 *  @ param  identifier
 *
 *  @ return SwpFMDBCell
 */
+ (instancetype)swpFMDBCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier;

/**!
 *  @author swp_song
 *
 *  @brief  model: ( 设置 数据 )
 */
- (SwpFMDBCell * _Nonnull (^)(SwpFMDBModel * _Nonnull, NSIndexPath * _Nonnull))swpFMDB;


@end
NS_ASSUME_NONNULL_END
