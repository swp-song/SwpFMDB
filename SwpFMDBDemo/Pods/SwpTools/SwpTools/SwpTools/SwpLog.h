//
//  SwpLog.h
//  swp_song
//
//  Created by swp_song on 16/4/17.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#ifndef SwpLog_h
#define SwpLog_h


/*! 打印调试信息 方法名称 在该文件的行 !*/
#define NSLogFileNumber(format, ...) do {                                   \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "--------------------------------------------------------------------------\n"); \
} while (0)


//#define NSLogFileNumber(format, ...)  NSLog((@"\r [文件名 : %s] \r" " [函数名 : %s] \r " "[行号 : %d]"  format "\r------"), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

/*! 打印日志 !*/

#ifndef __OPTIMIZE__
    #define NSLog(...) NSLogFileNumber (__VA_ARGS__)
#else
    #define NSLog(...) {}
#endif


#ifdef DEBUG
    #define SwpLog(...) NSLogFileNumber(__VA_ARGS__)
#else
    #define SwpLog(...) NSLogFileNumber(__VA_ARGS__)
#endif



#endif /* SwpLog_h */
