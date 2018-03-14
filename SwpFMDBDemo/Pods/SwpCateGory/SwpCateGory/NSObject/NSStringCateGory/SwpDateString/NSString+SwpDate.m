//
//  NSString+SwpDate.m
//  swp_song
//
//  Created by swp_song on 16/6/2.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "NSString+SwpDate.h"

@implementation NSString (SwpDate)

/**
 *  @author swp_song
 *
 *  @brief  swpDateGetSystemDateWithDateFormat: ( 获取当前系统时间，按照指定格式转换成字符串 )
 *
 *  @param  dateFormat  dateFormat
 *
 *  @return NSString
 */
+ (NSString *)swpDateGetSystemDateWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:[NSDate date]];
}

/**
 *  @author swp_song
 *
 *  @brief  swpDateFormatDate:  ( 格式化时间，按照指定格式 )
 *
 *  @param  formatDate      formatDate
 *
 *  @param  formatString    formatString
 *
 *  @return NSString
 */
+ (NSString *)swpDateFormatDate:(NSDate *)formatDate formatString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    return [dateFormatter stringFromDate:formatDate];
}

@end
