//
//  CustomModel.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface CustomModel : NSObject


/*! swpDBID 自定义 模型 这个属性 必须 存在 主键 ID, 如果 是 继承 SwpBDModel 无需添加 该属性 !*/
@property (nonatomic, copy  ) NSString            *swpDBID;
@property (nonatomic, copy  ) NSString            *customName;
@property (nonatomic, assign) NSInteger           integerType;
@property (nonatomic, assign) double              doubleType;
@property (nonatomic, copy  ) NSArray             *arrayI;
@property (nonatomic, strong) NSMutableArray      *arrayM;
@property (nonatomic, copy  ) NSDictionary        *dictionaryI;
@property (nonatomic, strong) NSMutableDictionary *dictionaryM;

/**!
 *  @ author swp_song
 *
 *  @ brief  customInsterModelData  ( CustomModel 单条数据插入测试 )
 *
 *  @ return CustomModel
 */
+ (instancetype)customInsterModelData;

/**!
 *  @ author swp_song
 *
 *  @ brief  customInsterModelDatas ( CustomModel 一组数据插入测试 )
 *
 *  @ return NSArray<CustomModel *>
 */
+ (NSArray<CustomModel *> *)customInsterModelDatas;

/**!
 *  @ author swp_song
 *
 *  @ brief  customUpdateModelData  ( CustomModel 单条数据修改测试 )
 *
 *  @ return CustomModel
 */
+ (instancetype)customUpdateModelData;

/**!
 *  @ author swp_song
 *
 *  @ brief  customUpdateModelDatas ( CustomModel 一组数据更新测试 )
 *
 *  @ return NSArray<CustomModel *>
 */
+ (NSArray<CustomModel *> *)customUpdateModelDatas;

@end
NS_ASSUME_NONNULL_END
