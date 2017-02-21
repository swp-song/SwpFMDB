//
//  TestModel.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/22.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBDModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface TestModel : SwpBDModel

@property (nonatomic, copy  ) NSString            *testName;
@property (nonatomic, assign) NSInteger           integerType;
@property (nonatomic, assign) double              doubleType;
@property (nonatomic, copy  ) NSArray             *arrayI;
@property (nonatomic, strong) NSMutableArray      *arrayM;
@property (nonatomic, copy  ) NSDictionary        *dictionaryI;
@property (nonatomic, strong) NSMutableDictionary *dictionaryM;

@end
NS_ASSUME_NONNULL_END
