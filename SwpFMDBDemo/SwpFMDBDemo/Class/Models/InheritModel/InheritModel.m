//
//  InheritModel.m
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "InheritModel.h"

@implementation InheritModel

/**!
 *  @ author swp_song
 *
 *  @ brief  inheritInsterModelData  ( InheritModel 单条数据插入测试 )
 *
 *  @ return InheritModel
 */
+ (instancetype)inheritInsterModelData {
    
    NSArray        *arrayI = @[@"inster_a", @"inster_s", @"inster_d", @"inster_w", @"inster_f"];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    [arrayM addObject:@(1000)];
    [arrayM addObject:@(2000)];
    [arrayM addObject:@(3000)];
    [arrayM addObject:@(4000)];
    
    NSDictionary        *dictionaryI = @{@"inster_keyI_01" : @"inster_valueI_01", @"inster_keyI_02" : @"inster_valueI_02", @"inster_keyI_03" : @"inster_valueI_03", @"inster_keyI_04" : @"inster_valueI_04"};
    
    NSMutableDictionary *dictionaryM = [NSMutableDictionary dictionary];
    [dictionaryM setObject:@(10.10) forKey:@"inster_keyM_01"];
    [dictionaryM setObject:@(10.20) forKey:@"inster_keyM_02"];
    [dictionaryM setObject:@(10.30) forKey:@"inster_keyM_03"];
    [dictionaryM setObject:@(10.40) forKey:@"inster_keyM_04"];
    
    return [[self class] inheritWihtID:@"200" setInheritName:@"Inster_Inherit" setIntegerType:100 setDoubleType:2.22 setArrayI:arrayI setArrayM:arrayM setDictionaryI:dictionaryI setDictionaryM:dictionaryM];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  inheritInsterModelDatas ( InheritModel 一组数据插入测试 )
 *
 *  @ return NSArray<InheritModel *> *
 */
+ (NSArray<InheritModel *> *)inheritInsterModelDatas {
    
    NSMutableArray *models = [NSMutableArray array];
    
    for (int i = 0; i<50; i++) {
        NSArray        *arrayI = @[@"inster_a", @"inster_s", @"inster_d", @"inster_w", @"inster_f"];
        NSMutableArray *arrayM = [NSMutableArray array];
        
        [arrayM addObject:@(arc4random() % 100)];
        [arrayM addObject:@(arc4random() % 200)];
        [arrayM addObject:@(arc4random() % 300)];
        [arrayM addObject:@(arc4random() % 400)];
        
        NSDictionary        *dictionaryI = @{@"inster_keyI_01" : @"inster_valueI_01", @"inster_keyI_02" : @"inster_valueI_02", @"inster_keyI_03" : @"inster_valueI_03", @"inster_keyI_04" : @"inster_valueI_04"};
        
        NSMutableDictionary *dictionaryM = [NSMutableDictionary dictionary];
        [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_01"];
        [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_02"];
        [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_03"];
        [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_04"];
        
        InheritModel *inherit = [[self class] inheritWihtID:[NSString stringWithFormat:@"200%02ld", (long)i + 1] setInheritName:[NSString stringWithFormat:@" Inster_Inherit %i ", i + 1] setIntegerType:arc4random() % 1000 setDoubleType:i + 9.0 setArrayI:arrayI setArrayM:arrayM setDictionaryI:dictionaryI setDictionaryM:dictionaryM];
        
        [models addObject:inherit];
    }
    
    return [NSMutableArray arrayWithArray:models];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  inheritUpdateModelData ( InheritModel 单条数据修改测试 )
 *
 *  @ return InheritModel
 */
+ (instancetype)inheritUpdateModelData {
    
    NSArray        *arrayI = @[@"update_a", @"update_b", @"update_c", @"update_d", @"update_e"];
    NSMutableArray *arrayM = [NSMutableArray array];
    
    [arrayM addObject:@(arc4random() % 100)];
    [arrayM addObject:@(arc4random() % 200)];
    [arrayM addObject:@(arc4random() % 300)];
    [arrayM addObject:@(arc4random() % 400)];
    
    NSDictionary        *dictionaryI = @{@"update_keyI_01" : @"update_valueI_01", @"update_keyI_02" : @"update_valueI_02", @"update_keyI_03" : @"update_valueI_03", @"update_keyI_04" : @"update_valueI_04"};
    
    NSMutableDictionary *dictionaryM = [NSMutableDictionary dictionary];
    [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_01"];
    [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_02"];
    [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_03"];
    [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_04"];
    
    return [[self class] inheritWihtID:@"200" setInheritName:@"Update_Inherit " setIntegerType:arc4random() % 1000  setDoubleType:22.2 setArrayI:arrayI setArrayM:arrayM setDictionaryI:dictionaryI setDictionaryM:dictionaryM];
}


/**!
 *  @ author swp_song
 *
 *  @ brief  inheritUpdateModelDatas    ( InheritModel 一组数据更新测试 )
 *
 *  @ return NSArray<InheritModel *>
 */
+ (NSArray<InheritModel *> *)inheritUpdateModelDatas {
    
    NSMutableArray *models = [NSMutableArray array];
    
    for (int i = 0; i<50; i++) {
        
        NSArray        *arrayI = @[@"update_a", @"update_b", @"update_c", @"update_d", @"update_e"];
        NSMutableArray *arrayM = [NSMutableArray array];
        
        [arrayM addObject:@(arc4random() % 100)];
        [arrayM addObject:@(arc4random() % 200)];
        [arrayM addObject:@(arc4random() % 300)];
        [arrayM addObject:@(arc4random() % 400)];
        
        NSDictionary        *dictionaryI = @{@"update_keyI_01" : @"update_valueI_01", @"update_keyI_02" : @"update_valueI_02", @"update_keyI_03" : @"update_valueI_03", @"update_keyI_04" : @"update_valueI_04"};
        
        NSMutableDictionary *dictionaryM = [NSMutableDictionary dictionary];
        [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_01"];
        [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_02"];
        [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_03"];
        [dictionaryM setObject:@(arc4random() % 200) forKey:@"inster_keyM_04"];
        
        InheritModel *inherit = [[self class] inheritWihtID:[NSString stringWithFormat:@"200%02ld", (long)i + 1] setInheritName:[NSString stringWithFormat:@"Update_Inherit %i", i + 1] setIntegerType:arc4random() % 1000 setDoubleType:i + 3.3 setArrayI:arrayI setArrayM:arrayM setDictionaryI:dictionaryI setDictionaryM:dictionaryM];
        [models addObject:inherit];
    }
    
    return [NSMutableArray arrayWithArray:models];
}





/**!
 *  @ author swp_song
 *
 *  @ brief  inheritWihtID:setInheritName:setIntegerType:setDoubleType:setArrayI:setArrayM:setDictionaryI:setDictionaryM  ( 工厂 )
 *
 *  @ param  swpDBID
 *
 *  @ param  inheritName
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
 *  @ return InheritModel
 */
+ (instancetype)inheritWihtID:(NSString *)swpDBID setInheritName:(NSString *)inheritName setIntegerType:(NSInteger)integerType setDoubleType:(double)doubleType setArrayI:(NSArray *)arrayI setArrayM:(NSMutableArray *)arrayM setDictionaryI:(NSDictionary *)dictionaryI setDictionaryM:(NSMutableDictionary *)dictionaryM {
    
    InheritModel *inherit   = [InheritModel new];
    inherit.swpDBID         = swpDBID;
    inherit.inheritName     = inheritName;
    inherit.integerType     = integerType;
    inherit.doubleType      = doubleType;
    inherit.arrayI          = arrayI;
    inherit.arrayM          = arrayM;
    inherit.dictionaryI     = dictionaryI;
    inherit.dictionaryM     = dictionaryM;
    
    return inherit;
}


@end
