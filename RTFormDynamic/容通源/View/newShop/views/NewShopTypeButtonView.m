//
//  RTFormButtonView.m
//  darongtong
//
//  Created by zy on 2017/12/15.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopTypeButtonView.h"
#import "UIView+Altar.h"
@implementation NewShopTypeButtonView

- (void)addOwnViews {
    _bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_bgBtn];
    _smallBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_smallBtn];
    _rgImg = [[UIImageView alloc] init];
    [self addSubview:_rgImg];
    _rgImg.hidden = YES;
}

- (void)configOwnViews {
    [_bgBtn setTitleColor:kBlackColor forState:UIControlStateNormal];
    [_bgBtn.titleLabel setFont:FONT(LENGTH(14))];
    _bgBtn.titleLabel.numberOfLines = 0;
    _bgBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [_bgBtn setBackgroundImage:[UIImage imageNamed:@"form_btn_normal_bg"] forState:UIControlStateNormal];
    [_bgBtn setBackgroundImage:[UIImage imageNamed:@"form_btn_sel_bg"] forState:UIControlStateSelected];
    [_smallBtn setImage:[UIImage imageNamed:@"form_check_normal_btn"] forState:UIControlStateNormal];
    [_smallBtn setImage:[UIImage imageNamed:@"form_check_sel_btn"] forState:UIControlStateSelected];
}

- (void)configOwnViewsWidthInfo:(id<RTFormSubButtonsProtocol,RTFormRowProtocol>)info  {
    
    _bgBtn.selected = [info buttonIsSelected];
    _smallBtn.selected = [info buttonIsSelected];
    if ([info rowHeight] > 30) {
       // [_bgBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    if ([info respondsToSelector:@selector(rowString)]) {
        [_bgBtn setTitle:[info rowString] forState:UIControlStateNormal];
        [_bgBtn.titleLabel sizeToFit];
    }
}

- (void)relayoutFrameOfSubViews {
    [_bgBtn marginParentWithEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [_smallBtn setSize:(CGSize){LENGTH(26),LENGTH(26)}];
    [_smallBtn alignVerticalCenterOf:_bgBtn];
}

- (NSString *)bgTitle {
    return _bgBtn.titleLabel.text;
}
@end
