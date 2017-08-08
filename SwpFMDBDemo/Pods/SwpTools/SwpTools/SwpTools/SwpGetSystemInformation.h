//
//  SwpGetSystemInformation.h
//  swp_song
//
//  Created by swp_song on 2017/1/13.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpGetSystemInformation : NSObject

/**!
 *  @author swp_song
 *
 *  @brief  swpGetIphoneIpAddress   ( 获取 当前 电话的 Ip 地址 )
 *
 *  @return NSString Ip
 */
+ (NSString *)swpGetIphoneIpAddress;

/**!
 *  @author swp_song
 *
 *  @brief  swpGetIphoneDeviceDeviceType    ( 获取 设备 类型 )
 *
 *  @return NSString
 */
+ (NSString *)swpGetIphoneDeviceDeviceType;

@end
NS_ASSUME_NONNULL_END
