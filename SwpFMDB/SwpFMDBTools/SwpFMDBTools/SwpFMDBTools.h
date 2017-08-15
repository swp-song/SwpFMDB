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
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsGetSqlFilePath  ( 获取创建数据库路径 )
 *
 *  @return NSString
 */
+ (NSString *)swpFMDBToolsGetSqlFilePath;


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsGetAllPropertysNames:   ( 获取全部属性 < 包括继承 SwpBDModel 数据模型 > )
 *
 *  @param  modelClass  modelClass
 *
 *  @return NSArray
 */
+ (NSArray *)swpFMDBToolsGetAllPropertysNames:(Class)modelClass;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsGetPropertysNames:  ( 获取对象中所有属性名称 )
 *
 *  @param  modelClass  modelClass
 *
 *  @return NSArray
 */
+ (NSArray *)swpFMDBToolsGetPropertysNames:(Class)modelClass;


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
+ (NSArray *)swpFMDBToolsGetPropertysNames:(Class)modelClass interception_:(BOOL)isInterception_;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsVerifySystemCollectionType: ( 验证数据是否是系统集合类型 )
 *
 *  @param  value   value
 *
 *  @return BOOL
 */
+ (BOOL)swpFMDBToolsVerifySystemCollectionType:(id)value;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsSplicingPropertyName:   ( 拼接属性名称 <, 拼接> )
 *
 *  @param  modelClass  modelClass
 *
 *  @return NSString
 */
+ (NSString *)swpFMDBToolsSplicingPropertyName:(Class)modelClass;


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsSetConversionJSONSting: ( 数组 | 字典转换成 json 字符串 )
 *
 *  @param  object  object
 *
 *  @return NSString
 */
+ (NSString *)swpFMDBToolsSetConversionJSONSting:(id)object;


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsConversionSet:  ( json 转换成对应的集合 )
 *
 *  @param  jsonString  jsonString
 *
 *  @return id
 */
+ (id)swpFMDBToolsConversionSet:(NSString *)jsonString;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsPackingData:    ( 包装对应数据 )
 *
 *  @param  value   value
 *
 *  @return id
 */
+ (id)swpFMDBToolsPackingData:(id)value;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsVerifySystemDataTypesAssert:   ( 验证数据类型的断言 )
 *
 *  @param  model   model
 */
+ (void)swpFMDBToolsVerifySystemDataTypesAssert:(id)model;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsVerifyArrayInSameTypeOfData:    ( 验证数组中数据是否为 Null, 是否是相同类型数据 )
 *
 *  @param  models              models
 *
 *  @param verificationMessage  verificationMessage
 */
+ (void)swpFMDBToolsVerifyArrayInSameTypeOfData:(NSArray *)models verificationMessage:(void(^)(BOOL verificationResult, id verificationModel))verificationMessage;

/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsVerifyTableWhetherAddField: ( 验证表是否添加字段 )
 *
 *  @param  table       table
 *
 *  @param  dbPropertys dbPropertys
 *
 *  @return NSArray
 */
+ (NSArray *)swpFMDBToolsVerifyTableWhetherAddField:(Class)table dbPropertys:(NSArray *)dbPropertys;


/**!
 *  @author swp_song
 *
 *  @brief  swpFMDBToolsVerifyTableWhetherDeleteField:  ( 验证表是否删除字段 )
 *
 *  @param  table       table
 *
 *  @param  dbPropertys dbPropertys
 *
 *  @return NSArray
 */
+ (NSArray *)swpFMDBToolsVerifyTableWhetherDeleteField:(Class)table dbPropertys:(NSArray *)dbPropertys;

@end
NS_ASSUME_NONNULL_END
