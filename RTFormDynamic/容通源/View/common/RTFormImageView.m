//
//  RTFormImageView.m
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTFormImageView.h"
#import "UIView+Altar.h"
#import "UtilsMacro.h"
@implementation RTFormImageView


- (void)relayoutFrameOfSubViews {
    
    CGRect frame = self.bounds;
    [self drawRect:frame];
}

- (void)drawRect:(CGRect)rect {
   
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGFloat icon_width = LENGTH(97);
    CGFloat icon_height = LENGTH(101);
    CALayer *layer0 = [CALayer layer];
    layer0.contents = (__bridge id)[UIImage imageNamed:@"form_bg_level0"].CGImage;
    layer0.frame = rect;
    
    CALayer *layer1 = [CALayer layer];
    layer1.contents = (__bridge id)[UIImage imageNamed:@"form_bg_level2"].CGImage;
    layer1.frame = rect;
    
    CALayer *layer2 = [CALayer layer];
    layer2.contents = (__bridge id)[UIImage imageNamed:@"form_bg_level4"].CGImage;
    layer2.frame = CGRectMake((width - icon_width)/2, (height - icon_height)/2, icon_width, icon_height);
    
    CALayer *layer3 = [CALayer layer];
    layer3.contents = (__bridge id)[UIImage imageNamed:@"form_bg_level1"].CGImage;
    layer3.frame = rect;
    
    CALayer *layer4 = [CALayer layer];
    layer4.contents = (__bridge id)[UIImage imageNamed:@"form_bg_level3"].CGImage;
    layer4.frame = rect;
    
     [self.layer addSublayer:layer0];
     [self.layer addSublayer:layer1];
     [self.layer addSublayer:layer2];
     [self.layer addSublayer:layer3];
     [self.layer addSublayer:layer4];
}

@end
