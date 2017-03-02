//
//  SwpFMDBModel.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBModel.h"

@implementation SwpFMDBModel

+ (instancetype)swpFMDBWithTitle:(NSString *)title setSwpFMDBSubTitle:(NSString *)subTitle setSwpFMDBOption:(nullable SwpFMDBOption)option setSwpFMDBJumpContriller:(nullable Class)contriller {
    
    SwpFMDBModel *swpFMDB         = [SwpFMDBModel new];
    swpFMDB.swpFMDBTitle          = title;
    swpFMDB.swpFMDBSubTitle       = subTitle;
    swpFMDB.swpFMDBOption         = option;
    swpFMDB.swpFMDBJumpContriller = contriller;
    return swpFMDB;
}

@end
