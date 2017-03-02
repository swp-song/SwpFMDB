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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageWithString:   ( 生成 二维码 )
 *
 *  @ param  string
 *
 *  @ param  width
 *
 *  @ return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string size:(CGFloat)width {
    CIImage *ciImage = [self swpQrCodeImageCreateWithString:string];
    return  ciImage ? [self swpQrCodeImageCreateNonInterpolatedUIImageFormCIImage:ciImage size:width] : nil;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageWithString:setSize:setColor:  ( 生成 二维码, 颜色 )
 *
 *  @ param  string
 *
 *  @ param  width
 *
 *  @ param  color
 *
 *  @ return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string size:(CGFloat)width color:(UIColor *)color {
    
    
    UIImage *image = [self swpQrCodeImageWithString:string size:width];
    
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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageWithString:size:icon:iconWidth  ( 生成 二维码, 默认颜色 < 黑色 >, 中间填充图片 )
 *
 *  @ param  string
 *
 *  @ param  width
 *
 *  @ param  icon
 *
 *  @ param  iconWidth
 *
 *  @ return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string size:(CGFloat)width icon:(UIImage *)icon iconWidth:(CGFloat)iconWidth {
    return [self swpQrCodeImageWithString:string size:width color:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.00] icon:icon iconWidth:iconWidth];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageWithString:size:color:icon:iconWidth  ( 生成 二维码, 颜色, 中间填充图片 )
 *
 *  @ param  string
 *
 *  @ param  width
 *
 *  @ param  color
 *
 *  @ param  icon
 *
 *  @ param  iconWidth
 *
 *  @ return UIImage
 */
+ (UIImage *)swpQrCodeImageWithString:(NSString *)string size:(CGFloat)width color:(UIColor *)color icon:(UIImage *)icon iconWidth:(CGFloat)iconWidth {
    UIImage *bgImage  = [self swpQrCodeImageWithString:string size:width color:color];
    UIGraphicsBeginImageContext(bgImage.size);
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    CGFloat x         = (bgImage.size.width - iconWidth) * 0.5;
    CGFloat y         = (bgImage.size.height - iconWidth) * 0.5;
    [icon drawInRect:CGRectMake( x,  y, iconWidth,  iconWidth)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - SwpQrCodeImage Private Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageCreateQRWithString:   ( 生成 二维码  )
 *
 *  @ param  string
 *
 *  @ return CIImage
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

/**!
 *  @ author swp_song
 *
 *  @ brief  swpQrCodeImageCreateNonInterpolatedUIImageFormCIImage:  ( 调整 图片 清晰 度 )
 *
 *  @ param  image
 *
 *  @ param  size
 *
 *  @ return UIImage
 */
+ (UIImage *)swpQrCodeImageCreateNonInterpolatedUIImageFormCIImage:(CIImage *)image size:(CGFloat)size {
    
    CGRect          extent      = CGRectIntegral(image.extent);
    CGFloat         scale       = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent));
    
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
