//
//  UIImage+Extension.h
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+(UIImage *)imageWithName:(NSString *)name;
+(UIImage *)resizableImage:(NSString *)name;

- (instancetype)circleImage;
+ (instancetype)circleImageNamed:(NSString *)name;

/*  等宽高裁剪图片. */
+ (UIImage *)captureWithImage:(UIImage *)image;

@end
