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
 *  @ author swp_song
 *
 *  @ brief  selectModelsCellWithTableView:forCellReuseIdentifier:  ( 快速 初始化 一个 cell )
 *
 *  @ param  tableView
 *
 *  @ param  identifier
 *
 *  @ return
 */
+ (instancetype)selectModelsCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier;

/**!
 *  @ author swp_song
 *
 *  @ brief  model: ( 设置 数据 )
 */
- (SelectModelsCell *(^)(id model, NSIndexPath *indexPath))model;

@end
NS_ASSUME_NONNULL_END
