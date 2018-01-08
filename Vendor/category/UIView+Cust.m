//
//  UIView+Cust.m
//  darongtong
//
//  Created by luo on 2017/7/12.
//  Copyright © 2017年 darongtong. All rights reserved.
//



@implementation UIView (Cust)

- (void)setCenterX_cust:(CGFloat)centerX_cust
{
    CGPoint center = self.center;
    center.x = centerX_cust;
    self.center = center;
}
- (CGFloat)centerX_cust
{
    return self.center.x;
}
- (void)setCenterY_cust:(CGFloat)centerY_cust
{
    CGPoint center = self.center;
    center.y = centerY_cust;
    self.center = center;
}

- (CGFloat)centerY_cust
{
    return self.center.y;
}

- (void)setWidth_cust:(CGFloat)width_cust
{
    CGRect frame = self.frame;
    frame.size.width = width_cust;
    self.frame = frame;
}

- (CGFloat)width_cust
{
    return self.frame.size.width;
}

- (void)setHeight_cust:(CGFloat)height_cust
{
    CGRect frame = self.frame;
    frame.size.height = height_cust;
    self.frame = frame;
}

- (CGFloat)height_cust
{
    return self.frame.size.height;
}

- (void)setSize_cust:(CGSize)size_cust
{
    CGRect frame = self.frame;
    frame.size = size_cust;
    self.frame = frame;
}

- (CGSize)size_cust
{
    return self.frame.size;
}

- (void)setTop_cust:(CGFloat)top_cust
{
    self.frame = CGRectMake(self.left, top_cust, self.width, self.height);
}

- (CGFloat)top_cust
{
    return self.frame.origin.y;
}

- (void)setBottom_cust:(CGFloat)b
{
   self.frame = CGRectMake(self.left, b - self.height, self.width, self.height);
}

- (CGFloat)bottom_cust
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLeft_cust:(CGFloat)l
{
   self.frame = CGRectMake(l, self.top, self.width, self.height);
}

- (CGFloat)left_cust
{
    return self.frame.origin.x;
}

- (void)setRight_cust:(CGFloat)r
{
    self.frame = CGRectMake(r - self.width, self.top, self.width, self.height); 
}

- (CGFloat)right_cust
{
    return self.frame.origin.x + self.frame.size.width;
}



@end
