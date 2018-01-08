//
//  RTLoading.m
//  darongtong
//
//  Created by zy on 2017/12/13.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTLoading.h"


@implementation RTLoading

- (void)animationImagesWithYYImage {
    YYImage *image = [YYImage imageNamed:@"wtt_loading.gif"];
    _imageView = [[YYAnimatedImageView alloc] initWithImage:image];
    _imageView.autoPlayAnimatedImage = NO;
    [_imageView startAnimating];
    _imageView.centerX = self.frame.size.width/2;
    _imageView.centerY =self.frame.size.height/2;
    [self addSubview:_imageView];
}

- (void)stopAnimation {
    if (_imageView.isAnimating) {
        [_imageView stopAnimating];
        [self removeFromSuperview];
    }
}

@end
