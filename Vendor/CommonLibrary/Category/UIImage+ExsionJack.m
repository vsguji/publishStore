//
//  UIImage+ExsionJack.m
//  EightPlaces
//
//  Created by luo on 2016/12/26.
//  Copyright © 2016年 Jacky. All rights reserved.
//

#import "UIImage+ExsionJack.h"
#import <Accelerate/Accelerate.h>
#import "DebugMarco.h"

@implementation UIImage (ExsionJack)

//获取截图
+ (UIImage *)scottShot
{
    //1.获取窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    //2.开始上下文
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, YES, 0);
    
    //3.将window中的内容绘制输出到当前上下文
    [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:NO];
    
    //4.获取图片
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    
    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    return screenShot;
}

+ (UIImage *)scottImage:(UIImage *)image blur:(CGFloat)blur
{
    //模糊越界
    if (blur < 0.f ||blur>1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur *40);
    boxSize = boxSize - (boxSize%2) +1;
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer,outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    //设置从CGImage获取对象属性
    inBuffer.width = CGImageGetWidth(img);
    pixelBuffer = malloc(CGImageGetBytesPerRow(img)* CGImageGetHeight(img));
    
    if (pixelBuffer == NULL) {
        DebugLog(@"No pixelbuffer");
    }
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        DebugLog(@"error from convolution %ld",error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

@end
