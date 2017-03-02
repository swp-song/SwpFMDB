//
//  NSString+SwpDate.m
//  swp_song
//
//  Created by swp_song on 16/6/2.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "NSString+SwpDate.h"

@implementation NSString (SwpDate)

/**!
 *  @ author swp_song
 *
 *  @ brief  swpDateGetSystemDateWithDateFormat: ( 获取 当前系统 时间 按照指定格式 转换成 字符串 )
 *
 *  @ param  dateFormat
 *
 *  @ return NSString
 */
+ (NSString *)swpDateGetSystemDateWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:[NSDate date]];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpDateFormatDate:  ( 格式化 时间 按照 指定格式 )
 *
 *  @ param  formatDate
 *
 *  @ param  formatString
 *
 *  @return NSString
 */
+ (NSString *)swpDateFormatDate:(NSDate *)formatDate formatString:(NSString *)formatString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    return [dateFormatter stringFromDate:formatDate];
}

@end
