
//
//  SwpFMDBViewController.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBViewController.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpFMDBHeader.h"
#import <Masonry/Masonry.h>
#import "SwpFMDBDemoTools.h"
#import <SwpPopTools/SwpPopHeader.h>
#import <SVProgressHUD/SVProgressHUD.h>
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
#import "SwpFMDBModel.h"
#import "TestModel.h"
#import "CustomModel.h"
#import "InheritModel.h"
/*! ---------------------- Model      ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
#import "SwpFMDBTableView.h"
#import "SwpDataDisplayView.h"
/*! ---------------------- View       ---------------------- !*/

/*! ---------------------- Controller ---------------------- !*/
#import "SelectModelsViewController.h"
/*! ---------------------- Controller ---------------------- !*/


@interface SwpFMDBViewController ()

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
@property (nonatomic, strong) SwpFMDBTableView   *swpFMDBTableView;
@property (nonatomic, strong) SwpDataDisplayView *swpDataDisplayView;
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
@property (nonatomic, copy  ) NSArray     *datas;
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation SwpFMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUI];
    
    [self setData];
    
    [self swpFMDBViewControllerBlock];
    
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
    self.datas  = [self createDataSource];
    __weak typeof(self) vc = self;
    [SwpFMDBDemoTools swpFMDBDemoToolsExecuteInMainQueue:^{
        vc.swpFMDBTableView.swpFMDBDatas(vc.datas);
    } afterDelaySecs:0.5f];
}

#pragma mark - Set UI Methods
/**!
 *  @author swp_song
 *
 *  @brief  setUI   ( 设置 UI 控件 )
 */
- (void)setUI {
    
    self.navigationItem.title             = @"SwpFMDBDemo";
    self.view.backgroundColor             = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD setFadeOutAnimationDuration:1];
    
    [self setUpUI];
    
    [self setUIAutoLayout];
}

/**!
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {
    [self.view addSubview:self.swpFMDBTableView];
}

/**!
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
    
    [self.swpFMDBTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBViewControllerBlock ( 回调 )
 */
