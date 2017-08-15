//
//  SwpFMDBTableView.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBTableView.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpFMDBDemoTools.h"
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
#import "SwpFMDBCell.h"
/*! ---------------------- View       ---------------------- !*/


@interface SwpFMDBTableView () <UITableViewDataSource, UITableViewDelegate>
#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
/*! 数据源  !*/
@property (nonatomic, copy) NSArray *datas;
/*! 点击 cell 回调  !*/
@property (nonatomic, copy, setter = swpFMDBTableViewClickCell:) void(^swpFMDBTableViewClickCell)(SwpFMDBTableView *swpFMDBTableView, NSIndexPath *indexPath);
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SwpFMDBTableView

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
        
        [self registerClass:[SwpFMDBCell class] forCellReuseIdentifier:NSStringFromClass(SwpFMDBCell.class)];
        self.dataSource     = self;
        self.delegate       = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    return SwpFMDBCell.swpFMDBCellInit(tableView, NSStringFromClass(SwpFMDBCell.class)).swpFMDB(_datas[indexPath.row], indexPath);
}

#pragma mark - UITableView Delegate Methods
/**!
 *  @author swp_song
 *
 *  @brief  tableView:didSelectRowAtIndexPath:  ( tableView 代理方法 点击每个 cell 调用 )
 *
 *  @param  tableView   tableView
 *
 *  @param  indexPath   indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.swpFMDBTableViewClickCell) self.swpFMDBTableViewClickCell(self, indexPath);
    
}

#pragma mark - Public Methods
/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBDatas    ( 设置数据 )
 */
- (SwpFMDBTableView * _Nonnull (^)(NSArray * _Nonnull))swpFMDBDatas {
    return ^SwpFMDBTableView *(NSArray *swpFMDBDatas) {
        _datas = swpFMDBDatas;
        [self insertRowsAtIndexPaths:[SwpFMDBDemoTools swpFMDBDemoToolsObtainDataIndexPath:swpFMDBDatas] withRowAnimation:UITableViewRowAnimationFade];
        return self;
    };
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBTableViewClickCell:  ( 点击 cell 回调 )
 *
 *  @param  swpFMDBTableViewClickCell   swpFMDBTableViewClickCell
 */
- (void)swpFMDBTableViewClickCell:(void (^)(SwpFMDBTableView * _Nonnull swpFMDBTableView, NSIndexPath * _Nonnull indexPath))swpFMDBTableViewClickCell {
    
    _swpFMDBTableViewClickCell = swpFMDBTableViewClickCell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
