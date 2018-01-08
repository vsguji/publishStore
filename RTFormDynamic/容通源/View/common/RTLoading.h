//
//  RTLoading.h
//  darongtong
//
//  Created by zy on 2017/12/13.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYImage.h"
@interface RTLoading : UIView
{
    YYAnimatedImageView *_imageView;
}

- (void)animationImagesWithYYImage;

- (void)stopAnimation;
@end
