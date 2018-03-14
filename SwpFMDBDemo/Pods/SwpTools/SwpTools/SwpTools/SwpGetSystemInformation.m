//
//  SwpGetSystemInformation.m
//  swp_song
//
//  Created by swp_song on 2017/1/13.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpGetSystemInformation.h"

@import UIKit;

/*! ---------------------- Tool       ---------------------- !*/
#import <ifaddrs.h>                     // 获取 设备IP   使用
#import <arpa/inet.h>                   // 获取 设备IP   使用
#import <sys/utsname.h>                 // 获取 设备类型 使用
/*! ---------------------- Tool       ---------------------- !*/


@implementation SwpGetSystemInformation

/**
 *  @author swp_song
 *
 *  @brief  swpGetIphoneIpAddress   ( 获取当前电话的 Ip 地址 )
 *
 *  @return NSString Ip
 */
+ (NSString *)swpGetIphoneIpAddress {
    
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr  = NULL;
    int            success     = 0;
    NSString       *address    = @"error";
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

/**
 *  @author swp_song
 *
 *  @brief  swpGetIphoneDeviceType  ( 获取设备类型 )
 *
 *  @return NSString
 */
+ (NSString *)swpGetIphoneDeviceType {
    
    struct utsname systemMessage;
    uname(&systemMessage);
    NSString *deviceType = [NSString stringWithCString:systemMessage.machine encoding:NSUTF8StringEncoding];
    
    //iPhone 系列
    if ([deviceType isEqualToString:@"iPhone1,1"])  return @"iPhone 1G";
    if ([deviceType isEqualToString:@"iPhone1,2"])  return @"iPhone 3G";
    if ([deviceType isEqualToString:@"iPhone2,1"])  return @"iPhone 3GS";
    if ([deviceType isEqualToString:@"iPhone3,1"])  return @"iPhone 4";
    if ([deviceType isEqualToString:@"iPhone3,2"])  return @"Verizon iPhone 4";
    if ([deviceType isEqualToString:@"iPhone4,1"])  return @"iPhone 4S";
    if ([deviceType isEqualToString:@"iPhone5,1"])  return @"iPhone 5";
    if ([deviceType isEqualToString:@"iPhone5,2"])  return @"iPhone 5";
    if ([deviceType isEqualToString:@"iPhone5,3"])  return @"iPhone 5C";
    if ([deviceType isEqualToString:@"iPhone5,4"])  return @"iPhone 5C";
    if ([deviceType isEqualToString:@"iPhone6,1"])  return @"iPhone 5S";
    if ([deviceType isEqualToString:@"iPhone6,2"])  return @"iPhone 5S";
    if ([deviceType isEqualToString:@"iPhone7,1"])  return @"iPhone 6 Plus";
    if ([deviceType isEqualToString:@"iPhone7,2"])  return @"iPhone 6";
    if ([deviceType isEqualToString:@"iPhone8,1"])  return @"iPhone 6s";
    if ([deviceType isEqualToString:@"iPhone8,2"])  return @"iPhone 6s Plus";
    if ([deviceType isEqualToString:@"iPhone9,1"])  return @"iPhone 7 (CDMA)";
    if ([deviceType isEqualToString:@"iPhone9,3"])  return @"iPhone 7 (GSM)";
    if ([deviceType isEqualToString:@"iPhone9,2"])  return @"iPhone 7 Plus (CDMA)";
    if ([deviceType isEqualToString:@"iPhone9,4"])  return @"iPhone 7 Plus (GSM)";
    
    //iPod 系列
    if ([deviceType isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([deviceType isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([deviceType isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([deviceType isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([deviceType isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    //iPad 系列
    if ([deviceType isEqualToString:@"iPad1,1"])   return @"iPad";
    if ([deviceType isEqualToString:@"iPad2,1"])   return @"iPad 2 (WiFi)";
    if ([deviceType isEqualToString:@"iPad2,2"])   return @"iPad 2 (GSM)";
    if ([deviceType isEqualToString:@"iPad2,3"])   return @"iPad 2 (CDMA)";
    if ([deviceType isEqualToString:@"iPad2,4"])   return @"iPad 2 (32nm)";
    if ([deviceType isEqualToString:@"iPad2,5"])   return @"iPad mini (WiFi)";
    if ([deviceType isEqualToString:@"iPad2,6"])   return @"iPad mini (GSM)";
    if ([deviceType isEqualToString:@"iPad2,7"])   return @"iPad mini (CDMA)";
    
    if ([deviceType isEqualToString:@"iPad3,1"])   return @"iPad 3(WiFi)";
    if ([deviceType isEqualToString:@"iPad3,2"])   return @"iPad 3(CDMA)";
    if ([deviceType isEqualToString:@"iPad3,3"])   return @"iPad 3(4G)";
    if ([deviceType isEqualToString:@"iPad3,4"])   return @"iPad 4 (WiFi)";
    if ([deviceType isEqualToString:@"iPad3,5"])   return @"iPad 4 (4G)";
    if ([deviceType isEqualToString:@"iPad3,6"])   return @"iPad 4 (CDMA)";
    
    if ([deviceType isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([deviceType isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([deviceType isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([deviceType isEqualToString:@"iPad5,3"])   return @"iPad Air 2";
    if ([deviceType isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    if ([deviceType isEqualToString:@"i386"])      return @"Simulator";
    if ([deviceType isEqualToString:@"x86_64"])    return @"Simulator";
    
    if ([deviceType isEqualToString:@"iPad4,4"] || [deviceType isEqualToString:@"iPad4,5"] || [deviceType isEqualToString:@"iPad4,6"])   return @"iPad mini 2";
    
    if ([deviceType isEqualToString:@"iPad4,7"] || [deviceType isEqualToString:@"iPad4,8"] || [deviceType isEqualToString:@"iPad4,9"])   return @"iPad mini 3";
    
    return deviceType;
}


/**
 *  @author swp_song
 *
 *  @brief  swpGetIphoneDeviceByScreenSize  ( 根据屏幕尺寸获取设备类型 )
 *
 *  @return SwpiPhoneScreenSize
 */
+ (SwpiPhoneScreenSize)swpGetIphoneDeviceByScreenSize {
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        
        //  获取屏幕尺寸信息
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        
        //  竖屏情况
        if (screenSize.height > screenSize.width) {
            
            if (screenSize.height == 568) {
                
                //  iPhone 5 / 5S / 5C / SE (iPod / iPod touch)
                return SwpiPhoneScreenSize4_0;
                
            } else if (screenSize.height == 667) {
                
                //  iPone 6 / 6S / 7 / 8
                return SwpiPhoneScreenSize4_7;
                
            } else if (screenSize.height == 736) {
                
                //  iPone 6 Plus / 6S Plus / 7 Plus / 8 Plus
                return SwpiPhoneScreenSize5_5;
                
            } if (screenSize.height == 812)  {
                
                //  iPone X
                return SwpiPhoneScreenSize5_8;
                
            } else {
                
                //  iPhone 4 / 4S
                return SwpiPhoneScreenSize3_5;
            }
            
        }
        
        //  横屏情况
        if (screenSize.width > screenSize.height) {
            
            if (screenSize.width == 568) {
                
                //  iPhone 5 / 5S / 5C / SE (iPod / iPod touch)
                return SwpiPhoneScreenSize4_0;
                
            } else if (screenSize.width == 667) {
                
                //  iPone 6 / 6S / 7 / 8
                return SwpiPhoneScreenSize4_7;
                
            } else if (screenSize.width == 736) {
                
                //  iPone 6 Plus / 6S Plus / 7 Plus / 8 Plus
                return SwpiPhoneScreenSize5_5;
                
            } else if (screenSize.width == 812) {
                
                //  iPone X
                return SwpiPhoneScreenSize5_8;
                
            } else {
                
                //  iPhone 4 / 4S
                return SwpiPhoneScreenSize3_5;
            }
        }
    }
    
    return SwpiPhoneScreenSizeUnspecified;
}







@end

