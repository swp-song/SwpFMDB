//
//  SwpCoordinateTransform.h
//  SwpTools
//
//  Created by swp_song on 16/5/5.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*! 定义 定位 数据变量 !*/
typedef double SwpDegrees;

/**
 *  @author swp_song
 *
 *  @brief  定义 经纬度 结构体
 */
typedef struct {
    SwpDegrees latitude;
    SwpDegrees longitude;
} SwpCoordinate2D;

@interface SwpCoordinateTransform : NSObject

/**
 *  @author swp_song
 *
 *  @brief  SwpCoordinate2DMake
 *
 *  @param  latitude    纬度
 *
 *  @param  longitude   经度
 *
 *  @return SwpCoordinate2D
 */
SwpCoordinate2D SwpCoordinate2DMake(SwpDegrees latitude, SwpDegrees longitude);

/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateTransformAMAPFromBaiDu:longitude:  ( 经纬度 转换 高德 经纬度 转换成 百度 经纬度 )
 *
 *  @param  latitude    纬度
 *
 *  @param  longitude   经度
 *
 *  @return SwpCoordinate2D
 */
+ (SwpCoordinate2D)swpCoordinateTransformAMAPFromBaiDu:(double)latitude longitude:(double)longitude;

/**
 *  @author swp_song
 *
 *  @brief  swpCoordinateTransformBaiDuFromAMAP:longitude:  ( 经纬度 转换 百度 经纬度 转换成 高德 经纬度 )
 *
 *  @param  latitude    纬度
 *
 *  @param  longitude   经度
 *
 *  @return SwpCoordinate2D
 */
+ (SwpCoordinate2D)swpCoordinateTransformBaiDuFromAMAP:(double)latitude longitude:(double)longitude;

@end
NS_ASSUME_NONNULL_END
