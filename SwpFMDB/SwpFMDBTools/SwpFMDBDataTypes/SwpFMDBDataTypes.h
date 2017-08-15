//
//  SwpFMDBDataTypes.h
//  swp_song
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SwpFMDB;

NS_ASSUME_NONNULL_BEGIN
@interface SwpFMDBDataTypes : NSObject

/** 数据库回调 Block        */
typedef void(^SwpFMDBExecutionUpdateComplete)(SwpFMDB *swpFMDB, BOOL executionStatus);
/** 单条数据查询回调 Block  */
typedef void(^SwpFMDBExecutionSelectModelComplete)(SwpFMDB *swpFMDB, BOOL executionStatus, id model);
/** 多条数据查询回调 Block  */
typedef void(^SwpFMDBExecutionSelectModelsComplete)(SwpFMDB *swpFMDB, BOOL executionStatus, NSArray *models);

@end
NS_ASSUME_NONNULL_END
