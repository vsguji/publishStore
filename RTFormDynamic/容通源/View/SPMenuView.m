//
//  HshsMenuView.m
//  darongtong
//
//  Created by liuxin on 2017/6/28.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "SPMenuView.h"

@implementation SPMenuView
- (instancetype)initWithDataArray:(NSArray *)arr
{
    self = [super init];
    if (self)
    {
        self.frame = [UIScreen mainScreen].bounds;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        backView.backgroundColor = [UIColor grayColor];
        backView.alpha = 0.8;
        [self addSubview:backView];
        self.array = arr;
        v_h = (self.array.count+1)*44+20+self.array.count;
        [self createUI];
        
    }
    return self;
}
- (void)createUI
{
    _BtnbgView = [[UIView alloc] initWithFrame:CGRectMake(10, kScreenH, kScreenW-20, v_h)];
    [self addSubview:_BtnbgView];
    
    UIColor * nColor= RGB(242, 242, 242);
    UIColor * sColor= RGB(97, 112, 94);
    
    for (int i = 0; i<=self.array.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 5;
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        btn.layer.borderWidth = 1;
        
        [btn setTitleColor:sColor forState:UIControlStateNormal];
        [btn setTitleColor:nColor forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[self createImageWithColor:nColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[self createImageWithColor:sColor] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(clickBtnSelectType:) forControlEvents:UIControlEventTouchUpInside];
        if (i == self.array.count)
        {
            btn.frame = CGRectMake(0, (44 +1)*(i)+10, _BtnbgView.width, 44);
            [btn setTitle:@"取消" forState:UIControlStateNormal];
        }else
        {
            btn.frame = CGRectMake(0,(44+1)*i, _BtnbgView.width, 44); 
            [btn setTitle:[self.array objectAtIndex:i] forState:UIControlStateNormal];
        }
        btn.tag = i + 100;
        [_BtnbgView addSubview:btn];
    }
}
- (void)clickBtnSelectType:(UIButton *)btn {
    if (self.blockSelectType) {
        self.blockSelectType(btn);
    }
}
- (void)show
{
    self.hidden = NO;
    [UIView animateWithDuration:.3 animations:^{
        _BtnbgView.frame = CGRectMake(10, kScreenH - v_h, kScreenW-20, v_h);
    }];
}
- (void)hide
{
    [UIView animateWithDuration:.3 animations:^{
        _BtnbgView.frame = CGRectMake(10, kScreenH, kScreenW-20, v_h);
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
