//
//  SwpCoordinateTransform.m
//  SwpTools
//
//  Created by swp_song on 16/5/5.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "SwpCoordinateTransform.h"

@implementation SwpCoordinateTransform

/**!
 *  @ author swp_song
 *
 *  @ brief  SwpCoordinate2DMake
 *
 *  @param  latitude  纬度
 *
 *  @param  longitude 经度
 *
 *  @return SwpCoordinate2D
 */
SwpCoordinate2D SwpCoordinate2DMake(SwpDegrees latitude, SwpDegrees longitude) {
    SwpCoordinate2D swpCoordinate2D = {latitude, longitude};
    return swpCoordinate2D;
}

/**!
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
+ (SwpCoordinate2D)swpCoordinateTransformAMAPFromBaiDu:(double)latitude longitude:(double)longitude {
    static double const xPI   = (3.14159265358979324 * 3000.0 / 180.0);
    NSString *latitudeString  = [NSString stringWithFormat:@"%f", latitude];
    NSString *longitudeString = [NSString stringWithFormat:@"%f", longitude];
    double latit              = [latitudeString  doubleValue];
    double longt              = [longitudeString doubleValue];
    double x                  = longt;
    double y                  = latit;
    double z                  = sqrt(x * x + y * y) + 0.00002 * sin(y * xPI);
    double theta              = atan2(y, x) + 0.000003 * cos(x * xPI);
    longt                     = z * cos(theta) + 0.0065;
    latit                     = z * sin(theta) + 0.006;
    return SwpCoordinate2DMake(latit, longt);
}

/**!
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
+ (SwpCoordinate2D)swpCoordinateTransformBaiDuFromAMAP:(double)latitude longitude:(double)longitude {
    
    static double const xPI   = (3.14159265358979324 * 3000.0 / 180.0);
    NSString *latitudeString  = [NSString stringWithFormat:@"%f", latitude];
    NSString *longitudeString = [NSString stringWithFormat:@"%f", longitude];
    
    double latit              = [latitudeString  doubleValue];
    double longt              = [longitudeString doubleValue];
    //百度坐标系转换为火星坐标系
    double x                  = longt - 0.0065;
    double y                  = latit - 0.006;
    double z                  = sqrt(x * x + y * y) - 0.00002 * sin(y * xPI);
    double theta              = atan2(y, x) - 0.000003 * cos(x * xPI);
    longt                     = z * cos(theta);
    latit                     = z * sin(theta);
    return SwpCoordinate2DMake(latit, longt);
}



@end
