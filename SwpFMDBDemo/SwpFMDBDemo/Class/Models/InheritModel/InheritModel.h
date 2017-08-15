//
//  InheritModel.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBDModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface InheritModel : SwpBDModel

@property (nonatomic, copy  ) NSString            *inheritName;
@property (nonatomic, assign) NSInteger           integerType;
@property (nonatomic, assign) double              doubleType;
@property (nonatomic, copy  ) NSArray             *arrayI;
@property (nonatomic, strong) NSMutableArray      *arrayM;
@property (nonatomic, copy  ) NSDictionary        *dictionaryI;
@property (nonatomic, strong) NSMutableDictionary *dictionaryM;

/**!
 *  @author swp_song
 *
 *  @brief  inheritInsterModelData  ( InheritModel 单条数据插入测试 )
 *
 *  @return InheritModel
 */
+ (instancetype)inheritInsterModelData;

/**!
 *  @author swp_song
 *
 *  @brief  inheritInsterModelDatas ( InheritModel 一组数据插入测试 )
 *
 *  @return NSArray
 */
+ (NSArray<InheritModel *> *)inheritInsterModelDatas;

/**!
 *  @author swp_song
 *
 *  @brief  inheritUpdateModelData ( InheritModel 单条数据修改测试 )
 *
 *  @return InheritModel
 */
+ (instancetype)inheritUpdateModelData;

/**!
 *  @author swp_song
 *
 *  @brief  inheritUpdateModelDatas    ( InheritModel 一组数据更新测试 )
 *
 *  @return NSArray
 */
+ (NSArray<InheritModel *> *)inheritUpdateModelDatas;

@end
NS_ASSUME_NONNULL_END
