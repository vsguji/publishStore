//
//  RTFormButtonView.m
//  darongtong
//
//  Created by zy on 2017/12/15.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTFormButtonView.h"
#import "UIView+Altar.h"
#import "RTLabelAndFieldModel.h"
#import "UtilsMacro.h"
#import "ColorMacro.h"
#import "UIView+CustomAutoLayout.h"
@implementation RTFormButtonView

- (void)addOwnViews {
    _bgBtn = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightCenter
                                              maggin:UIEdgeInsetsMake(0, 4., 0, 0)
                                             padding:CGSizeMake(6., 0.)];
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
    
    RTButtonItemModel *infoModel = (RTButtonItemModel *)info;
    
    _bgBtn.selected = [info buttonIsSelected];
    _smallBtn.selected = [info buttonIsSelected];
    if ([info rowHeight] > 30) {
        
    }
    if ([info respondsToSelector:@selector(rowString)]) {
        [_bgBtn setTitle:[info rowString] forState:UIControlStateNormal];
        [_bgBtn.titleLabel sizeToFit];
    }
    // 组织结构
    if ([infoModel.modelType isEqualToString:@"RTPartnerFieldAndButtonItem"]) {
        [_bgBtn setImage:[info buttonNormalIcon] forState:UIControlStateNormal];
        [_bgBtn setImage:[info buttonHightlIcon] forState:UIControlStateSelected];
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
