

//
//  UIView+Altar.m
//  darongtong
//
//  Created by darongtong on 2017/8/10.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "UIView+Altar.h"

@implementation UIView (Altar)
- (id)init
{
    if (self = [self initWithFrame:CGRectZero]) {
        if (![self isAutoLayout])
        {
            [self addOwnViews];
            [self configOwnViews];
        }
        else
        {//  
            [self autoLayoutSubViews];
        }
    }
    return self;
}

- (BOOL)isAutoLayout
{
    return NO;
}

- (void)autoLayoutSubViews
{
    
}

- (void)addOwnViews
{
    // 添加自己的控件
}

- (void)configOwnViews
{
    // 初始化控件的值
}

//- (void)configWith:(NSMutableDictionary *)jsonDic
//{
//
//}

- (void)setFrameAndLayout:(CGRect)rect
{
    self.frame = rect;
    if (self.bounds.size.width != 0 && self.bounds.size.height != 0)
    {
        [self relayoutFrameOfSubViews];
    }
}
- (void)relayoutFrameOfSubViews
{
    // do nothing here
}

- (void)addBottomLine:(CGRect)rect
{
    [self addBottomLine:[UIColor lightGrayColor] inRect:rect];
}

- (void)addBottomLine:(UIColor *)color inRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    
    //Set the stroke (pen) color
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
   	CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    CGContextStrokePath(context);
    UIGraphicsPopContext();
    
}

@end

@implementation UIView (ShakeAnimation)

- (void)shake
{
    CGFloat t =4.0;
    CGAffineTransform translateRight = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    self.transform = translateLeft;
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        self.transform = translateRight;
    } completion:^(BOOL finished) {
        if(finished)
        {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.transform =CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

@end



@implementation UIView (viewSize)

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end

