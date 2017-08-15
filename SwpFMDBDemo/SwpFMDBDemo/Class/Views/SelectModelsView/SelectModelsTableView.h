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
 *  @ brief  selectModels:  ( 设置数据 )
 */
- (SelectModelsTableView * _Nonnull (^)(NSArray * _Nonnull, BOOL))selectModels;

/**!
 *  @author swp_song
 *
 *  @brief  selectModelsTableViewClickCell:    ( 点击 cell 回调 )
 *
 *  @param  selectModelsTableViewClickCell selectModelsTableViewClickCell
 */
- (void)selectModelsTableViewClickCell:(void (^ _Nullable)(SelectModelsTableView * _Nonnull selectModelsTableView, NSIndexPath * _Nonnull indexPath))selectModelsTableViewClickCell;


/**!
 *  @author swp_song
 *
 *  @brief  selectModelsTableViewClicEditingkCell:  ( cell 进入编辑状态，点击删除按钮 )
 *
 *  @param  selectModelsTableViewClicEditingkCell   selectModelsTableViewClicEditingkCell
 */
- (void)selectModelsTableViewClicEditingkCell:(void (^ _Nullable)(SelectModelsTableView * _Nonnull selectModelsTableView, NSIndexPath * _Nonnull indexPath))selectModelsTableViewClicEditingkCell;

@end
NS_ASSUME_NONNULL_END;
