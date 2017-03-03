//
//  SelectModelsTableView.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/3/2.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class SelectModelsTableView;
NS_ASSUME_NONNULL_BEGIN
@interface SelectModelsTableView : UITableView


/**!
 *  @ author swp_song
 *
 *  @ brief  selectModels:  ( 设置 数据 )
 */
- (SelectModelsTableView *(^)(NSArray *selectModels, BOOL isAnimationReloadData))selectModels;

/**!
 *  @ author swp_song
 *
 *  @ brief  selectModelsTableViewClickCell:    ( 点击 cell 回调 )
 *
 *  @ param  selectModelsTableViewClickCell
 */
- (void)selectModelsTableViewClickCell:(void (^)(SelectModelsTableView *selectModelsTableView, NSIndexPath *indexPath))selectModelsTableViewClickCell;

/**!
 *  @ author swp_song
 *
 *  @ brief  selectModelsTableViewClickCell:    ( 点击 编辑 cell )
 *
 *  @ param  selectModelsTableViewClicEditingkCell
 */
- (void)selectModelsTableViewClicEditingkCell:(void (^)(SelectModelsTableView *selectModelsTableView, NSIndexPath *indexPath))selectModelsTableViewClicEditingkCell;

@end
NS_ASSUME_NONNULL_END;
