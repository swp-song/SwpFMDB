//
//  CustomModel.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "CustomModel.h"

@implementation CustomModel

/**!
 *  @ author swp_song
 *
 *  @ brief  customInsterModelData  ( CustomModel 单条数据插入测试 )
 *
 *  @ return CustomModel
 */
+ (instancetype)customInsterModelData {
    
    NSArray        *arrayI = @[@"inster_a", @"inster_b", @"inster_c", @"inster_d", @"inster_e"];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    [arrayM addObject:@(100)];
    [arrayM addObject:@(200)];
    [arrayM addObject:@(300)];
    [arrayM addObject:@(400)];
    
    NSDictionary        *dictionaryI = @{@"inster_keyI_01" : @"inster_valueI_01", @"inster_keyI_02" : @"inster_valueI_02", @"inster_keyI_03" : @"inster_valueI_03", @"inster_keyI_04" : @"inster_valueI_04"};
    
    NSMutableDictionary *dictionaryM = [NSMutableDictionary dictionary];
    [dictionaryM setObject:@(1.10) forKey:@"inster_keyM_01"];
    [dictionaryM setObject:@(1.20) forKey:@"inster_keyM_02"];
    [dictionaryM setObject:@(1.30) forKey:@"inster_keyM_03"];
    [dictionaryM setObject:@(1.40) forKey:@"inster_keyM_04"];
    
    return [[self class] customWihtID:@"100" setCustomName:@"Inster_Custom " setIntegerType:100 setDoubleType:111.11 setArrayI:arrayI setArrayM:arrayM setDictionaryI:dictionaryI setDictionaryM:dictionaryM];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  customInsterModelDatas ( CustomModel 一组数据插入测试 )
 *
 *  @ return NSArray<CustomModel *>
 */
+ (NSArray<CustomModel *> *)customInsterModelDatas {
    
    NSMutableArray *models = [NSMutableArray array];
    
    for (int i = 0; i<50; i++) {
        NSArray        *arrayI = @[@"inster_a", @"inster_b", @"inster_c", @"inster_d", @"inster_e"];
        NSMutableArray *arrayM = [NSMutableArray array];
        
        [arrayM addObject:@(100 + i + 1)];
        [arrayM addObject:@(200 + i + 1)];
        [arrayM addObject:@(300 + i + 1)];
        [arrayM addObject:@(400 + i + 1)];
        
        NSDictionary        *dictionaryI = @{@"inster_keyI_01" : @"inster_valueI_01", @"inster_keyI_02" : @"inster_valueI_02", @"inster_keyI_03" : @"inster_valueI_03", @"inster_keyI_04" : @"inster_valueI_04"};
        
        NSMutableDictionary *dictionaryM = [NSMutableDictionary dictionary];
        [dictionaryM setObject:@(1.10 + i + 1) forKey:@"inster_keyM_01"];
        [dictionaryM setObject:@(1.20 + i + 1) forKey:@"inster_keyM_02"];
        [dictionaryM setObject:@(1.30 + i + 1) forKey:@"inster_keyM_03"];
        [dictionaryM setObject:@(1.40 + i + 1) forKey:@"inster_keyM_04"];
        
        CustomModel *custom = [[self class] customWihtID:[NSString stringWithFormat:@"100%02ld", (long)i + 1] setCustomName:[NSString stringWithFormat:@" Inster_Custom %i ", i + 1]setIntegerType:arc4random() % 100 setDoubleType:i + 1.0 setArrayI:arrayI setArrayM:arrayM setDictionaryI:dictionaryI setDictionaryM:dictionaryM];
        
        [models addObject:custom];
    }
    
    return [NSMutableArray arrayWithArray:models];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  customUpdateModelData  ( CustomModel 单条数据修改测试 )
 *
 *  @ return CustomModel
 */
+ (instancetype)customUpdateModelData {
    
    NSArray        *arrayI = @[@"update_a", @"update_b", @"update_c", @"update_d", @"update_e"];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    [arrayM addObject:@(500)];
    [arrayM addObject:@(600)];
    [arrayM addObject:@(700)];
    [arrayM addObject:@(800)];
    
    NSDictionary        *dictionaryI = @{@"update_keyI_01" : @"update_valueI_01", @"update_keyI_02" : @"update_valueI_02", @"update_keyI_03" : @"update_valueI_03", @"update_keyI_04" : @"update_valueI_04"};
    
    NSMutableDictionary *dictionaryM = [NSMutableDictionary dictionary];
    [dictionaryM setObject:@(2.10) forKey:@"update_keyM_01"];
    [dictionaryM setObject:@(2.20) forKey:@"update_keyM_02"];
    [dictionaryM setObject:@(2.30) forKey:@"update_keyM_03"];
    [dictionaryM setObject:@(2.40) forKey:@"update_keyM_04"];
    
    return [[self class] customWihtID:@"100" setCustomName:@"Update_Custom " setIntegerType:200 setDoubleType:222.22 setArrayI:arrayI setArrayM:arrayM setDictionaryI:dictionaryI setDictionaryM:dictionaryM];
    
}

/**!
 *  @ author swp_song
 *
 *  @ brief  customUpdateModelDatas ( CustomModel 一组数据更新测试 )
 *
 *  @ return NSArray<CustomModel *>
 */
+ (NSArray<CustomModel *> *)customUpdateModelDatas {
    
    NSMutableArray *models = [NSMutableArray array];
    
    for (int i = 0; i<50; i++) {
    
        NSArray        *arrayI = @[@"update_a", @"update_b", @"update_c", @"update_d", @"update_e"];
        NSMutableArray *arrayM = [NSMutableArray array];
        
        [arrayM addObject:@(500 + i + 1)];
        [arrayM addObject:@(600 + i + 1)];
        [arrayM addObject:@(700 + i + 1)];
        [arrayM addObject:@(800 + i + 1)];
        
        NSDictionary        *dictionaryI = @{@"update_keyI_01" : @"update_valueI_01", @"update_keyI_02" : @"update_valueI_02", @"update_keyI_03" : @"update_valueI_03", @"update_keyI_04" : @"update_valueI_04"};
        
        NSMutableDictionary *dictionaryM = [NSMutableDictionary dictionary];
        [dictionaryM setObject:@(2.10 + i + 1) forKey:@"update_keyM_01"];
        [dictionaryM setObject:@(2.20 + i + 1) forKey:@"update_keyM_02"];
        [dictionaryM setObject:@(2.30 + i + 1) forKey:@"update_keyM_03"];
        [dictionaryM setObject:@(2.40 + i + 1) forKey:@"update_keyM_04"];
        
        CustomModel *custom = [[self class] customWihtID:[NSString stringWithFormat:@"100%02ld", (long)i + 1] setCustomName:[NSString stringWithFormat:@"Update_Custom %i", i + 1] setIntegerType:arc4random() % 500 setDoubleType:i + 2.0 setArrayI:arrayI setArrayM:arrayM setDictionaryI:dictionaryI setDictionaryM:dictionaryM];
        [models addObject:custom];
    }
    
    return [NSMutableArray arrayWithArray:models];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  customWihtID:setCustomName:setIntegerType:setDoubleType:setArrayI:setArrayM:setDictionaryI:setDictionaryM  ( 工厂 )
 *
 *  @ param  swpDBID
 *
 *  @ param  customName
 *
 *  @ param  integerType
 *
 *  @ param  doubleType
 *
 *  @ param  arrayI
 *
 *  @ param  arrayM
 *
 *  @ param  dictionaryI
 *
 *  @ param  dictionaryM
 *
 *  @ return CustomModel
 */
+ (instancetype)customWihtID:(NSString *)swpDBID setCustomName:(NSString *)customName setIntegerType:(NSInteger)integerType setDoubleType:(double)doubleType setArrayI:(NSArray *)arrayI setArrayM:(NSMutableArray *)arrayM setDictionaryI:(NSDictionary *)dictionaryI setDictionaryM:(NSMutableDictionary *)dictionaryM {
    
    CustomModel *custom = [CustomModel new];
    custom.swpDBID      = swpDBID;
    custom.customName   = customName;
    custom.integerType  = integerType;
    custom.doubleType   = doubleType;
    custom.arrayI       = arrayI;
    custom.arrayM       = arrayM;
    custom.dictionaryI  = dictionaryI;
    custom.dictionaryM  = dictionaryM;
    
    return custom;
}



@end
