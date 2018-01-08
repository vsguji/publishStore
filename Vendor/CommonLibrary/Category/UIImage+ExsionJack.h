//
//  UIImage+ExsionJack.h
//  EightPlaces
//
//  Created by luo on 2016/12/26.
//  Copyright © 2016年 Jacky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ExsionJack)
/**
 * 获取屏幕截图像
 */
+ (UIImage *)scottShot;

/**
 *   生成一张高斯模糊的图片
 *   @param image 模糊程度（0-1）
 *
 * @return 高斯模糊图片
 */
+ (UIImage *)scottImage:(UIImage *)image blur:(CGFloat)blur;




@end
