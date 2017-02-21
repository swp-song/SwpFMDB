//
//  SwpFMDBCell.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/22.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpFMDBModel;
NS_ASSUME_NONNULL_BEGIN
@interface SwpFMDBCell : UITableViewCell

+ (instancetype)swpFMDBCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier;

- (SwpFMDBCell *(^)(SwpFMDBModel *swpFMDB))swpFMDB;

@end
NS_ASSUME_NONNULL_END
