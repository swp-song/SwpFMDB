//
//  SwpWeakifyHeader.h
//  swp_song
//
//  Created by swp_song on 16/1/9.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#ifndef SwpWeakifyHeader_h
#define SwpWeakifyHeader_h

    #ifndef swpWeakify
        #if __has_feature(objc_arc)
            #define swpWeakify( object ) \
                    _Pragma("clang diagnostic push") \
                    _Pragma("clang diagnostic ignored \"-Wshadow\"") \
                    autoreleasepool{} __weak __typeof__(object) __weak_##object##__ = object; \
                    _Pragma("clang diagnostic pop")
            #else
            #define swpWeakify( object ) \
                _Pragma("clang diagnostic push") \
                _Pragma("clang diagnostic ignored \"-Wshadow\"") \
                autoreleasepool{} __block __typeof__(object) __block_##object##__ = object; \
                _Pragma("clang diagnostic pop")
        #endif
    #endif

    #ifndef swpStrongify
        #if __has_feature(objc_arc)
            #define swpStrongify( object ) \
                _Pragma("clang diagnostic push") \
                _Pragma("clang diagnostic ignored \"-Wshadow\"") \
                try{} @finally{} __typeof__(object) object = __weak_##object##__; \
                _Pragma("clang diagnostic pop")
            #else

            #define swpStrongify( object ) \
                _Pragma("clang diagnostic push") \
                _Pragma("clang diagnostic ignored \"-Wshadow\"") \
                try{} @finally{} __typeof__(object) object = __block_##object##__; \
                _Pragma("clang diagnostic pop")
            #endif
    #endif

#endif /* SwpWeakifyHeader_h */
