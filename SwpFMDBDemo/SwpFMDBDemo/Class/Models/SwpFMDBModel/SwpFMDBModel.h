//
//  SwpFMDBModel.h
//  SwpFMDBDemo
//
//  Created by swp_song on 2017/2/21.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>


@class SwpFMDBModel;
NS_ASSUME_NONNULL_BEGIN

typedef void(^SwpFMDBOption)(SwpFMDBModel *swpFMDBModel);

@interface SwpFMDBModel : NSObject

@property (nonatomic, copy  ) NSString      *swpFMDBTitle;
@property (nonatomic, copy  ) NSString      *swpFMDBSubTitle;
@property (nonatomic, copy  ) SwpFMDBOption swpFMDBOption;
@property (nonatomic, assign) Class swpFMDBJumpContriller;
@property (nonatomic, strong) id  swpFMDBData;



+ (instancetype)swpFMDBWithTitle:(NSString *)title setSwpFMDBSubTitle:(NSString *)subTitle setSwpFMDBOption:(nullable SwpFMDBOption)option setSwpFMDBJumpContriller:(nullable Class)contriller;
@end
NS_ASSUME_NONNULL_END
