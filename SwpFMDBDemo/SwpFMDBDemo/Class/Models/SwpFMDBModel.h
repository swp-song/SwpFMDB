//
//  SwpFMDBModel.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

typedef void(^SwpFMDBOption)();

@interface SwpFMDBModel : NSObject

@property (nonatomic, copy  ) NSString      *swpFMDBTitle;
@property (nonatomic, copy  ) SwpFMDBOption swpFMDBOption;
@property (nonatomic, assign) Class swpFMDBJumpContriller;

+ (instancetype)swpFMDBWithTitle:(NSString *)title setSwpFMDBOption:(nullable SwpFMDBOption)option setSwpFMDBJumpContriller:(nullable Class)contriller;

@end
NS_ASSUME_NONNULL_END
