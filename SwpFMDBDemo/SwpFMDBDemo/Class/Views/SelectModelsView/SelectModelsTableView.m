
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
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SelectModelsTableView

/**!
 *  @ author swp_song
 *
 *  @ brief  initWithFrame:style:    ( Override Init )
 *
 *  @ param  frame
 *
 *  @ param  style
 *
 *  @ return SelectModelsTableView
 */
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        [self registerClass:[SelectModelsCell class] forCellReuseIdentifier:kSelectModelsCellID];
        self.dataSource     = self;
        self.delegate       = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.rowHeight      = 50.f;
    }
    return self;
}

#pragma mark - UITableView DataSoure Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  numberOfSectionsInTableView: ( tableView 数据源方法 设置 tableView 分组个数 )
 *
 *  @ param  tableView
 *
 *  @ return NSInteger
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  tableView:numberOfRowsInSection: ( tableView 数据源方法 设置 tableView 分组中cell显示的个数 )
 *
 *  @ param  tableView
 *
 *  @ param  section
 *
 *  @ return NSInteger
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  tableView:cellForRowAtIndexPath: ( tableView 数据源方法 设置 tableView 分组中cell显示的数据 | 样式)
 *
 *  @ param  tableView
 *
 *  @ param  indexPath
 *
 *  @ return UITableViewCell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectModelsCell *cell = [SelectModelsCell selectModelsCellWithTableView:tableView forCellReuseIdentifier:kSelectModelsCellID];
    return cell.model(_datas[indexPath.row], indexPath);
}

#pragma mark - UITableView Delegate Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  tableView:didSelectRowAtIndexPath: ( tableView 代理方法 点击每个cell调用 )
 *
 *  @ param  tableView
 *
 *  @ param  indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectModelsTableViewClickCell) self.selectModelsTableViewClickCell(self, indexPath);
}


#pragma mark - Public Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  selectModels:  ( 设置 数据 )
 */
- (SelectModelsTableView *(^)(NSArray *selectModels))selectModels {
    
    return ^SelectModelsTableView *(NSArray *selectModels) {
        _datas = selectModels;
        [self insertRowsAtIndexPaths:[SwpFMDBDemoTools swpFMDBDemoToolsObtainDataIndexPath:selectModels] withRowAnimation:UITableViewRowAnimationFade];
        return self;
    };
}

/**!
 *  @ author swp_song
 *
 *  @ brief  selectModelsTableViewClickCell:    ( 点击 cell 回调 )
 *
 *  @ param  selectModelsTableViewClickCell
 */
- (void)selectModelsTableViewClickCell:(void (^)(SelectModelsTableView *selectModelsTableView, NSIndexPath *indexPath))selectModelsTableViewClickCell {
    _selectModelsTableViewClickCell = selectModelsTableViewClickCell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
