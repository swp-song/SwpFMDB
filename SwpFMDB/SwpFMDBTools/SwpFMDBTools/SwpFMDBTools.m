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
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsGetSqlFilePath ( 获取 创建 数据库 路径 )
 *
 *  @ return NSString
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
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsGetAllPropertysNames: ( 获取 全部 属性 < 包括 继承 SwpBDModel 数据模型 > )
 *
 *  @ param  modelClass
 *
 *  @ return NSArray
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
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsGetPropertysNames: ( 获取 对象中 所有 属性名称 )
 *
 *  @ param  modelClass         类名称
 *
 *  @ return NSArray
 */
+ (NSArray *)swpFMDBToolsGetPropertysNames:(Class)modelClass {
    return [[self class] swpFMDBToolsGetPropertysNames:modelClass interception_:YES];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsGetPropertysNames:interception_:  ( 获取 对象中 所有 属性名称 )
 *
 *  @ param  modelClass         类名称
 *
 *  @ param  isInterception_    是否截取 _
 *
 *  @ return NSArray
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
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsVerifySystemCollectionType:    ( 验证 数据 是否是 系统 集合类型 )
 *
 *  @ param  value
 *
 *  @ return BOOL
 */
+ (BOOL)swpFMDBToolsVerifySystemCollectionType:(id)value {
    if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSMutableDictionary class]] || [value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSMutableArray class]]) {
        return YES;
    }
    return NO;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsSplicingPropertyName:  ( 拼接 属性名称 <, 拼接> )
 *
 *  @ param  modelClass
 *
 *  @ return NSString
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
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsSetConversionJSONSting:    ( 数组 | 字典 转换成 json 字符串 )
 *
 *  @ param  object
 *
 *  @ return NSString
 */
+ (NSString *)swpFMDBToolsSetConversionJSONSting:(id)object {
    NSData   *jsonData   = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsConversionSet: ( json 转换成 对应的 集合 )
 *
 *  @ param  jsonString
 *
 *  @ return id
 */
+ (id)swpFMDBToolsConversionSet:(NSString *)jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsPackingData:   ( 包装对应数据 )
 *
 *  @ param  value
 *
 *  @ return id
 */
+ (id)swpFMDBToolsPackingData:(id)value {
    if ([[self class] swpFMDBToolsConversionSet:value]) return [[self class] swpFMDBToolsConversionSet:value];
    return value;
}


/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsVerifySystemDataTypesAssert:   ( 验证 数据 类型, 断言  )
 *
 *  @ param  model
 */
+ (void)swpFMDBToolsVerifySystemDataTypesAssert:(id)model {
    
    NSAssert(![SwpFMDBTools swpFMDBToolsVerifySystemCollectionType:model], @" Model 是系统数据类型不予缓存");
    NSAssert(![model isKindOfClass:[UIResponder class]], @" Model 必须是 NSObject 或 NSObject 子类, Model 必须不是响应事件");
}

+ (void)swpFMDBToolsVerifyArray:(NSArray *)models verificationMessage:(void(^)(BOOL verificationResult, id verificationModel))verificationMessage {
    
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

