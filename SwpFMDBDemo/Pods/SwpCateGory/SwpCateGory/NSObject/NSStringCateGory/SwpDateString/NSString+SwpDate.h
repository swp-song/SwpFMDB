//
//  NSString+SwpDate.h
//  swp_song
//
//  Created by swp_song on 16/6/2.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSString (SwpDate)

/**
 *  @author swp_song
 *
 *  @brief  swpDateGetSystemDateWithDateFormat: ( 获取当前系统时间，按照指定格式转换成字符串 )
 *
 *  @param  dateFormat  dateFormat
 *
 *  @return NSString
 */
+ (NSString *)swpDateGetSystemDateWithDateFormat:(NSString *)dateFormat;

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
+ (NSString *)swpDateFormatDate:(NSDate *)formatDate formatString:(NSString *)formatString;

@end
NS_ASSUME_NONNULL_END
