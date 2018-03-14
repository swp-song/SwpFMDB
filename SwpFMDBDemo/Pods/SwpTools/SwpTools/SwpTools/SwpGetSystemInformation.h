//
//  SwpGetSystemInformation.h
//  swp_song
//
//  Created by swp_song on 2017/1/13.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 - SwpiPhoneScreenSizeUnspecified:  未知设备
 - SwpiPhoneScreenSize3_5:          iPhone 4 / 4S
 - SwpiPhoneScreenSize4_0:          iPhone 5 / 5S / 5C / SE (iPod / iPod touch)
 - SwpiPhoneScreenSize4_7:          iPone 6 / 6S / 7 / 8
 - SwpiPhoneScreenSize5_5:          iPone 6 Plus / 6S Plus / 7 Plus / 8 Plus
 - SwpiPhoneScreenSize5_8:          iPone X
 */
typedef NS_ENUM(NSInteger, SwpiPhoneScreenSize) {
    SwpiPhoneScreenSizeUnspecified = -1,
    SwpiPhoneScreenSize3_5,
    SwpiPhoneScreenSize4_0,
    SwpiPhoneScreenSize4_7,
    SwpiPhoneScreenSize5_5,
    SwpiPhoneScreenSize5_8,
};

@interface SwpGetSystemInformation : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpGetIphoneIpAddress   ( 获取当前电话的 Ip 地址 )
 *
 *  @return NSString Ip
 */
+ (NSString *)swpGetIphoneIpAddress;

/**
 *  @author swp_song
 *
 *  @brief  swpGetIphoneDeviceType  ( 获取设备类型 )
 *
 *  @return NSString
 */
+ (NSString *)swpGetIphoneDeviceType;


/**
 *  @author swp_song
 *
 *  @brief  swpGetIphoneDeviceByScreenSize  ( 根据屏幕尺寸获取设备类型 )
 *
 *  @return SwpiPhoneScreenSize
 */
+ (SwpiPhoneScreenSize)swpGetIphoneDeviceByScreenSize;

@end
NS_ASSUME_NONNULL_END
