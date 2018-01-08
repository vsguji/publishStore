//
//  RoundView.m
//  darongtong
//
//  Created by liuxin on 2017/7/11.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RoundView.h"

@interface RoundView ()
{
    UIImageView * moveView;
}
@property (nonatomic,strong)UILabel * numLab;
@end

@implementation RoundView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if (self)
    {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.frame.size.width/2;
        
        moveView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height+20)];
        moveView.image = [UIImage imageNamed:@"sp_百分比背景"];
        [self addSubview:moveView];
        
        _numLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, frame.size.width, 10)];
        _numLab.font = [UIFont systemFontOfSize:10];
        _numLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_numLab];
    }
    return self;
}
-(void)setColorHight:(float)height;
{
    _colorHight = height;
//    moveView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height*_colorHight/10);
    moveView.frame = CGRectMake(0, self.frame.size.height*(1-_colorHight/8), self.frame.size.width, self.frame.size.height);
    _numLab.text = [NSString stringWithFormat:@"%d%%",(int)height*10];
    moveView.hidden = NO;
    self.backgroundColor = [UIColor whiteColor];
    if (height == 10)
    {
        moveView.hidden = YES;
        self.backgroundColor = RGB(162, 163, 139);
    }
}
@end
