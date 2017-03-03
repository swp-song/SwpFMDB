//
//  SelectModelsViewController.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/3/2.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SelectModelsViewController.h"
/*! ---------------------- Tool       ---------------------- !*/
#import "SwpFMDBHeader.h"
#import <Masonry/Masonry.h>
#import "SwpFMDBDemoTools.h"
#import <SVProgressHUD/SVProgressHUD.h>
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
/*! ---------------------- Model      ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
#import "SwpDataDisplayView.h"
#import "SelectModelsTableView.h"
/*! ---------------------- View       ---------------------- !*/

/*! ---------------------- Controller ---------------------- !*/
/*! ---------------------- Controller ---------------------- !*/

@interface SelectModelsViewController ()

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
@property (nonatomic, strong) SelectModelsTableView *selectModelsTableView;
@property (nonatomic, strong) SwpDataDisplayView    *swpDataDisplayView;
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
@property (nonatomic, copy) NSArray *datas;
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SelectModelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUI];
    
    [self setData];
    
    [self selectModelsViewControllerBlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setData ( 设置 初始化 数据 )
 */
- (void)setData {

    
    [self setSelectModelsTableViewData:self.datas isAnimationReloadData:YES];
}

- (void)setSelectModelsTableViewData:(NSArray *)data isAnimationReloadData:(BOOL)isAnimationReloadData {
    __weak typeof(self) vc = self;
    [SwpFMDBDemoTools swpFMDBDemoToolsExecuteInMainQueue:^{
        vc.selectModelsTableView.selectModels(data, isAnimationReloadData);
    } afterDelaySecs:0.5f];
}

#pragma mark - Set UI Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  setUI ( 设置 UI 控件 )
 */
- (void)setUI {

    self.view.backgroundColor             = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    [self setUpUI];
    
    [self setUIAutoLayout];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
    [self.view addSubview:self.selectModelsTableView];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
 
    [self.selectModelsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  selectModelsViewControllerBlock    ( block 回调 )
 */
- (void)selectModelsViewControllerBlock {
    [self selectModelsTableViewBlock:_selectModelsTableView];
    
    self.swpDataDisplayView.swpDataDisplayViewClickEvent = ^(SwpDataDisplayView *swpDataDisplayView) {
        swpDataDisplayView.swpDataDisplayViewHidden();
    };
}


/**!
 *  @ author swp_song
 *
 *  @ brief  selectModelsTableViewBlock:    ( 点击 cell 回调 )
 *
 *  @ param  selectModelsTableView
 */
- (void)selectModelsTableViewBlock:(SelectModelsTableView *)selectModelsTableView {
    
    __weak typeof(self) vc = self;
    [selectModelsTableView selectModelsTableViewClickCell:^(SelectModelsTableView * _Nonnull selectModelsTableView, NSIndexPath * _Nonnull indexPath) {
        vc.swpDataDisplayView.model(vc.datas[indexPath.row]);
        vc.swpDataDisplayView.swpDataDisplayViewShow();
    }];
    
    
    
    [selectModelsTableView selectModelsTableViewClicEditingkCell:^(SelectModelsTableView * _Nonnull selectModelsTableView, NSIndexPath * _Nonnull indexPath) {

        
        id model = vc.datas[indexPath.row];
        if (![vc deleteDataWihtModelClass:model]) {
            [SVProgressHUD showInfoWithStatus:@"删除数据失败"];
            return;
        }
        
        [SVProgressHUD showInfoWithStatus:@"删除数据成功"];
        
        vc.datas = [vc selelctDatasWihtModelClass:[model class]];
        
        // isAnimationReloadData NO
        [vc setSelectModelsTableViewData:vc.datas isAnimationReloadData:NO];
    }];
}


- (BOOL)deleteDataWihtModelClass:(id)model {
    __block BOOL result = NO;
    [[SwpFMDB shareManager] swpFMDBDelegateModel:model swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"删除数据成功" : @"删除数据失败");
    }];
    return YES;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  selelctDatasWihtModelClass: ( 查询 全部 数据  )
 *
 *  @ param modelClass
 *
 *  @ return NSArray
 */
- (NSArray *)selelctDatasWihtModelClass:(Class)modelClass {
    __block NSArray *selectModels = [NSArray array];
    [[SwpFMDB shareManager] swpFMDBSelectModels:modelClass swpFMDBExecutionSelectModelsComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus, NSArray * _Nonnull models) {
        selectModels = models;
    }];
    return selectModels;
}


#pragma mark - Public Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  models:    ( 设置 数据 )
 */
- (SelectModelsViewController *(^)(NSArray *models))models {
    
    return ^SelectModelsViewController *(NSArray *models) {
        _datas = models;
        return self;
    };
}
#pragma mark - Init UI Methods
- (SelectModelsTableView *)selectModelsTableView {
    
    return !_selectModelsTableView ? _selectModelsTableView = ({
        SelectModelsTableView *selectModelsTableView = [SelectModelsTableView new];
        selectModelsTableView;
    }) : _selectModelsTableView;
}

- (SwpDataDisplayView *)swpDataDisplayView {
    return !_swpDataDisplayView ? _swpDataDisplayView = ({
        SwpDataDisplayView *swpDataDisplayView = [[SwpDataDisplayView alloc] initWithFrame:self.view.frame];
        swpDataDisplayView;
    }) : _swpDataDisplayView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
