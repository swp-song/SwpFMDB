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
 *  @ author swp_song
 *
 *  @ brief  swpFMDB:   ( 设置 数据 )
 */
- (SwpFMDBCell *(^)(SwpFMDBModel *swpFMDB, NSIndexPath *indexPath))swpFMDB;

@end
NS_ASSUME_NONNULL_END
