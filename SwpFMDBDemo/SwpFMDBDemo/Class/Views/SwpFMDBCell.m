//
//  SwpFMDBCell.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/22.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBCell.h"

#import "SwpFMDBModel.h"

@implementation SwpFMDBCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font       = [UIFont systemFontOfSize:14];
        self.textLabel.numberOfLines = 0;
        self.selectionStyle       = UITableViewCellSelectionStyleNone;
        self.accessoryType        = UITableViewCellAccessoryDisclosureIndicator;
        self.detailTextLabel.font = [UIFont systemFontOfSize:10];
//        self.detailTextLabel.text = @"哈哈啊哈哈";
    }
    return self;
}
/**!
 *  @ author swp_song
 *
 *  @ brief  setFrame:  ( Override setFrame )
 *
 *  @ param frame
 */
- (void)setFrame:(CGRect)frame {
    frame.size.height -= 1;
    [super setFrame:frame];
}


+ (instancetype)swpFMDBCellWithTableView:(UITableView *)tableView forCellReuseIdentifier:(NSString *)identifier {
    
    SwpFMDBCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

- (void)setData:(SwpFMDBModel *)swpFMDB  {

    self.textLabel.text = [NSString stringWithFormat:@"%@ \n 哈哈哈", swpFMDB.swpFMDBTitle];
    
}

- (SwpFMDBCell *(^)(SwpFMDBModel *swpFMDB))swpFMDB {

    return ^SwpFMDBCell *(SwpFMDBModel *swpFMDB) {
        [self setData:swpFMDB];
        return self;
    };
}

@end
