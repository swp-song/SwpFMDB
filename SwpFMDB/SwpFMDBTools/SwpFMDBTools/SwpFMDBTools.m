//
//  SwpFMDBTools.m
//  swp_song
//
//  Created by swp_song on 2017/2/9.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpFMDBTools.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "SwpBDModel.h"                  //  SwpBDModel
#import <objc/message.h>                //  RunTime
/*! ---------------------- Tool       ---------------------- !*/

@import UIKit;

@implementation SwpFMDBTools

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsGetSqlFilePath  ( 获取创建数据库路径 )
 *
 *  @return NSString
 */
+ (NSString *)swpFMDBToolsGetSqlFilePath {
    NSString      *sandboxPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString      *sqlFilePath = [sandboxPath stringByAppendingPathComponent:@"SwpFMDB.db"];
    NSFileManager *manager     = [NSFileManager defaultManager];
    BOOL          isDirectory;
    BOOL isExists = [manager fileExistsAtPath:sqlFilePath isDirectory:&isDirectory];
    if (!isDirectory || !isExists) {
        [manager createDirectoryAtPath:sandboxPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return sqlFilePath;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsGetAllPropertysNames:   ( 获取全部属性 < 包括继承 SwpBDModel 数据模型 > )
 *
 *  @param  modelClass  modelClass
 *
 *  @return NSArray
 */
+ (NSArray *)swpFMDBToolsGetAllPropertysNames:(Class)modelClass {
    
    if ([NSStringFromClass([modelClass superclass]) isEqualToString:NSStringFromClass([SwpBDModel class])]) {
        NSMutableArray *allProperties = [NSMutableArray array];
        [allProperties addObjectsFromArray:[[self class] swpFMDBToolsGetPropertysNames:[modelClass superclass]]];
        [allProperties addObjectsFromArray:[[self class] swpFMDBToolsGetPropertysNames:modelClass]];
        return allProperties.copy;
    }
    return [[self class] swpFMDBToolsGetPropertysNames:modelClass];

}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsGetPropertysNames:  ( 获取对象中所有属性名称 )
 *
 *  @param  modelClass  modelClass
 *
 *  @return NSArray
 */
+ (NSArray *)swpFMDBToolsGetPropertysNames:(Class)modelClass {
    return [[self class] swpFMDBToolsGetPropertysNames:modelClass interception_:YES];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsGetPropertysNames:interception_:   ( 获取对象中所有属性名称 )
 *
 *  @param  modelClass      modelClass      < 类名称 >
 *
 *  @param  isInterception_ isInterception_ < 是否截取 _ >
 *
 *  @return NSArray
 */
+ (NSArray *)swpFMDBToolsGetPropertysNames:(Class)modelClass interception_:(BOOL)isInterception_ {
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int outCount;
    Ivar *ivars = class_copyIvarList(modelClass, &outCount);
    for (int i = 0; i<outCount; i++) {
        Ivar ivar     = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if([[key substringToIndex:1] isEqualToString:@"_"] && isInterception_){
            key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
        }
        [array addObject:key];
    }
    
    free(ivars);
    
    return array.copy;
}


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsVerifySystemCollectionType: ( 验证数据是否是系统集合类型 )
 *
 *  @param  value   value
 *
 *  @return BOOL
 */
+ (BOOL)swpFMDBToolsVerifySystemCollectionType:(id)value {
    if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSMutableDictionary class]] || [value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSMutableArray class]]) {
        return YES;
    }
    return NO;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsSplicingPropertyName:   ( 拼接属性名称 <, 拼接> )
 *
 *  @param  modelClass  modelClass
 *
 *  @return NSString
 */
+ (NSString *)swpFMDBToolsSplicingPropertyName:(Class)modelClass {
    NSMutableString *propertyName = [NSMutableString string];
    NSArray         *propertys    = [[self class] swpFMDBToolsGetAllPropertysNames:modelClass];
    [propertys enumerateObjectsUsingBlock:^(NSString * _Nonnull name, NSUInteger idx, BOOL * _Nonnull stop) {
        [propertyName appendString:idx != propertys.count - 1 ? [NSString stringWithFormat:@"%@,", name] : [NSString stringWithFormat:@"%@", name]];
    }];
    return propertyName.copy;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsSetConversionJSONSting: ( 数组 | 字典转换成 json 字符串 )
 *
 *  @param  object  object
 *
 *  @return NSString
 */
+ (NSString *)swpFMDBToolsSetConversionJSONSting:(id)object {
    NSData   *jsonData   = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsConversionSet:  ( json 转换成对应的集合 )
 *
 *  @param  jsonString  jsonString
 *
 *  @return id
 */
+ (id)swpFMDBToolsConversionSet:(NSString *)jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
}

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsPackingData:    ( 包装对应数据 )
 *
 *  @param  value   value
 *
 *  @return id
 */
+ (id)swpFMDBToolsPackingData:(id)value {
    if ([[self class] swpFMDBToolsConversionSet:value]) return [[self class] swpFMDBToolsConversionSet:value];
    return value;
}


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsVerifySystemDataTypesAssert:   ( 验证数据类型的断言 )
 *
 *  @param  model   model
 */
+ (void)swpFMDBToolsVerifySystemDataTypesAssert:(id)model {
    
    NSAssert(![SwpFMDBTools swpFMDBToolsVerifySystemCollectionType:model], @" Model 是系统数据类型不予缓存");
    NSAssert(![model isKindOfClass:[UIResponder class]], @" Model 必须是 NSObject 或 NSObject 子类, Model 必须不是响应事件");
}


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsVerifyArrayInSameTypeOfData:    ( 验证数组中数据是否为 Null, 是否是相同类型数据 )
 *
 *  @param  models              models
 *
 *  @param verificationMessage  verificationMessage
 */
+ (void)swpFMDBToolsVerifyArrayInSameTypeOfData:(NSArray *)models verificationMessage:(void(^)(BOOL verificationResult, id verificationModel))verificationMessage {
    
    __block BOOL result = YES;
    __block id   model  = nil;
    if (!models.count || !models) {
        if (verificationMessage) verificationMessage(NO, model);
        return;
    }
    
    [models enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!obj) {
            * stop = YES;
            result = NO;
            return;
        }
        model = obj;
        
        if (![obj isKindOfClass:[model class]]){
            * stop = YES;
            result = NO;
            return;
        }
    }];
    
    if (verificationMessage) verificationMessage(result, model);
}

@end

