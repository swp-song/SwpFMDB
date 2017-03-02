//
//  SelectModelsViewController.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/3/2.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SelectModelsViewController.h"
/*! ---------------------- Tool       ---------------------- !*/
#import <Masonry/Masonry.h>
#import "SwpFMDBDemoTools.h"
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
    __weak typeof(self) vc = self;
    [SwpFMDBDemoTools swpFMDBDemoToolsExecuteInMainQueue:^{
        vc.selectModelsTableView.selectModels(vc.datas);
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
        vc.swpDataDisplayView.model(_datas[indexPath.row]);
        vc.swpDataDisplayView.swpDataDisplayViewShow();
    }];
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