- (void)swpFMDBViewControllerBlock {
    
    [self swpFMDBTableViewBlock:_swpFMDBTableView];
    
    self.swpDataDisplayView.swpDataDisplayViewClickEvent = ^(SwpDataDisplayView *swpDataDisplayView) {
        swpDataDisplayView.swpDataDisplayViewHidden();
    };
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBTableViewBlock:  ( cell 点击 回调 )
 *
 *  @param  swpFMDBTableView    swpFMDBTableView
 */
- (void)swpFMDBTableViewBlock:(SwpFMDBTableView *)swpFMDBTableView {
    
    __weak typeof(self) vc = self;
    [swpFMDBTableView swpFMDBTableViewClickCell:^(SwpFMDBTableView * _Nonnull swpFMDBTableView, NSIndexPath * _Nonnull indexPath) {
        SwpFMDBModel *swpFMDB = vc.datas[indexPath.row];
        
        if (swpFMDB.swpFMDBOption) swpFMDB.swpFMDBOption(swpFMDB);
        
        if (!swpFMDB.swpFMDBJumpContriller) return;
        
        [vc jumpSelectModelViewController:swpFMDB.swpFMDBData modelClass:swpFMDB.swpFMDBSelectModelClass swpFMDBViewController:vc];

    }];
}


#pragma mark - Tools
/**!
 *  @author swp_song
 *
 *  @brief  showAlertViewControllerWihtModel:swpFMDBViewController:    ( 弹出单条数据显示 alert )
 *
 *  @param  model   model
 *
 *  @param  vc      vc
 */
- (void)showAlertViewControllerWihtModel:(id)model swpFMDBViewController:(SwpFMDBViewController *)vc {
    if (!model) {
        [SwpFMDBDemoTools swpFMDBDemoToolsShowDataIsEmptyDataAlert:vc.navigationController];
        return;
    }
    
    [SwpFMDBDemoTools swpFMDBDemoToolsShowDatabaseOperationCompletedAlert:vc.navigationController clickSeeBlock:^{
        [vc showSwpDataDisplayViewWihtModel:model swpFMDBViewController:vc];
    }];
}

/**!
 *  @author swp_song
 *
 *  @brief  showSwpDataDisplayViewWihtModel:swpFMDBViewController: ( 显示展示单条数据 view )
 *
 *  @param  model   model
 *
 *  @param  vc      vc
 */
- (void)showSwpDataDisplayViewWihtModel:(id)model swpFMDBViewController:(SwpFMDBViewController *)vc {
    
    if (!model) {
        [SVProgressHUD showInfoWithStatus:@"数据不存在"];
        return;
    }
    
    vc.swpDataDisplayView.model(model);
    vc.swpDataDisplayView.swpDataDisplayViewShow();
}

/**!
 *  @author swp_song
 *
 *  @brief  showAlertViewControllerWihtModels:modelClass:swpFMDBViewController:    ( 弹出多条数据显示 alert )
 *
 *  @param  datas       datas
 *
 *  @param  modelClass  modelClass
 *
 *  @param  vc          vc
 */
- (void)showAlertViewControllerWihtModels:(NSArray *)datas modelClass:(Class)modelClass swpFMDBViewController:(SwpFMDBViewController *)vc {
    
    if (!datas || datas.count == 0) {
        [SwpFMDBDemoTools swpFMDBDemoToolsShowDataIsEmptyDataAlert:vc.navigationController];
        return;
    }
    
    [SwpFMDBDemoTools swpFMDBDemoToolsShowDatabaseOperationCompletedAlert:vc.navigationController clickSeeBlock:^{
        [vc jumpSelectModelViewController:datas modelClass:modelClass swpFMDBViewController:vc];
    }];
}

/**!
 *  @author swp_song
 *
 *  @brief  jumpSelectModelViewController:modelClass:swpFMDBViewController: ( 跳转 SelectModelsViewController 控制器 )
 *
 *  @param  datas       datas
 *
 *  @param  modelClass  modelClass
 *
 *  @param  vc          vc
 */
- (void)jumpSelectModelViewController:(NSArray *)datas modelClass:(Class)modelClass swpFMDBViewController:(SwpFMDBViewController *)vc {
    SelectModelsViewController *selectModelsViewController = [SelectModelsViewController new];
    [vc.navigationController pushViewController:selectModelsViewController.models(datas, modelClass) animated:YES];
}



#pragma mark - SwpFMDB
/**!
 *  @author swp_song
 *
 *  @brief  insterDataWithModel:    ( 插入单条数据  )
 *
 *  @param  model   model
 *
 *  @return BOOL
 */
- (BOOL)insterDataWithModel:(id)model {
    __block BOOL result = NO;
    [[SwpFMDB shareManager] swpFMDBInsertModel:model swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"插入成功" : @"插入失败");
    }];
    return result;
}

/**!
 *  @author swp_song
 *
 *  @brief  insterDataWithModels:   ( 插入一组数据  )
 *
 *  @param  models  models
 *
 *  @return BOOL
 */
- (BOOL)insterDataWithModels:(NSArray *)models {
    
    __block BOOL result = NO;
    if (!models || models.count == 0) return result;
    [[SwpFMDB shareManager] swpFMDBInsertModels:models swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"批量插入成功" : @"批量插入失败");
    }];
    return result;
}

/**!
 *  @author swp_song
 *
 *  @brief  updateDataWithModel:    ( 修改单条数据 )
 *
 *  @param  model   model
 *
 *  @return BOOL
 */
- (BOOL)updateDataWithModel:(id)model {
    __block BOOL result = NO;
    
    [[SwpFMDB shareManager] swpFMDBUpdateModel:model swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"修改成功" : @"修改失败");
    }];
    
    return result;
}

/**!
 *  @author swp_song
 *
 *  @brief  updateDataWithModels:   ( 修改一组数据  )
 *
 *  @param  models  models
 *
 *  @return BOOL
 */
