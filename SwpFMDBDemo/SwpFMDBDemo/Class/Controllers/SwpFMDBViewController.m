
//
//  SwpFMDBViewController.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBViewController.h"

#import "SwpFMDBHeader.h"

#import "SwpFMDBModel.h"

#import "TestModel.h"
#import "CustomModel.h"
#import "InheritModel.h"

#import "SwpFMDBTableView.h"

@interface SwpFMDBViewController ()

@property (nonatomic, copy) NSArray *datas;

@property (nonatomic, strong) SwpFMDBTableView *swpFMDBTableView;

@end

@implementation SwpFMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"SwpFMDBDemo";
    
    [self.view addSubview:self.swpFMDBTableView];
    
    self.swpFMDBTableView.swpFMDBDatas([self createDataSource]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSArray *)createDataSource {
    
    return @[[self createCustomDataSource], [self createInheritDataSource]];
}


- (SwpFMDBTableView *)swpFMDBTableView {

    return !_swpFMDBTableView ? _swpFMDBTableView = ({
        SwpFMDBTableView *swpFMDBTableView = [[SwpFMDBTableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        swpFMDBTableView;
    }) : _swpFMDBTableView;
}


- (NSArray *)createCustomDataSource {
    
    SwpFMDBModel *customInsterModel     = [SwpFMDBModel swpFMDBWithTitle:@" Insert custom model data " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    SwpFMDBModel *customInsterModels    = [SwpFMDBModel swpFMDBWithTitle:@" Insert a set of custom models " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    SwpFMDBModel *customUpdateModel     = [SwpFMDBModel swpFMDBWithTitle:@" Update custom model data " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    
    SwpFMDBModel *customUpdateModels    = [SwpFMDBModel swpFMDBWithTitle:@" Update a set of custom models " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    
    SwpFMDBModel *customSelectModel     = [SwpFMDBModel swpFMDBWithTitle:@" Select custom model data " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    SwpFMDBModel *customSelectModels    = [SwpFMDBModel swpFMDBWithTitle:@" Select a set of custom models " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    return @[customInsterModel, customInsterModels, customUpdateModel, customUpdateModels, customSelectModel, customSelectModels, customSelectModels];
}

- (NSArray *)createInheritDataSource {
    
    SwpFMDBModel *inheritInsterModel     = [SwpFMDBModel swpFMDBWithTitle:@" Insert inherit model data " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    SwpFMDBModel *inheritInsterModels    = [SwpFMDBModel swpFMDBWithTitle:@" Insert a set of inherit models " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    SwpFMDBModel *inheritUpdateModel     = [SwpFMDBModel swpFMDBWithTitle:@" Update inherit model data " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    
    SwpFMDBModel *inheritUpdateModels    = [SwpFMDBModel swpFMDBWithTitle:@" Update a set of inherit models " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    
    SwpFMDBModel *inheritSelectModel     = [SwpFMDBModel swpFMDBWithTitle:@" Select inherit model data " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    SwpFMDBModel *inheritSelectModels    = [SwpFMDBModel swpFMDBWithTitle:@" Select a set of inherit models " setSwpFMDBOption:nil setSwpFMDBJumpContriller:nil];
    
    return @[inheritInsterModel, inheritInsterModels, inheritUpdateModel, inheritUpdateModels, inheritSelectModel, inheritSelectModels];
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
