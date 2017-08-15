//
//  SelectModelsCell.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/3/2.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SelectModelsCell : UITableViewCell


/**!
 *  @author swp_song
 *
 *  @brief  selectModelsCellInit  ( 快速初始化一个 Cell )
 */
+ (__kindof SelectModelsCell * _Nonnull (^)(UITableView * _Nonnull, NSString * _Nonnull))selectModelsCellInit;

/**!
 *  @author swp_song
 *
 *  @brief  selectModelsCellWithTableView:forCellReuseIdentifier:   ( 快速初始化一个 Cell )
 *
 *  @param  tableView   tableView
 *
 *  @param  identifier  identifier
 *
 *  @return UITableViewCell
 */
+ (instancetype)selectModelsCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier;

/**!
 *  @author swp_song
 *
 *  @brief  model   ( 设置数据 )
 */
- (SelectModelsCell * _Nonnull (^)(id _Nonnull, NSIndexPath * _Nonnull))model;


@end
NS_ASSUME_NONNULL_END