- (BOOL)updateDataWithModels:(NSArray *)models {
    __block BOOL result = NO;
    if (!models || models.count == 0) return result;
    
    [[SwpFMDB shareManager] swpFMDBUpdateModels:models swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
        NSLog(@"%@", result ? @"批量修改成功" : @"批量修改失败");
    }];
    
    return result;
}

/**!
 *  @author swp_song
 *
 *  @brief  selelctDataWihtModelClass:  ( 查询单条数据 )
 *
 *  @param modelClass   modelClass
 *
 *  @param swpDBID      swpDBID
 *
 *  @return id
 */
- (id)selelctDataWihtModelClass:(Class)modelClass bySwpDBID:(NSString *)swpDBID {
    __block id selectModel = nil;
    [[SwpFMDB shareManager] swpFMDBSelectModel:modelClass bySwpDBID:swpDBID swpFMDBExecutionSelectModelComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus, id  _Nonnull model) {
        selectModel = model;
    }];
    return selectModel;
}

/**!
 *  @author swp_song
 *
 *  @brief  selelctDatasWihtModelClass: ( 查询全部数据 )
 *
 *  @param  modelClass  modelClass
 *
 *  @return NSArray
 */
- (NSArray *)selelctDatasWihtModelClass:(Class)modelClass {
    __block NSArray *selectModels = [NSArray array];
    [[SwpFMDB shareManager] swpFMDBSelectModels:modelClass swpFMDBExecutionSelectModelsComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus, NSArray * _Nonnull models) {
        selectModels = models;
    }];
    return selectModels;
}


/**!
 *  @author swp_song
 *
 *  @brief  delegteTable:   ( 删除表 )
 *
 *  @param  table   table
 *
 *  @return BOOL
 */
- (BOOL)delegteTable:(Class)table {
    __block BOOL result = NO;
    [[SwpFMDB shareManager] swpFMDBDeleteTable:table swpFMDBExecutionUpdateComplete:^(SwpFMDB * _Nonnull swpFMDB, BOOL executionStatus) {
        result = executionStatus;
    }];
    return result;
}


#pragma mark - Init UI Methods
- (SwpFMDBTableView *)swpFMDBTableView {
    
    return !_swpFMDBTableView ? _swpFMDBTableView = ({
        SwpFMDBTableView *swpFMDBTableView = [[SwpFMDBTableView alloc] init];
        swpFMDBTableView;
    }) : _swpFMDBTableView;
}

- (SwpDataDisplayView *)swpDataDisplayView {
    return !_swpDataDisplayView ? _swpDataDisplayView = ({
        SwpDataDisplayView *swpDataDisplayView = [[SwpDataDisplayView alloc] initWithFrame:self.view.frame];
        swpDataDisplayView;
    }) : _swpDataDisplayView;
}

