//
//  UIImage+Common.h
//  Coding_iOS
//
//  Created by 王 原闯 on 14-8-4.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface UIImage (Common)

+(UIImage *)imageWithColor:(UIColor *)aColor;
+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;
-(UIImage*)scaledToSize:(CGSize)targetSize;
-(UIImage*)scaledToSize:(CGSize)targetSize highQuality:(BOOL)highQuality;
-(UIImage*)scaledToMaxSize:(CGSize )size;
+ (UIImage *)fullResolutionImageFromALAsset:(ALAsset *)asset;
+ (UIImage *)fullScreenImageALAsset:(ALAsset *)asset;

+ (UIImage *)imageWithFileType:(NSString *)fileType;
/**
 *  修改图片size
 *
 *  @param image      原图片
 *  @param targetSize 要修改的size
 *
 *  @return 修改后的图片
 */
+ (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;
- (UIImage *)fixOrientation;

- (UIImage *)thumbnailWithSize:(CGSize)asize;

- (UIImage *)rescaleImageToSize:(CGSize)size;

- (UIImage *)cropImageToRect:(CGRect)cropRect;

- (CGSize)calculateNewSizeForCroppingBox:(CGSize)croppingBox;

- (UIImage *)cropCenterAndScaleImageToSize:(CGSize)cropSize;

- (UIImage *)cropToSquareImage;

// path为图片的键值
- (void)saveToCacheWithKey:(NSString *)key;

+ (UIImage *)loadFromCacheWithKey:(NSString *)key;

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)randomColorImageWith:(CGSize)size;

- (UIImage *)croppedImage:(CGRect)bounds;



@end
#if kSupportUIImageNonCommon

//========================================

@interface UIImage (Cut)

- (UIImage *)clipImageWithScaleWithsize:(CGSize)asize;
- (UIImage *)clipImageWithScaleWithsize:(CGSize)asize roundedCornerImage:(NSInteger)roundedCornerImage borderSize:(NSInteger)borderSize;
@end

//========================================

@interface UIImage (Resize)



- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize transparentBorder:(NSUInteger)borderSize cornerRadius:(NSUInteger)cornerRadius interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode bounds:(CGSize)bounds interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImage:(CGSize)newSize transform:(CGAffineTransform)transform drawTransposed:(BOOL)transpose interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImageInRect:(CGRect)rect transform:(CGAffineTransform)transform drawTransposed:(BOOL)transpose interpolationQuality:(CGInterpolationQuality)quality;

- (CGAffineTransform)transformForOrientation:(CGSize)newSize;

@end

//========================================

@interface UIImage (RoundedCorner)

- (UIImage *)roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;
- (void)addRoundedRectToPath:(CGRect)rect context:(CGContextRef)context ovalWidth:(CGFloat)ovalWidth ovalHeight:(CGFloat)ovalHeight;

@end

//========================================
@interface UIImage (SplitImageIntoTwoParts)
+ (NSArray*)splitImageIntoTwoParts:(UIImage*)image;
@end

#endif
