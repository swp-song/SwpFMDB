//
//  UIImage+SwpQrCodeImage.m
//  swp_song
//
//  Created by swp_song on 16/8/26.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "UIImage+SwpQrCodeImage.h"

@implementation UIImage (SwpQrCodeImage)

#pragma mark - SwpQrCodeImage Public Methods

/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageWithString:clarity:   ( 生成二维码， 设置清晰度 )
 *
 *  @param  string  string
 *
 *  @param  clarity clarity
 *
 *  @return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string clarity:(CGFloat)clarity {
    //  swpQrCodeImageCreateWithString 生成二维码
    CIImage *ciImage = [self swpQrCodeImageCreateWithString:string];
    
    //  swpQrCodeImageCreateNonInterpolatedUIImageFormCIImage 调整图片清晰度
    return  ciImage ? [self swpQrCodeImageCreateNonInterpolatedUIImageFormCIImage:ciImage clarity:clarity] : nil;
}

/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageWithString:setSize:color: ( 生成二维码, 设置清晰度，二维码颜色 )
 *
 *  @param  string  string
 *
 *  @param  clarity clarity
 *
 *  @param  color   color
 *
 *  @return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string clarity:(CGFloat)clarity color:(UIColor *)color {
    
    
    UIImage *image = [self swpQrCodeImageWithString:string clarity:clarity];
    
    const CGFloat *components  = CGColorGetComponents(color.CGColor);
    CGFloat       red          = components[0] * 255;
    CGFloat       green        = components[1] * 255;
    CGFloat       blue         = components[2] * 255;
    
    const int imageWidth       = image.size.width;
    const int imageHeight      = image.size.height;
    size_t    bytesPerRow      = imageWidth * 4;
    uint32_t *rgbImageBuf      = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    // 1.创建上下文
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef    context    = CGBitmapContextCreate(rgbImageBuf,
                                                       imageWidth,
                                                       imageHeight,
                                                       8,
                                                       bytesPerRow,
                                                       colorSpace,
                                                       kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    
    // 2.像素转换
    int      pixelNum = imageWidth * imageHeight;
    uint32_t *pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++){
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900){
            uint8_t *ptr = (uint8_t*)pCurPtr;
            ptr[3]       = red;//0~255
            ptr[2]       = green;
            ptr[1]       = blue;
        }else{
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[0]       = 0;
        }
    }
    
    // 3.生成UIImage
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef        imageRef     = CGImageCreate(imageWidth,
                                                   imageHeight,
                                                   8,
                                                   32,
                                                   bytesPerRow,
                                                   colorSpace,
                                                   kCGImageAlphaLast | kCGBitmapByteOrder32Little,
                                                   dataProvider,
                                                   NULL,
                                                   true,
                                                   kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    UIImage *resultImage = [UIImage imageWithCGImage:imageRef];
    
    // 4.释放
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    return resultImage;
}

/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageWithString:clarity:icon:iconWidth:    ( 生成二维码, 设置清晰度, 默认黑色, 中间填充图片 )
 *
 *  @param  string      string
 *
 *  @param  clarity     clarity
 *
 *  @param  icon        icon
 *
 *  @param  iconWidth   iconWidth
 *
 *  @return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string clarity:(CGFloat)clarity icon:(UIImage *)icon iconWidth:(CGFloat)iconWidth {
    return [self swpQrCodeImageWithString:string clarity:clarity color:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.00] icon:icon iconWidth:iconWidth];
}

/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageWithString:clarity:color:icon:iconWidth:  ( 生成二维码, 设置清晰度, 二维码颜色, 中间填充图片 )
 *
 *  @param  string      string
 *
 *  @param  clarity     clarity
 *
 *  @param  color       color
 *
 *  @param  icon        icon
 *
 *  @param  iconWidth   iconWidth
 *
 *  @return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string clarity:(CGFloat)clarity color:(UIColor *)color icon:(UIImage *)icon iconWidth:(CGFloat)iconWidth {
    UIImage *bgImage  = [self swpQrCodeImageWithString:string clarity:clarity color:color];
    UIGraphicsBeginImageContext(bgImage.size);
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    CGFloat x         = (bgImage.size.width - iconWidth) * 0.5;
    CGFloat y         = (bgImage.size.height - iconWidth) * 0.5;
    [icon drawInRect:CGRectMake( x,  y, iconWidth,  iconWidth)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - Swp QrCode Image Private Methods
/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageCreateQRWithString:   ( 生成二维码  )
 *
 *  @param  string  string
 *
 *  @return CIImage CIImage
 */
+ (CIImage *)swpQrCodeImageCreateWithString:(NSString *)string {
    // 1.将字符串转换为UTF8编码的NSData对象
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 2.创建filter
    CIFilter *filter   = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 3.设置内容和纠错级别
    [filter setValue:stringData forKey:@"inputMessage"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    // 4.返回CIImage
    return filter.outputImage;
}

/**
 *  @author swp_song
 *
 *  @brief  swpQrCodeImageCreateNonInterpolatedUIImageFormCIImage:  ( 调整图片清晰度 )
 *
 *  @param  image   image
 *
 *  @param  clarity clarity
 *
 *  @return UIImage
 */
+ (UIImage *)swpQrCodeImageCreateNonInterpolatedUIImageFormCIImage:(CIImage *)image clarity:(CGFloat)clarity {
    
    CGRect          extent      = CGRectIntegral(image.extent);
    CGFloat         scale       = MIN(clarity / CGRectGetWidth(extent), clarity / CGRectGetHeight(extent));
    
    // 1.创建一个位图图像，绘制到其大小的位图上下文
    size_t          width       = CGRectGetWidth(extent) * scale;
    size_t          height      = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs          = CGColorSpaceCreateDeviceGray();
    CGContextRef    bitmapRef   = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext       *context    = [CIContext contextWithOptions:nil];
    CGImageRef      bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.创建具有内容的位图图像
    CGImageRef scaledImage      = CGBitmapContextCreateImage(bitmapRef);
    
    // 3.清理
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

void ProviderReleaseData(void *info, const void *data, size_t size){
    free((void *)data);
}


@end
