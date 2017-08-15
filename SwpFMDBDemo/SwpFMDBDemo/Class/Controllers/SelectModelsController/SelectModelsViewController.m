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
@property (nonatomic, copy  ) NSArray *datas;
@property (nonatomic, assign) Class   modelClass;
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
 *  @author swp_song
 *
 *  @brief  setData ( 设置初始化数据 )
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
 *  @author swp_song
 *
 *  @brief  setUI   ( 设置 UI 控件 )
 */
- (void)setUI {

    self.view.backgroundColor               = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem   = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UIBarButtonItem *deleteRandomButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除随机数据" style:UIBarButtonItemStylePlain target:self action:@selector(deleteRandomData:)];
    UIBarButtonItem *clearButtonItem        = [[UIBarButtonItem alloc] initWithTitle:@"清空数据" style:UIBarButtonItemStylePlain target:self action:@selector(clearData:)];
    
    self.navigationItem.rightBarButtonItems = @[clearButtonItem, deleteRandomButtonItem];
    
    [self setUpUI];
    
    [self setUIAutoLayout];
}

/**!
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
    [self.view addSubview:self.selectModelsTableView];
}

/**!
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
 
    [self.selectModelsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


/**!
 *  @author swp_song
 *
 *  @brief  deleteRandomData:   ( 删除随机, 数据按钮绑定方 )
 *
 *  @param  button  button
 */
- (void)deleteRandomData:(UIButton *)button {
    
    
    NSArray *models = [self createRandom:self.datas];
    if (!models.count) {
        [SVProgressHUD showInfoWithStatus:@"生成数据数为空，数据为空"];
        return;
    }
    
    [self deleteDataWihtModels:models];
    self.datas = [self selelctDatasWihtModels:_modelClass];
    [self setSelectModelsTableViewData:self.datas isAnimationReloadData:NO];
    
}

/**!
 *  @author swp_song
 *
 *  @brief  clearData:  ( 清空数据，按钮绑定方法 )
 *
 *  @param  button  button
 */
- (void)clearData:(UIButton *)button {
    
    if (!self.datas.count) {
        [SVProgressHUD showInfoWithStatus:@"数据为空"];
        return;
    }
    [self clearDataWihtModel:_modelClass];
    self.datas = [self selelctDatasWihtModels:_modelClass];
    [self setSelectModelsTableViewData:self.datas isAnimationReloadData:NO];
}


/**!
 *  @author swp_song
 *
 *  @brief  selectModelsViewControllerBlock ( block 回调 )
 */
- (void)selectModelsViewControllerBlock {
    [self selectModelsTableViewBlock:_selectModelsTableView];
    
    self.swpDataDisplayView.swpDataDisplayViewClickEvent = ^(SwpDataDisplayView *swpDataDisplayView) {
        swpDataDisplayView.swpDataDisplayViewHidden();
    };
}


/**!
 *  @author swp_song
 *
 *  @brief  selectModelsTableViewBlock: ( 点击 cell 回调 )
 *
 *  @param  selectModelsTableView   selectModelsTableView
 */
- (void)selectModelsTableViewBlock:(SelectModelsTableView *)selectModelsTableView {
    
    __weak typeof(self) vc = self;
    [selectModelsTableView selectModelsTableViewClickCell:^(SelectModelsTableView * _Nonnull selectModelsTableView, NSIndexPath * _Nonnull indexPath) {
        vc.swpDataDisplayView.model(vc.datas[indexPath.row]);
        vc.swpDataDisplayView.swpDataDisplayViewShow();
    }];
    
    
    
    [selectModelsTableView selectModelsTableViewClicEditingkCell:^(SelectModelsTableView * _Nonnull selectModelsTableView, NSIndexPath * _Nonnull indexPath) {
        
        id model = vc.datas[indexPath.row];
        if (![vc deleteDataWihtModel:model]) {
            [SVProgressHUD showInfoWithStatus:@"删除数据失败"];
            return;
        }
        
        [SVProgressHUD showInfoWithStatus:@"删除数据成功"];
        
        vc.datas = [vc selelctDatasWihtModels:[model class]];
        
        // isAnimationReloadData NO
        [vc setSelectModelsTableViewData:vc.datas isAnimationReloadData:NO];
    }];
}

#pragma mark - SwpFMDB Methods
/**!
 *  @author swp_song
 *
 *  @brief  deleteDataWihtModel:    ( 删除 单条 数据 )
 *
 *  @param  model   model
 *
 *  @return BOOL
 */
- (BOOL)deleteDataWihtModel:(id)model {
    __block BOOL result = NO;
    [[SwpFMDB shareManager] swpFMDBDelegateModel:model swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"删除数据成功" : @"删除数据失败");
    }];
    return YES;
}

/**!
 *  @author swp_song
 *
 *  @brief  deleteDataWihtModels:   ( 删除，一组数据 )
 *
 *  @param  models  models
 *
 *  @return BOOL
 */
- (BOOL)deleteDataWihtModels:(NSArray *)models {

    __block BOOL result = NO;
    [[SwpFMDB shareManager] swpFMDBDelegateModels:models swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"删除数据成功" : @"删除数据失败");
    }];
    return result;
}


/**!
 *  @author swp_song
 *
 *  @brief  deleteDataWihtModels:   ( 清除全部数据 )
 *
 *  @param  modelClass  modelClass
 *
 *  @return BOOL
 */
- (BOOL)clearDataWihtModel:(Class)modelClass {
    
    __block BOOL result = NO;
    [[SwpFMDB shareManager] swpFMDBClearModel:modelClass swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"删除数据成功" : @"删除数据失败");
    }];
    return result;
}

/**!
 *  @author swp_song
 *
 *  @brief  selelctDatasWihtModels: ( 查询全部数据  )
 *
 *  @param  modelClass  modelClass
 *
 *  @return NSArray
 */
- (NSArray *)selelctDatasWihtModels:(Class)modelClass {
    __block NSArray *selectModels = [NSArray array];
    [[SwpFMDB shareManager] swpFMDBSelectModels:modelClass swpFMDBExecutionSelectModelsComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus, NSArray * _Nonnull models) {
        selectModels = models;
    }];
    return selectModels;
}


/**!
 *  @author swp_song
 *
 *  @brief  createRandom:   ( 生成一组随机数据  )
 v
 *  @param  datas   datas
 *
 *  @return NSArray
 */
- (NSArray *)createRandom:(NSArray *)datas {
    
    if (!datas.count) return [NSArray array];
    //随机数从这里边产生
    NSMutableArray *startArray  = [NSMutableArray arrayWithArray:datas];
    
    //随机数产生结果
    NSMutableArray *resultArray = [NSMutableArray array];
    
    //随机数个数
    for (int i = 0; i < arc4random() % datas.count; i++) {
        int type = arc4random() % startArray.count;
        resultArray[i]    = startArray[type];
        startArray[type]  = [startArray lastObject]; //为更好的乱序，故交换下位置
        [startArray removeLastObject];
    }
    return resultArray;
}


#pragma mark - Public Methods
/**!
 *  @author swp_song
 *
 *  @brief  models: ( 设置数据 )
 */
- (SelectModelsViewController * _Nonnull (^)(NSArray * _Nonnull, Class  _Nonnull __unsafe_unretained))models {

    return ^SelectModelsViewController *(NSArray *models, Class modelClass) {
        _datas      = models;
        _modelClass = modelClass;
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
