//
//  SwpFMDBTools.h
//  swp_song
//
//  Created by swp_song on 2017/2/9.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpFMDBTools : NSObject

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsGetSqlFilePath ( 获取 创建 数据库 路径 )
 *
 *  @ return NSString
 */
+ (NSString *)swpFMDBToolsGetSqlFilePath;


/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsGetAllPropertysNames: ( 获取 全部 属性 < 包括 继承 SwpBDModel 数据模型 > )
 *
 *  @ param  modelClass
 *
 *  @ return NSArray
 */
+ (NSArray *)swpFMDBToolsGetAllPropertysNames:(Class)modelClass;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsGetPropertysNames:    ( 获取 对象中 所有 属性名称 )
 *
 *  @ param  modelClass         类名称
 *
 *  @ return NSArray
 */

+ (NSArray *)swpFMDBToolsGetPropertysNames:(Class)modelClass;


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
+ (NSArray *)swpFMDBToolsGetPropertysNames:(Class)modelClass interception_:(BOOL)isInterception_;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsVerifySystemCollectionType:    ( 验证 数据 是否是 系统 集合类型 )
 *
 *  @ param  value
 *
 *  @ return BOOL
 */
+ (BOOL)swpFMDBToolsVerifySystemCollectionType:(id)value;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsSplicingPropertyName:  ( 拼接 属性名称 < ','  拼接> )
 *
 *  @ param  modelClass
 *
 *  @ return NSString
 */
+ (NSString *)swpFMDBToolsSplicingPropertyName:(Class)modelClass;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsSetConversionJSONSting:    ( 数组 | 字典 转换成 json 字符串 )
 *
 *  @ param  object
 *
 *  @ return NSString
 */
+ (NSString *)swpFMDBToolsSetConversionJSONSting:(id)object;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsConversionSet: ( json 转换成 对应的 集合 )
 *
 *  @ param  jsonString
 *
 *  @ return id
 */
+ (id)swpFMDBToolsConversionSet:(NSString *)jsonString;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsPackingData:   ( 包装对应数据 )
 *
 *  @ param  value
 *
 *  @ return id
 */
+ (id)swpFMDBToolsPackingData:(id)value;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpFMDBToolsVerifySystemDataTypesAssert:   ( 验证 数据 类型, 断言  )
 *
 *  @ param  model
 */
+ (void)swpFMDBToolsVerifySystemDataTypesAssert:(id)model;


@end
NS_ASSUME_NONNULL_END
