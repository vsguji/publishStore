//
//  RTFormAreaCell.m
//  darongtong
//
//  Created by zy on 2018/1/4.
//  Copyright © 2018年 darongtong. All rights reserved.
//

#import "RTFormAreaSpaceCell.h"
#import "RTLabelAndIconModel.h"
#import "RTColor.h"
#import "UIView+Altar.h"
#import "RTBriefModel.h"
#import "RTAreaTipView.h"
#import <QuartzCore/QuartzCore.h>

#import "RTAreaConditionViewController.h"
#import "UtilsMacro.h"
#import "UIView+CustomAutoLayout.h"

@implementation RTFormAreaSpaceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _headerIcon.hidden = YES;
    _userTitle.hidden = YES;
    _userNick.hidden = YES;

}

- (void)setCellWithModel:(RTAreaCondition<RTFormViewProtocol> *)model {
    NSArray *items = [model groupItems];
    CGFloat originY = 0.;
    for (RTLabelAndIcon101Model<RTFormViewProtocol> *subItem in items) {
         NSArray *subItems = [subItem groupItems];
        if (subItems.count > 0) {
            RTFormAreaModel *areaModel = subItems[0];
            RTAreaTipView *areaTipView = [[RTAreaTipView alloc] init];
            areaTipView.dynamicDelegate = self;
            [self addSubview:areaTipView];
            [areaTipView configSuperViewsWidthInfo:model];
            [areaTipView configOwnViewsWidthInfo:(id<RTFormProtocol>)areaModel];
            [areaTipView setFrameAndLayout:CGRectMake(0, originY, kScreenW, 541.)];
            originY += 541.;
        }
        if (subItems.count > 1) {
            RTFormAreaCapitalModel *areaSecrectInfoModel = subItems[1];
            RTAreaTipSecretInfoView *areaSecretInfoView = [[RTAreaTipSecretInfoView alloc] init];
            [self addSubview:areaSecretInfoView];
            areaSecretInfoView.backgroundColor = [RTColor rtBg19TypeColor];
            [areaSecretInfoView configOwnViewsWidthInfo:(id<RTFormProtocol>)areaSecrectInfoModel];
            [areaSecretInfoView setFrameAndLayout:CGRectMake(0, originY, kScreenW, 719.)];
            originY += 719.;
        }
    }
}

- (void)popViewController {
    if ([self.delegate isKindOfClass:[UIViewController class]]) {
        UIViewController *vc = (UIViewController *)self.delegate;
        RTAreaConditionViewController *areaConditionVC = [[RTAreaConditionViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:areaConditionVC];
        [vc presentViewController:nav animated:YES completion:nil];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end

@implementation RTFormAreaConditionSecretCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _secretView = [[RTAreaTipSecretInfoView alloc] init];
    [self addSubview:_secretView];
    _addDoc = [[RTPartnerAddDocsView alloc] init];
    [self addSubview:_addDoc];
    self.backgroundColor = [RTColor rtBg12TypeColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _headerIcon.hidden = YES;
    _userTitle.hidden = YES;
    _userNick.hidden = YES;
    
    [_secretView setSize:(CGSize){kScreenW,719}];
    [_secretView alignParentTop];
    [_secretView alignParentLeft];
    [_secretView scaleToParentRight];
    [_secretView relayoutFrameOfSubViews];
    
    [_addDoc setSize:(CGSize){(47.),(47.)}];
   // [_addDoc layoutBelow:_secretView];
    [_addDoc alignParentLeftWithMargin:20.];
    [_addDoc scaleToParentRightWithMargin:20.];
    [_addDoc alignParentBottomWithMargin:15.];
    [_addDoc relayoutFrameOfSubViews];
}

- (void)setCellWithModel:(RTAreaCondition<RTFormViewProtocol> *)model {
    [_secretView configOwnViewsWidthInfo:model];
    if ([model isKindOfClass:[RTFormAreaCapitalModel class]]) {
        RTFormAreaCapitalModel *capitalModel = (RTFormAreaCapitalModel *)model;
        if (capitalModel.capacitiveFooter) {
            [_addDoc configOwnViewsWidthInfo:capitalModel.capacitiveFooter];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)addNewArea:(UIButton *)button {
    
}
@end

@implementation RTFormAreaCommonAddCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _addDoc = [[RTPartnerAddDocsView alloc] init];
    [self addSubview:_addDoc];
    self.backgroundColor = [RTColor rtBg22TypeColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _headerIcon.hidden = YES;
    _userTitle.hidden = YES;
    _userNick.hidden = YES;
    
    [_addDoc setSize:(CGSize){(47.),(47.)}];
    [_addDoc alignParentLeftWithMargin:20.];
    [_addDoc scaleToParentRightWithMargin:20.];
    [_addDoc layoutParentVerticalCenter];
    [_addDoc relayoutFrameOfSubViews];
}

- (void)setCellWithModel:(RTAreaCondition<RTFormViewProtocol> *)model {
    NSArray *items = [model groupItems];
    if (items && items.count > 0) {
        [_addDoc configOwnViewsWidthInfo:items[0]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)addNewArea:(UIButton *)button {
    
}
@end

@implementation RTFormAreaDeviceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _areaTipView = [[RTAreaTipView alloc] init];
    [self addSubview:_areaTipView];

    _addOtherArea = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRight
                                                 maggin:UIEdgeInsetsMake(0, 10., 0, 0)
                                                padding:CGSizeMake(10., 0)];
    _addOtherArea.layer.cornerRadius = 5.;
    _addOtherArea.layer.masksToBounds = YES;
    [_areaTipView addSubview:_addOtherArea];
    [_addOtherArea addTarget:self action:@selector(addNewArea:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _headerIcon.hidden = YES;
    _userTitle.hidden = YES;
    _userNick.hidden = YES;
    [_areaTipView scaleParent];
    [_areaTipView relayoutFrameOfSubViews];
    
    [_addOtherArea setSize:(CGSize){160,31}];
    [_addOtherArea layoutParentHorizontalCenter];
    [_addOtherArea alignParentBottomWithMargin:8.];
}

- (void)setCellWithModel:(RTAreaCondition<RTFormViewProtocol> *)model {
    [_areaTipView configSuperViewsWidthInfo:model];
    [_areaTipView configOwnViewsWidthInfo:model];
    [_addOtherArea setTitle:@"添加其它号场地" forState:UIControlStateNormal];
    [_addOtherArea setImage:[UIImage imageNamed:@"form_blue_add"] forState:UIControlStateNormal];
    [_addOtherArea setBackgroundColor:[RTColor rtBgBtnTypeColor]];
    _addOtherArea.titleLabel.font = FONT(LENGTH(12.));
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)addNewArea:(UIButton *)button {
    
}

@end

