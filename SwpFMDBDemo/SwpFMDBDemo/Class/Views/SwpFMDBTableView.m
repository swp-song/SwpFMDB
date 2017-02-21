//
//  SwpFMDBTableView.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBTableView.h"

#import "SwpFMDBCell.h"

static NSString * const kSwpFMDBCellID = @" SwpFMDB Cell ID ";


@interface SwpFMDBTableView () <UITableViewDataSource>

@property (nonatomic, copy) NSArray *datas;

@end

@implementation SwpFMDBTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        [self registerClass:[SwpFMDBCell class] forCellReuseIdentifier:kSwpFMDBCellID];
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *models = _datas[section];
    return models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SwpFMDBCell *cell = [SwpFMDBCell swpFMDBCellWithTableView:tableView forCellReuseIdentifier:kSwpFMDBCellID];
    return cell.swpFMDB(_datas[indexPath.section][indexPath.row]);
}


- (SwpFMDBTableView *(^)(NSArray *swpFMDBDatas))swpFMDBDatas {
    
    return ^SwpFMDBTableView *(NSArray *swpFMDBDatas) {
        _datas = swpFMDBDatas;
        [self reloadData];
        return self;
    };
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
