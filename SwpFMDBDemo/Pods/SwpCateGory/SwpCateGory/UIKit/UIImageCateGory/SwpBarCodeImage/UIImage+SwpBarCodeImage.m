//
//  UIImage+SwpBarCodeImage.m
//  Demo
//
//  Created by swp_song on 16/8/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UIImage+SwpBarCodeImage.h"

@implementation UIImage (SwpBarCodeImage)

#pragma mark - SwpBarCode Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpBarCodeImageCreateWithString:size:   ( 生成条形码, 默认黑白色 )
 *
 *  @param  string  string
 *
 *  @param  size    size
 *
 *  @return UIImage
 */
+ (UIImage *)swpBarCodeImageCreateWithString:(NSString *)string size:(CGSize)size {
    return [self swpBarCodeImageCreateWithString:string size:size barCodeColor:nil backGroundColor:nil];
}

/**
 *  @author swp_song
 *
 *  @brief  swpBarCodeImageCreateWithString:size:barCodeColor:backGroundColor:  ( 生成条形码, 设置颜色 )
 *
 *  @param  string          string
 *
 *  @param  size            size
 *
 *  @param  barCodeColor    barCodeColor
 *
 *  @param  backGroundColor backGroundColor
 *
 *  @return UIImage
 */
+ (UIImage *)swpBarCodeImageCreateWithString:(NSString *)string size:(CGSize)size barCodeColor:(UIColor *)barCodeColor backGroundColor:(UIColor *)backGroundColor {
    CIImage *ciImage = [self swpBarCodeImageCreateWithString:string barCodeColor:barCodeColor backGroundColor:backGroundColor];
    return ciImage ? [self swpBarCodeImageCreateNonInterpolatedUIImageFormCIImage:ciImage size:size] : nil;
}

#pragma mark - SwpBarCode Private Methods
/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageCreateQRWithString:   ( 生成条形码  )
 *
 *  @param  string  string
 *
 *  @return CIImage
 */
+ (CIImage *)swpBarCodeImageCreateWithString:(NSString *)string barCodeColor:(UIColor *)barCodeColor backGroundColor:(UIColor *)backGroundColor {
    
    // 1.将字符串转换为UTF8编码的NSData对象
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    // 2.创建filter
    CIFilter *filter   = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    
    // 3.设置内容和纠错级别
    [filter setValue:stringData forKey:@"inputMessage"];
    
    // 4.返回CIImage
    return [self swpBarCodeImageSetColorForFilter:filter barCodeColor:barCodeColor backGroundColor:backGroundColor];
}

/**
 *  @author swp_song
 *
 *  @brief  swpBarCodeImageSetColorForFilter:barCodeColor:backGroundColor:  ( 设置条形码颜色  )
 *
 *  @param  filter          filter
 *
 *  @param  barCodeColor    barCodeColor
 *
 *  @param  backGroundColor backGroundColor
 *
 *  @return CIImage
 */
+ (CIImage *)swpBarCodeImageSetColorForFilter:(CIFilter *)filter barCodeColor:(UIColor *)barCodeColor backGroundColor:(UIColor *)backGroundColor {
    
    //设置条形码颜色和背景颜色
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"];
    [colorFilter setValue:filter.outputImage forKey:@"inputImage"];
    
    //条形码颜色
    barCodeColor          = barCodeColor    ? barCodeColor    : [UIColor blackColor];
    [colorFilter setValue:[CIColor colorWithCGColor:barCodeColor.CGColor] forKey:@"inputColor0"];
    
    //背景颜色
    backGroundColor       = backGroundColor ? backGroundColor : [UIColor whiteColor];
    [colorFilter setValue:[CIColor colorWithCGColor:backGroundColor.CGColor] forKey:@"inputColor1"];
    
    return colorFilter.outputImage;
}

/**
 *  @author swp_song
 *
 *  @brief  swpBarCodeImageCreateNonInterpolatedUIImageFormCIImage: ( 设置条形码清晰度 )
 *
 *  @param  image       image
 *
 *  @param  size        size
 *
 *  @return UIImage
 */
+ (UIImage *)swpBarCodeImageCreateNonInterpolatedUIImageFormCIImage:(CIImage *)image size:(CGSize)size {
    
    // extent 返回图片的frame
    CGFloat scaleX            = size.width / image.extent.size.width;
    
    CGFloat scaleY            = size.height / image.extent.size.height;
    
    CIImage *transformedImage = [image imageByApplyingTransform:CGAffineTransformScale(CGAffineTransformIdentity, scaleX, scaleY)];
    return [UIImage imageWithCIImage:transformedImage];
}


@end