#pragma mark - Init Data Methods
- (NSArray *)createDataSource {
    
    __weak typeof(self) vc = self;
    
    // CustomModel 插入单条数据
    SwpFMDBModel *customInsterModel     = [SwpFMDBModel swpFMDBWithTitle:@" CustomModel 插入单条数据 " setSwpFMDBSubTitle:@" Insert CustomModel Data "  setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        
        if (![vc insterDataWithModel:[CustomModel customInsterModelData]]) {
            NSLog(@"插入数据失败");
            return;
        }
        [vc showAlertViewControllerWihtModel:[vc selelctDataWihtModelClass:[CustomModel class] bySwpDBID:@"100"] swpFMDBViewController:vc];
        
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[CustomModel class]];
    
    
    // CustomModel 插入一组数据
    SwpFMDBModel *customInsterModels    = [SwpFMDBModel swpFMDBWithTitle:@" CustomModel 插入一组数据 " setSwpFMDBSubTitle:@" Insert a set of CustomModel " setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        if (![vc insterDataWithModels:[CustomModel customInsterModelDatas]]) {
            NSLog(@"批量插入数据失败");
            return;
        }
        
        [vc showAlertViewControllerWihtModels:[vc selelctDatasWihtModelClass:swpFMDBModel.swpFMDBSelectModelClass] modelClass:swpFMDBModel.swpFMDBSelectModelClass swpFMDBViewController:vc];
        
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[CustomModel class]];
    
    
    // CustomModel 更新单条数据
    SwpFMDBModel *customUpdateModel     = [SwpFMDBModel swpFMDBWithTitle:@"CustomModel 更新单条数据" setSwpFMDBSubTitle:@"Update CustomModel Data" setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        
        if (![vc updateDataWithModel:[CustomModel customUpdateModelData]]) {
            [SVProgressHUD showInfoWithStatus:@"修改数据失败，可能数据不存在"];
            return;
        }
        [vc showAlertViewControllerWihtModel:[vc selelctDataWihtModelClass:[CustomModel class] bySwpDBID:@"100"] swpFMDBViewController:vc];
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[CustomModel class]];
    
    
    // CustomModel 更新一组数据
    SwpFMDBModel *customUpdateModels    = [SwpFMDBModel swpFMDBWithTitle:@"CustomModel 更新一组数据 " setSwpFMDBSubTitle:@" Update a set of CustomModels " setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        
        if (![vc updateDataWithModels:[CustomModel customUpdateModelDatas]]) {
            [SVProgressHUD showInfoWithStatus:@"CustomModel 批量更新数据失败，可能数据不存在"];
            return;
        }
        
        [vc showAlertViewControllerWihtModels:[vc selelctDatasWihtModelClass:[CustomModel class]] modelClass:swpFMDBModel.swpFMDBSelectModelClass swpFMDBViewController:vc];
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[CustomModel class]];
    
    // CustomModel 查询单条数据
    SwpFMDBModel *customSelectModel     = [SwpFMDBModel swpFMDBWithTitle:@"CustomModel 查询单条数据  " setSwpFMDBSubTitle:@" Select CustomModel Data " setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        [vc showSwpDataDisplayViewWihtModel:[vc selelctDataWihtModelClass:[CustomModel class] bySwpDBID:@"100"] swpFMDBViewController:vc];
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[CustomModel class]];
    
    // CustomModel 查询全部数据
    SwpFMDBModel *customSelectModels    = [SwpFMDBModel swpFMDBWithTitle:@"CustomModel 查询全部数据 " setSwpFMDBSubTitle:@" Select a set of CustomModels " setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        swpFMDBModel.swpFMDBData = [vc selelctDatasWihtModelClass:[CustomModel class]];
    } setSwpFMDBJumpContriller:[SelectModelsViewController class] setSelectModelClass:[CustomModel class]];
    
    
    SwpFMDBModel *customDeleteTable    = [SwpFMDBModel swpFMDBWithTitle:@"CustomModel 删除表 " setSwpFMDBSubTitle:@" Delete a CustomModel Table " setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        [SVProgressHUD dismiss];
        if ([vc delegteTable:CustomModel.class]) {
            [SVProgressHUD showInfoWithStatus:@"删除成功"];
            return;
        }
        [SVProgressHUD showInfoWithStatus:@"删除失败, 该表不存在"];
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[CustomModel class]];
    
    
    // InheritModel 插入单条数据
    SwpFMDBModel *inheritInsterModel     = [SwpFMDBModel swpFMDBWithTitle:@" InheritModel 插入单条数据 " setSwpFMDBSubTitle:@"Insert InheritModel Data"  setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        if (![vc insterDataWithModel:[InheritModel inheritInsterModelData]]) {
            NSLog(@"插入数据失败");
            return;
        }
        [vc showAlertViewControllerWihtModel:[vc selelctDataWihtModelClass:[InheritModel class] bySwpDBID:@"200"] swpFMDBViewController:vc];
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[InheritModel class]];
    
    // InheritModel 插入一组数据
    SwpFMDBModel *inheritInsterModels    = [SwpFMDBModel swpFMDBWithTitle:@" InheritModel 插入一组数据 " setSwpFMDBSubTitle:@" Insert a set of InheritModel "  setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        if (![vc insterDataWithModels:[InheritModel inheritInsterModelDatas]]) {
            NSLog(@"批量插入数据失败");
            return;
        }
        
        [vc showAlertViewControllerWihtModels:[vc selelctDatasWihtModelClass:[InheritModel class]] modelClass:swpFMDBModel.swpFMDBSelectModelClass swpFMDBViewController:vc];
    
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[InheritModel class]];
    
    // InheritModel 更新单条数据
    SwpFMDBModel *inheritUpdateModel     = [SwpFMDBModel swpFMDBWithTitle:@" InheritModel 更新单条数据 " setSwpFMDBSubTitle:@" Update InheritModel Data "  setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        
        if (![vc updateDataWithModel:[InheritModel inheritUpdateModelData]]) {
            [SVProgressHUD showInfoWithStatus:@"InheritModel 更新数据失败，可能数据不存在"];
            return;
        }
        [vc showAlertViewControllerWihtModel:[vc selelctDataWihtModelClass:[InheritModel class] bySwpDBID:@"200"] swpFMDBViewController:vc];
        
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[InheritModel class]];
    
    // InheritModel 更新一组数据
    SwpFMDBModel *inheritUpdateModels    = [SwpFMDBModel swpFMDBWithTitle:@" InheritModel 更新一组数据 " setSwpFMDBSubTitle:@" Update a set of InheritModel " setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        
        if (![vc updateDataWithModels:[InheritModel inheritUpdateModelDatas]]) {
            [SVProgressHUD showInfoWithStatus:@"InheritModel 批量更新数据失败，可能数据不存在"];
            return;
        }
        
        [vc showAlertViewControllerWihtModels:[vc selelctDatasWihtModelClass:[InheritModel class]] modelClass:swpFMDBModel.swpFMDBSelectModelClass swpFMDBViewController:vc];
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[InheritModel class]];
    
    
    // InheritModel 查询单条数据
    SwpFMDBModel *inheritSelectModel     = [SwpFMDBModel swpFMDBWithTitle:@" InheritModel 查询单条数据 " setSwpFMDBSubTitle:@" elect InheritModel Data  "  setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        [vc showSwpDataDisplayViewWihtModel:[vc selelctDataWihtModelClass:[InheritModel class] bySwpDBID:@"200"] swpFMDBViewController:vc];
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[InheritModel class]];
    
    // InheritModel 查询全部数据
    SwpFMDBModel *inheritSelectModels    = [SwpFMDBModel swpFMDBWithTitle:@" InheritModel 查询全部数据 " setSwpFMDBSubTitle:@" Select a set of InheritModel  "  setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        swpFMDBModel.swpFMDBData = [vc selelctDatasWihtModelClass:[InheritModel class]];
    } setSwpFMDBJumpContriller:[SelectModelsViewController class] setSelectModelClass:[InheritModel class]];
    
    
    SwpFMDBModel *inheritDeleteTable    = [SwpFMDBModel swpFMDBWithTitle:@"InheritModel 删除表 " setSwpFMDBSubTitle:@" Delete a InheritModel Table " setSwpFMDBOption:^(SwpFMDBModel * _Nonnull swpFMDBModel) {
        [SVProgressHUD dismiss];
        if ([vc delegteTable:InheritModel.class]) {
            [SVProgressHUD showInfoWithStatus:@"删除成功"];
            return;
        }
        [SVProgressHUD showInfoWithStatus:@"删除失败, 该表不存在"];
    } setSwpFMDBJumpContriller:nil setSelectModelClass:[InheritModel class]];
    
    return @[customInsterModel, customInsterModels, customUpdateModel, customUpdateModels, customSelectModel, customSelectModels, customDeleteTable, inheritInsterModel, inheritInsterModels, inheritUpdateModel, inheritUpdateModels, inheritSelectModel, inheritSelectModels, inheritDeleteTable];
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
