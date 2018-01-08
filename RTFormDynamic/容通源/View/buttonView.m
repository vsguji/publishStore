//
//  buttonView.m
//  darongtong
//
//  Created by liuxin on 2017/7/4.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "buttonView.h"

@interface buttonView()
{
    storePublishModel * model;
}
@property(nonatomic,strong)UIImageView * selectImgVIew;
@property(nonatomic,strong)UIButton * touchBtn;
@property(nonatomic,strong)UIImageView * arrowImgVIew;

@end

@implementation buttonView

-(id)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if (self)
    {
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        model = [[storePublishModel alloc]init];
        _touchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_touchBtn];
        _selectImgVIew = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 0, 30, 30)];
        _selectImgVIew.image = [UIImage imageNamed:@"sp_勾-拷贝"];
        _selectImgVIew.hidden = YES;
        [self addSubview:_selectImgVIew];
    }
    return self;
}
-(void)buildDefaultViewWithTitle:(NSString *)title backImg:(NSString *)backImg buttonImage:(NSString *)btnImg
{
    model.className = title;
    
    _titleStr = title;
    _backImgName = backImg;
    _btnImgName = btnImg;
    
    UIImage *image = [UIImage imageNamed:_backImgName];
    image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
    
    _touchBtn.frame = CGRectMake(0, 0, self.width_cust, self.height_cust);
    _touchBtn.tag = self.tag;
    [_touchBtn setAdjustsImageWhenHighlighted:NO];
    [_touchBtn setContentMode:UIViewContentModeScaleAspectFill];
    [_touchBtn setBackgroundImage:image forState:UIControlStateNormal];
    [_touchBtn setImage:[UIImage imageNamed:btnImg] forState:UIControlStateNormal];
    [_touchBtn setTitle:title forState:UIControlStateNormal];
    [_touchBtn setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
    [_touchBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, _touchBtn.imageView.bounds.size.width+10, 0, 0)];
    [_touchBtn addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)buildBigViewWithTitle:(NSString *)title backImg:(NSString *)backImg buttonImage:(NSString *)btnImg labelStr:(NSString *)labStr arrowImg:(NSString *)arrowImg
{
    model.className = title;
    model.typeName = labStr;
    
    _titleStr = title;
    _backImgName = backImg;
    _btnImgName = btnImg;
    _lableName = labStr;
    _arrowImgName = arrowImg;
    
    UIImage *image = [UIImage imageNamed:_backImgName];
    image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
    
    _touchBtn.frame = CGRectMake(0, 0, self.width_cust, self.height_cust);
    _touchBtn.tag = self.tag;
    [_touchBtn setAdjustsImageWhenHighlighted:NO];
    [_touchBtn setContentMode:UIViewContentModeScaleAspectFill];
    [_touchBtn setBackgroundImage:image forState:UIControlStateNormal];
    [_touchBtn setImage:[UIImage imageNamed:btnImg] forState:UIControlStateNormal];
    [_touchBtn setTitle:title forState:UIControlStateNormal];
    [_touchBtn setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
    [_touchBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 20, 0, self.width_cust-_touchBtn.imageView.self.width_cust-20)];
    [_touchBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, _touchBtn.imageView.bounds.size.width+10, 0, self.width_cust-_touchBtn.imageView.right_cust-50)];
    [_touchBtn addTarget:self action:@selector(touchAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _datailLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, self.width_cust-135, self.height_cust)];
    _datailLabel.textAlignment = NSTextAlignmentRight;
    _datailLabel.textColor = HexColor(0xe2e2e2);
    _datailLabel.font = [UIFont systemFontOfSize:14];
    _datailLabel.text = labStr;
    [self addSubview:_datailLabel];
    
    _arrowImgVIew = [[UIImageView alloc] initWithFrame:CGRectMake(self.width_cust-26, 10, 17, self.height_cust-20)];
    _arrowImgVIew.image = [UIImage imageNamed:arrowImg];
    [self addSubview:_arrowImgVIew];
    
    
}

-(void)touchAction:(UIButton *)sender
{
    for (UIView * view in [[self superview]subviews])
    {
        if ([view isKindOfClass:[self class]])
        {
            buttonView * bView =(buttonView *) view;
            
            bView.selectImgVIew.hidden = YES;
            [bView.touchBtn setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
            [bView.touchBtn setImage:[UIImage imageNamed:bView.btnImgName] forState:UIControlStateNormal];
            [bView.touchBtn setBackgroundImage:[UIImage imageNamed:bView.backImgName] forState:UIControlStateNormal];
            {
                bView.datailLabel.textColor = HexColor(0xe2e2e2);
                bView.arrowImgVIew.image = [UIImage imageNamed:_arrowImgName];
            }
        }
        self.selectImgVIew.hidden = NO;
        [sender setTitleColor:HexColor(0x5cc36c) forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@-1",_btnImgName]] forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"sp_圆角矩形-3"] forState:UIControlStateNormal];
        if ([_titleStr isEqualToString:@"企业"])
        {
            self.datailLabel.textColor = HexColor(0x5cc36c);
            self.arrowImgVIew.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-1",_arrowImgName]];
        }
    }
    _selectImgVIew.hidden = NO;
    if (self.delegate && [self.delegate respondsToSelector:@selector(getdateModel:)])
    {
        [self.delegate getdateModel:model];
    }
}
@end
