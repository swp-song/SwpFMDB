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
fprintf(stderr, "-------\n");                                               \
} while (0)


    /*! 打印日志 !*/
#ifdef DEBUG
    #define NSLog(...) NSLogFileNumber(__VA_ARGS__)
#else
    #define NSLog(...)
#endif



#endif /* SwpLog_h */
