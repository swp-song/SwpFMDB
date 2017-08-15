
//
//  SelectModelsTableView.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/3/2.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SelectModelsTableView.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpFMDBDemoTools.h"
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
/*! ---------------------- Model      ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
#import "SelectModelsCell.h"
/*! ---------------------- View       ---------------------- !*/

static NSString * const kSelectModelsCellID = @" Select Models Cell ID ";

@interface SelectModelsTableView () <UITableViewDataSource, UITableViewDelegate>
#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
/*! 数据源  !*/
@property (nonatomic, copy) NSArray *datas;
/*! 点击 cell 回调  !*/
@property (nonatomic, copy, setter = selectModelsTableViewClickCell:) void(^selectModelsTableViewClickCell)(SelectModelsTableView *selectModelsTableView, NSIndexPath *indexPath);

/*! 点击 编辑 cell  !*/
@property (nonatomic, copy, setter = selectModelsTableViewClicEditingkCell:) void(^selectModelsTableViewClicEditingkCell)(SelectModelsTableView *selectModelsTableView, NSIndexPath *indexPath);
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SelectModelsTableView

/**!
 *  @author swp_song
 *
 *  @brief  initWithFrame:style:    ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @param  style   style
 *
 *  @return UITableView
 */
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        [self registerClass:[SelectModelsCell class] forCellReuseIdentifier:kSelectModelsCellID];
        self.dataSource     = self;
        self.delegate       = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.allowsMultipleSelectionDuringEditing = YES;
        self.rowHeight      = 50.f;
    }
    return self;
}

#pragma mark - UITableView DataSoure Methods
/**!
 *  @author swp_song
 *
 *  @brief  numberOfSectionsInTableView:    ( tableView 数据源方法 设置 tableView 分组个数 )
 *
 *  @param  tableView  tableView
 *
 *  @return NSInteger
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/**!
 *  @author swp_song
 *
 *  @brief  tableView:numberOfRowsInSection:    ( tableView 数据源方法 设置 tableView 分组中cell显示的个数 )
 *
 *  @param  tableView   tableView
 *
 *  @param  section     section
 *
 *  @return NSInteger
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

/**!
 *  @author swp_song
 *
 *  @brief  tableView:cellForRowAtIndexPath:    ( tableView 数据源方法设置 tableView 分组中cell显示的数据 | 样式)
 *
 *  @param  tableView   tableView
 *
 *  @param  indexPath   indexPath
 *
 *  @return UITableViewCell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SelectModelsCell.selectModelsCellInit(tableView, kSelectModelsCellID).model(_datas[indexPath.row], indexPath);
}

#pragma mark - UITableView Delegate Methods
/**!
 *  @author swp_song
 *
 *  @brief  tableView:didSelectRowAtIndexPath:  ( tableView 代理方法点击每个 cell 调用 )
 *
 *  @param  tableView   tableView
 *
 *  @param  indexPath   indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.isEditing) {
        return;
    }
    if (self.selectModelsTableViewClickCell) self.selectModelsTableViewClickCell(self, indexPath);

}


/**!
 *  @author swp_song
 *
 *  @brief  tableView:didSelectRowAtIndexPath: ( tableView 代理方法 cell 是否可以编辑 )
 *
 *  @param tableView    tableView
 *
 *  @param indexPath    indexPath
 *
 *  @return BOOL
 */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


/**!
 *  @author swp_song
 *
 *  @brief  tableView:editingStyleForRowAtIndexPath:   ( tableView 代理方法 cell 编辑样式 )
 *
 *  @param  tableView   tableView
 *
 *  @param  indexPath   indexPath
 *
 *  @return UITableViewCellEditingStyle
 */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

/**!
 *  @author swp_song
 *
 *  @brief  tableView:editingStyleForRowAtIndexPath:   ( tableView 代理方法 cell 点击编辑按钮 )
 *
 *  @param  tableView       tableView
 *
 *  @param  editingStyle    editingStyle
 *
 *  @param  indexPath       indexPath
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (self.selectModelsTableViewClicEditingkCell) self.selectModelsTableViewClicEditingkCell(self, indexPath);
    }
}



#pragma mark - Public Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  selectModels:  ( 设置数据 )
 */
- (SelectModelsTableView * _Nonnull (^)(NSArray * _Nonnull, BOOL))selectModels {
    
    return ^SelectModelsTableView *(NSArray *selectModels, BOOL isAnimationReloadData) {
        _datas = selectModels;
        
        if (isAnimationReloadData) {
            [self insertRowsAtIndexPaths:[SwpFMDBDemoTools swpFMDBDemoToolsObtainDataIndexPath:selectModels] withRowAnimation:UITableViewRowAnimationFade];
        } else {
            [self reloadData];
        }
        return self;
    };
}

/**!
 *  @author swp_song
 *
 *  @brief  selectModelsTableViewClickCell:    ( 点击 cell 回调 )
 *
 *  @param  selectModelsTableViewClickCell selectModelsTableViewClickCell
 */
- (void)selectModelsTableViewClickCell:(void (^)(SelectModelsTableView * _Nonnull selectModelsTableView, NSIndexPath * _Nonnull indexPath))selectModelsTableViewClickCell {
    _selectModelsTableViewClickCell = selectModelsTableViewClickCell;
}

/**!
 *  @author swp_song
 *
 *  @brief  selectModelsTableViewClicEditingkCell:  ( cell 进入编辑状态，点击删除按钮 )
 *
 *  @param  selectModelsTableViewClicEditingkCell   selectModelsTableViewClicEditingkCell
 */
- (void)selectModelsTableViewClicEditingkCell:(void (^)(SelectModelsTableView * _Nonnull selectModelsTableView, NSIndexPath * _Nonnull indexPath))selectModelsTableViewClicEditingkCell {
    _selectModelsTableViewClicEditingkCell  = selectModelsTableViewClicEditingkCell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
