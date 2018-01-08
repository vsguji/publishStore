//
//  RTPartnerRelationView.m
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTPartnerTipView.h"
#import "UIView+Altar.h" // lipeng 2017.12.07
#import "RTLabelAndIconModel.h" // lipeng 2017.12.18
#import "RTColor.h" // lipeng 2017.12.22
#import <QuartzCore/QuartzCore.h>
#import "RTBriefModel.h"
#import "UIView+CustomAutoLayout.h"
#import "UtilsMacro.h"
#import "ColorMacro.h"
#import "UIColor+expanded.h"

@implementation  RTPartnerLeftView

- (void)addOwnViews {
    _bgImg = [[UIImageView alloc] init];
    _checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _upOrDown = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self addSubview:_bgImg];
    [self addSubview:_checkBtn];
    [self addSubview:_upOrDown];
    
}

- (void)configOwnViews {
    [_bgImg setImage:[UIImage imageNamed:@"form_leftView"]];
    [_checkBtn setImage:[UIImage imageNamed:@"form_check_normal"] forState:UIControlStateNormal];
    [_checkBtn setImage:[UIImage imageNamed:@"form_check_selected"] forState:UIControlStateSelected];
    [_upOrDown setImage:[UIImage imageNamed:@"form_down"] forState:UIControlStateNormal];
    [_upOrDown setImage:[UIImage imageNamed:@"form_up"] forState:UIControlStateSelected];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    // do something
}


- (void)relayoutFrameOfSubViews {
    // 背景
    [_bgImg scaleParent];
    // 单选
    [_checkBtn setSize:(CGSize){(22),(22)}];
    [_checkBtn alignParentLeftWithMargin:10];
    [_checkBtn layoutParentVerticalCenter];
    // 指示剂
    [_upOrDown setSize:(CGSize){(22),(22)}];
    [_upOrDown alignParentRightWithMargin:10];
    [_upOrDown layoutParentVerticalCenter];
}

@end

@implementation RTPartnerEditView

- (void)addOwnViews {
    _editAction = [[ImageTitleButton alloc] initWithStyle:ETitleLeftImageRightLeft maggin:UIEdgeInsetsMake(0, 8., 0, 2.)];
    [self addSubview:_editAction];
}

- (void)configOwnViews {
     self.backgroundColor = kClearColor;
}

- (void)configOwnViewsWidthInfo:(id<RTFormSubButtonsProtocol>)info {
   // NSParameterAssert([info buttonBgColor]);
    [_editAction setImage:[UIImage imageNamed:@"form_pen"] forState:UIControlStateNormal];
    [_editAction setTitle:@"编辑" forState:UIControlStateNormal];
    [_editAction.titleLabel setFont:FONT(LENGTH(12))];
    [_editAction setTitleColor:kWhiteColor forState:UIControlStateNormal];
    RTBaseModel *infoModel = (RTBaseModel *)info;
    if (infoModel && [infoModel.modelType containsString:@"RTFormSubCapacitivePart"]) {
         [_editAction setBackgroundColor:[RTColor rtBg4TypeColor]];
    }
    else{
         [_editAction setBackgroundColor:[RTColor rtBg10TypeColor]];
    }
}

- (void)setConfigureTypeBgColor:(UIColor *)color {
    [_editAction setImage:[UIImage imageNamed:@"form_pen"] forState:UIControlStateNormal];
    [_editAction setTitle:@"编辑" forState:UIControlStateNormal];
    [_editAction.titleLabel setFont:FONT(LENGTH(12))];
    [_editAction setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_editAction setBackgroundColor:color];
}

- (void)relayoutFrameOfSubViews {
    [_editAction scaleParent];
    _editAction.layer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
    _editAction.layer.masksToBounds = YES;
}

@end


@implementation RTPartnerAuthorSettingView

- (void)addOwnViews {
    
    _authOAction = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRight maggin:UIEdgeInsetsMake(0, 8., 0, 4.) padding:CGSizeMake(6.,0.)];
    [self addSubview:_authOAction];
}

- (void)configOwnViews {

}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormSubButtonsProtocol>)info {
   
    [_authOAction setImage:[UIImage imageNamed:@"form_gray_warning"] forState:UIControlStateNormal];
    if ([info respondsToSelector:@selector(labDetail)]) {
      [_authOAction setTitle:((RTLabelAndIcon3Model *)info).labDetail forState:UIControlStateNormal];
    }
    [_authOAction.titleLabel setFont:FONT(LENGTH(12))];
    [_authOAction setTitleColor:[RTColor rtBg11TypeColor] forState:UIControlStateNormal];
    
    RTBaseModel *infoModel = (RTBaseModel *)info;
    NSString *infoModelType = infoModel.modelType;
    if (infoModelType && [infoModelType containsString:@"RTFormSubCapacitivePartField"]) {
         [_authOAction setTitleColor:[RTColor rtBg11TypeColor] forState:UIControlStateNormal];
         [_authOAction setBackgroundColor:[RTColor rtBg4TypeColor]];
    }
    else if (infoModel && [infoModel.modelType isEqualToString:@"RTFormInvisibleCapacitiveItemTwo"]){
        [_authOAction setTitleColor:[RTColor rtBg11TypeColor] forState:UIControlStateNormal];
        [_authOAction setBackgroundColor:kClearColor];
        [_authOAction setImage:[UIImage imageNamed:@"form_partner_warn"] forState:UIControlStateNormal];
        _authOAction.margin = UIEdgeInsetsMake(0., 0., 0., 4.);
        [_authOAction relayoutFrameOfSubViews];
    }
    else{
        [_authOAction setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [_authOAction setBackgroundColor:[RTColor rtBg10TypeColor]];
    }
}

- (void)relayoutFrameOfSubViews {
    [_authOAction marginParentWithEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    _authOAction.layer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
    _authOAction.layer.masksToBounds = YES;
}

@end


@implementation RTPartnerAddDocsView

- (void)addOwnViews {
    
    _addAction = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightCenter maggin:UIEdgeInsetsZero padding:CGSizeMake(15., 0.)];
    [self addSubview:_addAction];
}

- (void)configOwnViews {
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormSubButtonsProtocol,RTFormRowProtocol>)info {
    [_addAction setImage:[UIImage imageNamed:@"form_add_doc"] forState:UIControlStateNormal];
    [_addAction setAttributedTitle:[info rowTitle] forState:UIControlStateNormal];
    _baseModel = (RTBaseModel *)info;
}

- (void)relayoutFrameOfSubViews {
    [_addAction scaleParent];
    if ([_baseModel.modelType isEqualToString:@"RTFormInvisbleCapacitiveFooter"]) {
        [self drawButtonLayerByColor:kBlackColor];
    }
    else{
        [self drawButtonLayerByColor:[RTColor rtBg10TypeColor]];
    }
}

// private

- (void )drawButtonLayerByColor:(UIColor *)color {
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = color.CGColor;
    border.fillColor = [UIColor clearColor].CGColor;
    border.path = [UIBezierPath bezierPathWithRect:_addAction.bounds].CGPath;
    border.frame = _addAction.bounds;
    border.lineWidth = 1.f;
    border.lineDashPattern = @[@4, @2];
    [_addAction.layer addSublayer:border];
}

@end

@implementation RTPartnerRelationView

- (void)addOwnViews {
    // 背景
   // _bgImg = [[UIImageView alloc] init];
    // 选择状态
    _leftView = [[RTPartnerLeftView alloc] init];
    // 关系
    _labRelation = [[UILabel alloc] init];
    // 编辑
    _editAction = [[ImageTitleButton alloc] initWithStyle:ETitleLeftImageRightLeft];
    // 扩展
    _accessIcon = [[UIImageView alloc] init];
    
   // [self addSubview:_bgImg];
    [self addSubview:_leftView];
    [self addSubview:_labRelation];
    [self addSubview:_editAction];
    [self addSubview:_accessIcon];
}

- (void)configOwnViews {
    
    self.backgroundColor = [UIColor colorWithHexString:@"0x823424"];
    
    _labRelation.textColor = kWhiteColor;
    _labRelation.font = FONT(LENGTH(15));
    
    [_editAction setBackgroundImage:[UIImage imageNamed:@"form_edit_bg"] forState:UIControlStateNormal];
    [_editAction setImage:[UIImage imageNamed:@"form_pen"] forState:UIControlStateNormal];
    [_editAction setTitle:@"编辑" forState:UIControlStateNormal];
    [_editAction.titleLabel setFont:FONT(LENGTH(12))];
    [_editAction setTitleColor:kWhiteColor forState:UIControlStateNormal];
    
    [_accessIcon setImage:[UIImage imageNamed:@"form_yellow_access"]];
}


- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormRowProtocol>)info {
    if ([info respondsToSelector:@selector(rowString)]) {
          _labRelation.text = [info rowString];
    }
    [_leftView configOwnViewsWidthInfo:info];
}

- (void)relayoutFrameOfSubViews {
    // 背景
    //  [_bgImg scaleParent];
    // 选择状态
    [_leftView setSize:(CGSize){(120), (45)}];
    [_leftView alignParentLeft];
    [_leftView layoutParentVerticalCenter];
    [_leftView relayoutFrameOfSubViews];
    
    // 容通关系
    [_labRelation setSize:(CGSize){(15),(15)}];
    [_labRelation layoutToRightOf:_leftView margin:(10)];
    [_labRelation layoutParentVerticalCenter];
    // 扩展
    [_accessIcon setSize:(CGSize){(10),(22)}];
    [_accessIcon alignParentRightWithMargin:10];
    [_accessIcon layoutParentVerticalCenter];
    // 编辑
    [_editAction setSize:(CGSize){(46),(44)}];
    [_editAction layoutToLeftOf:_accessIcon margin:(10)];
    [_editAction layoutParentVerticalCenter];
    [_labRelation scaleToRightOf:_editAction margin:(10)];
}

@end

@implementation RTPartnerSecretInfoView

- (void)addOwnViews {
    _bgImg = [[UIImageView alloc] init];
    _topTitle = [[UILabel alloc] init];
    _btmTitle = [[UILabel alloc] init];
    _leftIcon = [[UIImageView alloc] init];
    _rightIcon =[[UIImageView alloc] init];
    
    [self addSubview:_bgImg];
    [_bgImg addSubview:_topTitle];
    [_bgImg addSubview:_btmTitle];
    [_bgImg addSubview:_leftIcon];
    [_bgImg addSubview:_rightIcon];
}

- (void)configOwnViews {
//    [_bgImg setImage:[UIImage imageNamed:@"form_secret"]];
    [_leftIcon setImage:[UIImage imageNamed:@"form_secret_access"]];
    [_rightIcon setImage:[UIImage imageNamed:@"form_secret_access"]];
  
    _topTitle.font = FONT(LENGTH(15));
    _topTitle.textColor = [RTColor rtBg18TypeColor];
    _topTitle.textAlignment = NSTextAlignmentCenter;
    
    _btmTitle.font = FONT(LENGTH(14));
    _btmTitle.textAlignment = NSTextAlignmentCenter;
    _btmTitle.textColor = [RTColor rtBg19TypeColor];
    _btmTitle.numberOfLines = 0;
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info{
  //  TCAVIMLog(@"info labTitle : %@",((RTLabelAndIcon3Model *)info).labTitle);
    _topTitle.text = ((RTLabelAndIcon3Model *)info).labTitle;
    _btmTitle.text =  ((RTLabelAndIcon3Model *)info).labStr;
    
    RTBaseModel *infoModel = (RTBaseModel *)info;
    NSString *infoModelType = infoModel.modelType;
    if (infoModel &&
        ([infoModelType isEqualToString:@"RTFormSubCapacitivePartOneField1"]
         || [infoModelType isEqualToString:@"RTFormSubCapitalField1"])) {
        _btmTitle.textColor = [RTColor rtBg4TypeColor];
        [_bgImg setImage:[UIImage imageNamed:@"form_black_bg"]];
    }
    else{
        [_bgImg setImage:[UIImage imageNamed:@"form_secret"]];
        _btmTitle.textColor = kBlackColor;
    }
    CGFloat width = (147) - (17) * 2 - 2 * 2 ;
    CGSize deSize = [_btmTitle.text boundingRectWithSize:CGSizeMake(width, HUGE_VAL)
                                                   options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                attributes:@{NSFontAttributeName:FONT(LENGTH(14))}
                                                   context:nil].size;
     [_btmTitle setSize:CGSizeMake(deSize.width, deSize.height)];
     [_btmTitle layoutParentHorizontalCenter];
    _fileInfo = info;
}

- (void)relayoutFrameOfSubViews {
    
    NSString *fieldInfoType = ((RTBaseModel *)_fileInfo).modelType;
    if ([fieldInfoType isEqualToString:@"RTFormSubCapacitivePartOneField1"]) {
        [_bgImg setSize:(CGSize){(166),(114)}];
        
        [_topTitle setSize:(CGSize){(60),(15)}];
        [_topTitle alignParentTopWithMargin:10.];
        [_topTitle layoutParentHorizontalCenter];
        
        [_btmTitle layoutBelow:_topTitle margin:(10)];
        [_btmTitle layoutParentHorizontalCenter];
    }
    else if ([fieldInfoType isEqualToString:@"RTFormSubCapitalField1"]) {
        
        [_bgImg setSize:(CGSize){(166),(114)}];
        
        [_topTitle setSize:(CGSize){(100),(15)}];
        [_topTitle alignParentTopWithMargin:25.];
        [_topTitle layoutParentHorizontalCenter];
        
        [_btmTitle layoutBelow:_topTitle margin:(10)];
        [_btmTitle layoutParentHorizontalCenter];
    }
    else{
        
        [_bgImg setSize:(CGSize){(147),(92)}];
        
        [_topTitle setSize:(CGSize){(60),(15)}];
        [_topTitle alignParentTopWithMargin:10.];
        [_topTitle layoutParentHorizontalCenter];
        
        [_btmTitle layoutBelow:_topTitle margin:(10)];
        [_btmTitle layoutParentHorizontalCenter];
    }
    [_bgImg alignParentCenter];

    [_leftIcon setSize:(CGSize){(18),(13)}];
    [_leftIcon alignParentLeftWithMargin:2.];
    [_leftIcon layoutParentVerticalCenter];
    
    [_rightIcon setSize:(CGSize){(18),(13)}];
    [_rightIcon alignParentRightWithMargin:2.];
    [_rightIcon layoutParentVerticalCenter];
}

@end

@implementation RTFormSecretView

- (void)addOwnViews {
    _secretInfo = [[RTPartnerSecretInfoView alloc] init];
    [self addSubview:_secretInfo];
    _secretCard = [[UILabel alloc] init];
    [self addSubview:_secretCard];
}

- (void)configOwnViews {
    [_secretCard setFont:FONT(LENGTH(14))];
    _secretCard.textColor = kWhiteColor;
    _secretCard.textAlignment = NSTextAlignmentCenter;
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    NSString *baseModelType = ((RTBaseModel *)info).modelType;
    if ([baseModelType isEqualToString:@"RTFormSubCapacitivePartOneField1"]
        || [baseModelType isEqualToString:@"RTFormSubCapitalField1"]
        || [baseModelType isEqualToString:@"RTFormSubAreaCapitalHeader"]) {
         self.backgroundColor = kClearColor;
    }
    else{
         self.backgroundColor = [UIColor colorWithHexString:@"0x000f21"];
    }
    _secretCard.text = ((RTLabelAndIcon3Model *)info).labDetail;//@"选择运营合伙人名片";
    [_secretInfo configOwnViewsWidthInfo:info];
    _fieldInfo = info;
}

- (void)relayoutFrameOfSubViews {
    
    [_secretInfo setFrameAndLayout:CGRectMake(0, 0, (147), (92))];
    [_secretInfo setSize:(CGSize){(147),(92)}];
    [_secretCard setSize:(CGSize){(150),(14)}];
    RTBaseModel *infoModel = (RTBaseModel *)_fieldInfo;
    NSString *baseModelType = ((RTBaseModel *)infoModel).modelType;
    if (infoModel &&
        ([baseModelType isEqualToString:@"RTFormSubCapacitivePartOneField1"]
         || [baseModelType isEqualToString:@"RTFormSubCapitalField1"])) {
         [_secretCard alignParentTopWithMargin:(25.)];
         [_secretInfo layoutBelow:_secretCard margin:(25.)];
    }
    else {
          [_secretInfo alignParentTopWithMargin:(25.)];
          [_secretCard alignParentBottomWithMargin:(10.)];
          [_secretCard layoutBelow:_secretInfo margin:(18.)];
    }

    [_secretInfo layoutParentHorizontalCenter];
    [_secretCard layoutParentHorizontalCenter];
}

@end


@implementation RTPartnerInfoView

- (void)addOwnViews {
    // 背景
    _infoBgView = [[UIView alloc] init];

    // 投运营合伙人
    _icon = [[UIImageView alloc] init];
    _icon.contentMode = UIViewContentModeScaleAspectFill;
    
    // 投资风向
    _rgTitle = [[ImageTitleButton alloc] initWithStyle: EImageLeftTitleRight];
    
    // 发展地区
    _rgArea = [[UILabel alloc] init];
    
    // 交易模式
    _rgTrading = [[UILabel alloc] init];
    
    // 交易限时
    _rgTradeTime = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRight];
    
    //  简介
    _partnerDes = [[UITextView alloc] init];
    
    // 详细简介
    _partnerDes2 = [[UITextView alloc] init];
    
    // 权限设置
    _visibleSetting = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRight];
    
     [self addSubview:_infoBgView];
     [_infoBgView addSubview:_icon];
     [_infoBgView addSubview:_rgTitle];
     [_infoBgView addSubview:_rgArea];
     [_infoBgView addSubview:_rgTrading];
     [_infoBgView addSubview:_rgTradeTime];
     [_infoBgView addSubview:_partnerDes];
     [_infoBgView addSubview:_partnerDes2];
     [self addSubview:_visibleSetting];
}

- (void)configOwnViews {
    
    self.backgroundColor = [UIColor colorWithHexString:@"0x4e2523"];
    // 背景
    _infoBgView.backgroundColor = kWhiteColor;
    // 运营合伙人
    [_icon setImage:[UIImage imageNamed:@"form_partner_member"]];
    // 投资风向
    [_rgTitle setImage:[UIImage imageNamed:@"form_logo"] forState:UIControlStateNormal];
    [_rgTitle setTitleColor:[UIColor colorWithHexString:@"0x8a6800"] forState:UIControlStateNormal];
    [_rgTitle.titleLabel setFont:FONT(LENGTH(12))];
    
    // 附件圈子
    [_rgArea setTextColor:[UIColor colorWithHexString:@"0x999999"]];
    [_rgArea setFont:FONT(LENGTH(11))];
    _rgArea.numberOfLines = 0;
    _rgArea.lineBreakMode = kCTLineBreakByTruncatingTail;
    
    // 交易模式
    [_rgTrading setTextColor:[UIColor colorWithHexString:@"0x999999"]];
    _rgTrading.numberOfLines = 0;
    _rgTrading.lineBreakMode = kCTLineBreakByTruncatingTail;
    [_rgTrading setFont:FONT(LENGTH(11))];
    
    // 限时
    [_rgTradeTime setImage:[UIImage imageNamed:@"form_limit_time"] forState:UIControlStateNormal];
    [_rgTradeTime setTitleColor:[UIColor colorWithHexString:@"0x999999"] forState:UIControlStateNormal];
    [_rgTradeTime.titleLabel setFont:FONT(LENGTH(11))];
    _rgTradeTime.titleLabel.numberOfLines = 0;
    _rgTradeTime.titleLabel.lineBreakMode = kCTLineBreakByTruncatingTail;
    
    // 简介
    _partnerDes.showsHorizontalScrollIndicator = NO;
    _partnerDes.showsVerticalScrollIndicator  = NO;
    _partnerDes.editable = NO;
    _partnerDes.font = FONT(LENGTH(13));
    _partnerDes.backgroundColor = kClearColor;
    // 个人说明
    _partnerDes2.editable = NO;
    _partnerDes2.showsHorizontalScrollIndicator = NO;
    _partnerDes2.showsVerticalScrollIndicator  = NO;
    _partnerDes2.font = FONT(LENGTH(13));
    _partnerDes2.backgroundColor = kClearColor;
    
    // 设置权限
    [_visibleSetting setImage:[UIImage imageNamed:@"form_partner_warn"] forState:UIControlStateNormal];
    [_visibleSetting setTitle:@"设置权限可见范围" forState:UIControlStateNormal];
    [_visibleSetting setTitleColor:[UIColor colorWithHexString:@"0xb8b8b8"] forState:UIControlStateNormal];
    [_visibleSetting.titleLabel setFont:FONT(LENGTH(12))];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    
    [_rgTitle setTitle:@"投资风向" forState:UIControlStateNormal];
    
    _rgArea.text = @"·运营合伙人作为资本的业务开展地区:内蒙古自治区呼和浩特市和林格尔县盛乐镇·附件圈子";
    [_rgArea sizeToFit];
    
    _rgTrading.text  = @"·交易模式:创业组合股权";
    [_rgTrading sizeToFit];
    
    [_rgTradeTime setTitle:@"限时自2017.5.1~2017.9.1至" forState:UIControlStateNormal];
    [_rgTradeTime.titleLabel sizeToFit];
    // 简介
    _partnerDes.text = @"运营合伙人·张三·智慧人·行家·信息技术互联网+·八坛科技股份公司·企业法定代表人|CEO·已供职:365天·任职部门:董事会股东会";
    
    CGSize deSize = [_partnerDes.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(_infoBgView.bounds), HUGE_VAL)
                                                   options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                attributes:@{NSFontAttributeName:FONT(LENGTH(13))}
                                                   context:nil].size;
    [_partnerDes setSize:CGSizeMake(deSize.width, deSize.height + 10)];
    // 个人说明
    NSString *des2Str = @"我多年来从事咖啡种植,懂得咖啡营养新品种的嫁接,培育,懂得土壤的金属元素,钙元素,有机肥的合理搭配,懂得咖啡园林下养殖栽培技术的管理运营";
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:des2Str];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.firstLineHeadIndent = 30; //缩进
    style.lineSpacing = 1;
    style.alignment = NSTextAlignmentLeft;
    [text addAttributes:@{
                          NSFontAttributeName:FONT(LENGTH(13)),
                          NSParagraphStyleAttributeName:style,
                          NSBackgroundColorAttributeName:kClearColor
                        }
                  range:NSMakeRange(0, text.length - 1)];
    _partnerDes2.attributedText = text;
    
    CGSize de2Size = [_partnerDes2.text boundingRectWithSize:CGSizeMake(CGRectGetWidth(_infoBgView.bounds), HUGE_VAL)
                                                     options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                  attributes:@{NSFontAttributeName:FONT(LENGTH(13))} context:nil].size;
    
    [_partnerDes2 setSize:de2Size];
    [_partnerDes2 layoutBelow:_partnerDes margin:LENGTH(10)];
}

- (void)relayoutFrameOfSubViews {
    
    // 背景
    [_infoBgView marginParentWithEdgeInsets:UIEdgeInsetsMake(15, 10, 45, 10)];
    // 投运营合伙人
    [_icon setSize:(CGSize){(155),(128)}];
    [_icon alignParentLeftWithMargin:12];
    [_icon alignParentTopWithMargin:10];

    // 投资风向
    [_rgTitle setSize:(CGSize){(12),(12)}];
    [_rgTitle alignTop:_icon margin:(-4)];
    [_rgTitle layoutToRightOf:_icon margin:(13)];
    [_rgTitle scaleToParentRightWithMargin:10];

    // 发展地区
    [_rgArea setSize:(CGSize){(100),(48)}];
    [_rgArea layoutBelow:_rgTitle margin:(10)];
    [_rgArea alignLeft:_rgTitle margin:(3)];
    [_rgArea scaleToParentRightWithMargin:10];

    // 交易模式
    [_rgTrading setSize:(CGSize){(100),(11)}];
    [_rgTrading alignLeft:_rgTitle margin:(3)];
    [_rgTrading layoutBelow:_rgArea margin:(10)];
    [_rgTrading scaleToParentRightWithMargin:10];

    // 交易限时
    [_rgTradeTime setSize:(CGSize){(150),(11)}];
    [_rgTradeTime layoutBelow:_rgTrading margin:(2)];
    [_rgTradeTime alignLeft:_rgTitle margin:(3)];
    [_rgTradeTime scaleToParentRightWithMargin:10];

    // 简介
    [_partnerDes layoutBelow:_icon margin:(17)];
    [_partnerDes scaleToParentLeftWithMargin:10];
    [_partnerDes scaleToParentRightWithMargin:10];

    // 个人说明
    [_partnerDes2 scaleToParentLeftWithMargin:10];
    [_partnerDes2 scaleToParentRightWithMargin:10];
    [_partnerDes2 scaleToParentBottomWithMargin:10];

    // 权限设置
    [_visibleSetting layoutBelow:_infoBgView margin:(10)];
    [_visibleSetting setSize:(CGSize){(12),(12)}];
    [_visibleSetting alignParentLeftWithMargin:10];
    [_visibleSetting scaleToParentRightWithMargin:10];
}

@end


@implementation RTFormSecretAttachmentUploadFile

- (void)addOwnViews{
    _bgImg = [[UIImageView alloc] init];
    [self addSubview:_bgImg];
    
    _uploadIcon = [[UIImageView alloc] init];
    [_bgImg addSubview:_uploadIcon];
    
    _uploadSmallIcon = [[UIImageView alloc] init];
    [_uploadIcon addSubview:_uploadSmallIcon];
    
    _titleView = [[UITextView alloc] init];
    _titleView.editable = NO;
    _titleView.showsVerticalScrollIndicator = NO;
    _titleView.showsHorizontalScrollIndicator = NO;
    _titleView.backgroundColor = kClearColor;
    [_bgImg addSubview:_titleView];
    
    _subTitleView = [[UITextView alloc] init];
    _subTitleView.editable = NO;
    _subTitleView.showsVerticalScrollIndicator = NO;
    _subTitleView.showsHorizontalScrollIndicator = NO;
    _subTitleView.backgroundColor = kClearColor;
    [_bgImg addSubview:_subTitleView];
    _subTitleView.hidden = YES;
    
    _editView = [[RTPartnerEditView alloc] init];
    [_bgImg addSubview:_editView];
    
    // 标题
    _uploadTitle = [[UILabel alloc] init];
    _uploadTitle.hidden = YES;
    [_bgImg addSubview:_uploadTitle];

    // 发布时间
    _uploadTime = [[UILabel alloc] init];
    _uploadTime.font = FONT(LENGTH(12.));
    _uploadTime.hidden = YES;
    [_bgImg addSubview:_uploadTime];
    
    // 发布作者
    _uploadAuthor = [[UILabel alloc] init];
    _uploadAuthor.font = FONT(LENGTH(12.));
    _uploadAuthor.hidden = YES;
    [_bgImg addSubview:_uploadAuthor];
    
}

- (void)configOwnViews {
    
    _bgImg.layer.borderWidth = 4.;
    _bgImg.layer.borderColor = [RTColor rtBg10TypeColor].CGColor;
    _bgImg.layer.masksToBounds = YES;
    _bgImg.backgroundColor = kClearColor;
    
    _uploadTime.textColor = [RTColor rtBg11TypeColor];
    _uploadAuthor.textColor = [RTColor rtBg11TypeColor];
    _uploadIcon.backgroundColor = kWhiteColor;
    
    _subTitleView.textColor = kRedColor;
    _subTitleView.font = FONT(LENGTH(14.));
    
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormRowProtocol>)info {
    
    RTBaseModel *infoBase = (RTBaseModel *)info;
    if ([infoBase.modelId isEqualToString:@"1000"]) {
         _uploadIcon.image = [UIImage imageNamed:@"form_docx"];
    }
    else if ([infoBase.modelId isEqualToString:@"1001"]) {
         // 文档
        _uploadIcon.image = [UIImage imageNamed:@"form_xlsx"];
    }
    else if ([infoBase.modelId isEqualToString:@"1002"]){
        // 做账凭证
        _uploadIcon.image = [UIImage imageNamed:@"form_record_list"];
    }
    else {
         _uploadSmallIcon.image = [UIImage imageNamed:@"form_add"];
    }
    
    if ([info respondsToSelector:@selector(rowTitle)]) {
        if ([infoBase.modelType isEqualToString:@"RTFormSubCapacitivePart3Field"]
            || [infoBase.modelType isEqualToString:@"RTFormSubCapacitivePart2Field"]) {
            _uploadTitle.attributedText = [info rowTitle];
            if ([info respondsToSelector:@selector(fieldBgLayer)]) {
                [_uploadTitle.layer insertSublayer:[info fieldBgLayer] atIndex:0];
            }
            if ([info respondsToSelector:@selector(labDetail)]) {
               _subTitleView.text = ((RTLabelAndIcon4Model *)info).labDetail;
            }
        }
        else{
            _titleView.attributedText = [info rowTitle];
        }
    }
    
    RTLabelAndIconModel *model = (RTLabelAndIconModel *)info;
    if ([model respondsToSelector:@selector(labStr)]) {
        NSString *labStr = model.labStr;
        NSArray *labArray = [labStr componentsSeparatedByString:@";"];
        if (labArray && labArray.count > 1) {
            _uploadTime.text = labArray[0];
            _uploadAuthor.text = labArray[1];
        }
    }
    
    [_editView configOwnViewsWidthInfo:info];
    _baseModel = (RTLabelAndIconModel *)info;
}

- (void)relayoutFrameOfSubViews {
    CGFloat height = 102.;
    [_bgImg setSize:(CGSize){(height),(height)}];
    [_bgImg alignParentLeftWithMargin:2.];
    [_bgImg scaleToParentRightWithMargin:2.];
    
    [_uploadIcon setSize:(CGSize){(82),(82)}];
    [_uploadIcon alignParentLeftWithMargin:10.];
    [_uploadIcon alignParentTopWithMargin:10.];
    [_uploadIcon scaleToParentBottomWithMargin:10.];
    
    [_uploadSmallIcon setSize:(CGSize){(24),(24)}];
    [_uploadSmallIcon alignParentCenter];
    
    // 1.
    [_titleView setSize:(CGSize){(15.),(15.)}];
    [_titleView layoutToRightOf:_uploadIcon margin:(10.)];
    [_titleView alignTop:_uploadIcon];
    [_titleView scaleToParentRightWithMargin:10.];
    // 2.
    [_uploadTitle setSize:(CGSize){(15.),(15.)}];
    [_uploadTitle layoutToRightOf:_uploadIcon margin:(10.)];
    [_uploadTitle alignTop:_uploadIcon];
    [_uploadTitle scaleToParentRightWithMargin:10.];
    
    [_uploadTime setSize:(CGSize){(12.),(12.)}];
    [_uploadTime alignLeft:_titleView];
    [_uploadTime layoutBelow:_titleView margin:10.];
    [_uploadTime scaleToParentRightWithMargin:10.];
    
    [_uploadAuthor setSize:(CGSize){(12.),(12.)}];
    [_uploadAuthor alignLeft:_titleView];
    [_uploadAuthor layoutBelow:_uploadTime margin:4.];
    [_uploadAuthor scaleToParentRightWithMargin:10.];
    
    if ([_baseModel respondsToSelector:@selector(labStr)] && _baseModel.labStr) {
        _uploadTime.hidden = NO;
        _uploadAuthor.hidden = NO;
        _titleView.hidden = NO;
    }
    if ([_baseModel.modelType isEqualToString:@"RTFormSubCapacitivePart2Field"]){
        _subTitleView.hidden = YES;
        _titleView.hidden = YES;
        _uploadTime.hidden = NO;
        _uploadAuthor.hidden = NO;
        _uploadTitle.hidden = NO;
    }
    else if ([_baseModel.modelType isEqualToString:@"RTFormSubCapacitivePart3Field"]){
        _uploadTime.hidden = YES;
        _uploadAuthor.hidden = YES;
        _subTitleView.hidden = NO;
        _uploadTitle.hidden = NO;
        _titleView.hidden = YES;
        [_subTitleView layoutBelow:_titleView margin:(2.)];
        [_subTitleView layoutToRightOf:_uploadIcon margin:(10.)];
        [_subTitleView scaleToRightOf:_titleView];
        [_subTitleView scaleToParentBottomWithMargin:4.];
    }
    else {
        _uploadTime.hidden = YES;
        _uploadAuthor.hidden = YES;
        _titleView.hidden = NO;
        [_titleView scaleToParentBottomWithMargin:4.];
    }
    [_editView setSize:(CGSize){(60.),(30.)}];
    [_editView alignParentRightWithMargin:10.];
    [_editView alignParentBottomWithMargin:10.];
    [_editView relayoutFrameOfSubViews];
}

@end

@implementation RTFormSecretAttachment2UploadFile

- (void)addOwnViews {
    [super addOwnViews];
    
    _labTop = [[UILabel alloc] init];
    [_bgImg addSubview:_labTop];

     // 可见权限
    _visibleSetting = [[RTPartnerAuthorSettingView alloc] init];
    [_bgImg addSubview:_visibleSetting];
    // 营业执照,行政许可证
    _uploadIconAdd = [[ImageTitleButton alloc] initWithStyle:EImageTopTitleBottom
                                                      maggin:UIEdgeInsetsMake(0, 2, 2, 2)
                                                     padding:CGSizeMake(0., 8.)];
    
    [_uploadIcon addSubview:_uploadIconAdd];
}

- (void)configOwnViews {
    [super configOwnViews];
    _uploadIcon.image = nil;
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormRowProtocol>)info  {
    [super configOwnViewsWidthInfo:info];
    if ([info respondsToSelector:@selector(rowTitle)]) {
       _labTop.attributedText = [info rowTitle];
    }
    if ([info respondsToSelector:@selector(labTitle2)]) {
        RTLabelAndIcon5Model *model = (RTLabelAndIcon5Model *)info;
        _titleView.attributedText = [[NSAttributedString alloc] initWithString:model.labTitle2
                                                                    attributes:@{
                                                                                 NSFontAttributeName:FONT(LENGTH(12.)),
                                                                                 NSForegroundColorAttributeName:[RTColor rtBg11TypeColor]
                                                                                 }];
    }
    _uploadIcon.image = nil;
    _uploadIcon.backgroundColor = [RTColor rtBg20TypeColor];
    [_visibleSetting configOwnViewsWidthInfo:info];
    [_editView setConfigureTypeBgColor:kBlackColor];
    
    [_uploadIconAdd setTitle:@"营业执照行政许可证" forState:UIControlStateNormal];
    [_uploadIconAdd setImage:[UIImage imageNamed:@"form_add"] forState:UIControlStateNormal];
    _uploadIconAdd.titleLabel.font = FONT(LENGTH(8.));
    [_uploadIconAdd setTitleColor:kGrayColor forState:UIControlStateNormal];
    _uploadSmallIcon.image = [UIImage imageNamed:@"form_xing"];
}

- (void)relayoutFrameOfSubViews {
    [super relayoutFrameOfSubViews];
    
    [_labTop alignParentTopWithMargin:4.0];
    
    [_bgImg scaleToParentBottomWithMargin:2.];
    
    [_labTop setSize:(CGSize){(14.),(14.)}];
    [_labTop alignParentTopWithMargin:8.];
    [_labTop alignParentLeftWithMargin:10.];
    [_labTop scaleToParentRightWithMargin:10.];
    
    [_uploadIcon layoutBelow:_labTop margin:4.];
    
    [_visibleSetting setSize:(CGSize){(180.),(30.)}];
    [_visibleSetting layoutToRightOf:_uploadIcon margin:(10.)];
    [_visibleSetting alignParentBottomWithMargin:8.];
    [_visibleSetting relayoutFrameOfSubViews];
    
    [_titleView alignTop:_uploadIcon];
    [_titleView scaleToAboveOf:_visibleSetting];
    
    [_uploadSmallIcon alignParentTopWithMargin:2.];
    [_uploadSmallIcon layoutParentHorizontalCenter];
    [_uploadIconAdd layoutBelow:_uploadSmallIcon margin:(1.)];
    [_uploadIconAdd alignParentLeft];
    [_uploadIconAdd scaleToParentRight];
    [_uploadIconAdd scaleToParentBottom];
}

@end

@implementation RTFormSecretAttachmentUploadFile2

- (void)addOwnViews{
    [super addOwnViews];
    _deleteView = [[RTPartnerEditView alloc] init];
    [self addSubview:_deleteView];
}

- (void)configOwnViews {
    [super configOwnViews];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    
}

- (void)relayoutFrameOfSubViews {
    
}

@end

@implementation RTFormSecretAttachment

- (void)addOwnViews{
    [super addOwnViews];
    
    _fieldView = [[RTFormFieldView alloc] init];
    [self addSubview:_fieldView];
    
    _uploadFile = [[RTFormSecretAttachmentUploadFile alloc] init];
    [self addSubview:_uploadFile];
    
    _authorView = [[RTPartnerAuthorSettingView alloc] init];
    [self addSubview:_authorView];
}

- (void)configOwnViews {
    [super configOwnViews];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    
    if ([info isKindOfClass:[NSArray class]]) {
        NSArray *fields = (NSArray *)info;
        if (fields && fields.count > 0 ) {
            [_fieldView configOwnViewsWidthInfo:fields[0]];
            [_uploadFile configOwnViewsWidthInfo:fields[1]];
            [_authorView configOwnViewsWidthInfo:fields[1]];
        }
    }
    else if ([info isKindOfClass:[RTLabelAndField3Model class]]){
        _uploadFile.hidden = YES;
        RTLabelAndField3Model *fieldModel = (RTLabelAndField3Model *)info;
        [_fieldView configOwnViewsWidthInfo:info];
        CGFloat originY = LENGTH(89.);
        CGFloat width = kScreenW - 14. * 2;
        for (RTLabelAndIcon4Model *model in fieldModel.items) {
            RTFormSecretAttachmentUploadFile *attachFile = [[RTFormSecretAttachmentUploadFile alloc] init];
            [self addSubview:attachFile];
            [attachFile configOwnViewsWidthInfo:model];
            [attachFile setFrameAndLayout:CGRectMake(4., originY, width,105.)];
            originY += 105.;
        }
    }
    _baseModel = (RTBaseModel *)info;
}

- (void)relayoutFrameOfSubViews {

    [_fieldView setSize:(CGSize){(89.),(89.)}];
    [_fieldView alignParentLeftWithMargin:0.];
    [_fieldView scaleToParentRightWithMargin:0.];
    [_fieldView relayoutFrameOfSubViews];
    
    [_uploadFile setSize:(CGSize){(105.),(105.)}];
    [_uploadFile layoutBelow:_fieldView margin:0.];
    [_uploadFile scaleToParentLeftWithMargin:0.];
    [_uploadFile scaleToParentRightWithMargin:0.];
    [_uploadFile relayoutFrameOfSubViews];
    
    if ([_baseModel isKindOfClass:[RTLabelAndField3Model class]] == NO) {
        [_authorView setSize:(CGSize){(180.),(30.)}];
        [_authorView layoutBelow:_uploadFile margin:(10.)];
        [_authorView relayoutFrameOfSubViews];
    }
}

@end

@implementation RTFormSecretAttachmentStyle2

- (void)addOwnViews {
    _bgBlackView = [[UIView alloc] init];
    [self addSubview:_bgBlackView];
    _left = [[UILabel alloc] init];
    _right = [[UILabel alloc] init];
    _numBtn = [[UIButton alloc] init];
    [_bgBlackView addSubview:_left];
    [_bgBlackView addSubview:_right];
    [_bgBlackView addSubview:_numBtn];
    
    _bgView = [[UIView alloc] init];
    [self addSubview:_bgView];
    
    _fieldView = [[RTFormTextView alloc] init];
    [_bgView addSubview:_fieldView];
    
    _uploadFile = [[RTFormSecretAttachment2UploadFile alloc] init];
    [_bgView addSubview:_uploadFile];

}

- (void)configOwnViews {
    
    _left.font = FONT(LENGTH(15.));
    _left.textAlignment = NSTextAlignmentRight;
    _left.textColor = [RTColor rtBg18TypeColor];
    
    _right.font = FONT(LENGTH(12.));
    _right.textColor = kWhiteColor;
    _right.textAlignment = NSTextAlignmentLeft;
    
    _bgBlackView.backgroundColor = kBlackColor;
    _bgBlackView.layer.cornerRadius = 15.;
    _bgBlackView.layer.masksToBounds = YES;
    _bgView.backgroundColor = [RTColor rtBg12TypeColor];
    _bgView.layer.cornerRadius = 15.;
    _bgView.layer.masksToBounds = YES;
    _numBtn.layer.cornerRadius = 10.;
    _numBtn.layer.masksToBounds = YES;
    
    _fieldView.backgroundColor = kClearColor;
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormViewProtocol>)info {
    _left.text = @"表2-3-1-密档";
    _right.text = @"号";
    [_numBtn setTitle:@"1" forState:UIControlStateNormal];
    [_numBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
    _numBtn.backgroundColor = [RTColor rtBg4TypeColor];
    
    if ([info respondsToSelector:@selector(groupItems)]) {
        NSArray *itemFields = [info groupItems];
        if (itemFields && itemFields.count > 0) {
            RTLabelAndIcon5Model *item1 = itemFields[0];
            [_fieldView configOwnViewsWidthInfo:item1];
        }
        if (itemFields && itemFields.count > 1) {
            RTLabelAndIcon5Model *item2 = itemFields[1];
            [_uploadFile configOwnViewsWidthInfo:item2];
        }
    }
}

- (void)relayoutFrameOfSubViews {
    
    [_bgBlackView setSize:(CGSize){(180),(30.)}];
    [_bgBlackView layoutParentHorizontalCenter];
    
    [_left setSize:(CGSize){(120.),(25)}];
    [_left alignParentLeftWithMargin:10.];
    [_left layoutParentVerticalCenter];
    
    [_numBtn setSize:(CGSize){(20),(20)}];
    [_numBtn layoutToRightOf:_left];
    [_numBtn layoutParentVerticalCenter];
    
    [_right setSize:(CGSize){(25),(25)}];
    [_right layoutToRightOf:_numBtn];
    [_right layoutParentVerticalCenter];
    [_right scaleToParentRightWithMargin:15.];
    
    [_bgView layoutBelow:_bgBlackView];
    [_bgView alignParentLeftWithMargin:10.];
    [_bgView scaleToParentRightWithMargin:10.];
    [_bgView scaleToParentBottom];
    
    [_fieldView setSize:(CGSize){(150.),(150.)}];
    [_fieldView alignParentTopWithMargin:4.];
    [_fieldView alignParentLeftWithMargin:4.];
    [_fieldView scaleToParentRightWithMargin:4.];
    [_fieldView relayoutFrameOfSubViews];
    
    [_uploadFile layoutBelow:_fieldView margin:(10.)];
    [_uploadFile alignParentLeftWithMargin:4.];
    [_uploadFile scaleToParentRightWithMargin:4.];
    [_uploadFile scaleToParentBottomWithMargin:10.];
    [_uploadFile relayoutFrameOfSubViews];
}

@end

@implementation RTFormSecretAttachmentStyle3

- (void)addOwnViews {
    _bgView  = [[UIView alloc] init];
    [self addSubview:_bgView];
    
    _fieldView = [[RTFormFieldView alloc] init];
    [_bgView addSubview:_fieldView];
    
    _authorView = [[RTPartnerAuthorSettingView alloc] init];
    [_bgView addSubview:_authorView];
    
    _addDoc = [[RTPartnerAddDocsView alloc] init];
    [_bgView addSubview:_addDoc];
}

- (void)configOwnViews {
    _bgView.backgroundColor = [RTColor rtBg12TypeColor];
    _bgView.layer.cornerRadius = 15.;
    _bgView.layer.masksToBounds = YES;
}

- (void)configSuperViewsWidthInfo:(id<RTFormProtocol>)info {
     // 添加其它同类-文档
    [_addDoc configOwnViewsWidthInfo:info];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormViewProtocol>)info {
    
    NSArray *items = [info groupItems];
    CGFloat originY = 89.;
    for (RTLabelAndIcon4Model *model in items) {
        // 密档提交卡片
        RTFormSecretAttachmentUploadFile *attachView = [[RTFormSecretAttachmentUploadFile alloc] init];
        [_bgView addSubview:attachView];
        [attachView configOwnViewsWidthInfo:model];
        CGFloat width = kScreenW - 14.0 * 2;
         [attachView setFrameAndLayout:CGRectMake(4., originY, width, 105.)];
         originY += 105. ;
    }
    // 顶部标题文本框
    [_fieldView configOwnViewsWidthInfo:info];
    // 设置权限可见范围
    [_authorView configOwnViewsWidthInfo:info];
    [_authorView setFrameAndLayout:CGRectMake(10., originY + [info verticalMargin], (180.), (30.))];
}

- (void)relayoutFrameOfSubViews {
    
    [_bgView scaleParent];
    
    [_fieldView alignParentTopWithMargin:10.];
    [_fieldView setSize:(CGSize){(89.),(89.)}];
    [_fieldView alignParentLeftWithMargin:0.];
    [_fieldView scaleToParentRightWithMargin:0.];
    [_fieldView relayoutFrameOfSubViews];
    
    [_addDoc setSize:(CGSize){(47.),(47.)}];
    [_addDoc alignParentLeftWithMargin:20.];
    [_addDoc scaleToParentRightWithMargin:20.];
    [_addDoc alignParentBottomWithMargin:10.];
    [_addDoc relayoutFrameOfSubViews];

}

@end


@implementation RTFormSecretStyle3

- (void)addOwnViews{
    [super addOwnViews];
    
    _bgView = [[UIView alloc] init];
    [self addSubview:_bgView];
    
    _leftView = [[UITextView alloc] init];
    _leftView.textAlignment = NSTextAlignmentLeft;
    _leftView.editable = NO;
    _leftView.showsHorizontalScrollIndicator = NO;
    _leftView.showsVerticalScrollIndicator = NO;
    _leftView.backgroundColor = kClearColor;
    [_bgView addSubview:_leftView];
}

- (void)configOwnViews {
    [super configOwnViews];
    
    _bgView.layer.cornerRadius = 15.;
    _bgView.layer.masksToBounds = YES;
    _bgView.backgroundColor = [RTColor rtBg15TypeColor];

}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormRowProtocol>)info {
    _leftView.attributedText = [info rowTitle];
}

- (void)relayoutFrameOfSubViews {
    [_bgView marginParentWithEdgeInsets:UIEdgeInsetsZero];
    [_leftView marginParentWithEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
}

@end

@implementation RTFormFieldAlphaTopView

- (void)addOwnViews{
    [super addOwnViews];
    _bgView = [[UIView alloc] init];
    [self addSubview:_bgView];
    _labTitle = [[UILabel alloc] init];
    _labTitle.textAlignment = NSTextAlignmentLeft;
    _labTitle.numberOfLines = 0;
    [_bgView addSubview:_labTitle];
    _bgView.backgroundColor = [RTColor rtBg15TypeColor];
}

- (void)configOwnViews {
    [super configOwnViews];
    
    _bgView.layer.cornerRadius = 15.;
    _bgView.layer.masksToBounds = YES;
    _bgView.backgroundColor = [RTColor rtBg15TypeColor];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    _labTitle.text = @"xxxxx";
    [_labTitle sizeToFit];
}

- (void)relayoutFrameOfSubViews {
    [_labTitle marginParentWithEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    [_bgView marginParentWithEdgeInsets:UIEdgeInsetsZero];
}

@end

@implementation RTFormFieldAlphaBottomView

- (void)addOwnViews{
    [super addOwnViews];
    
    _bgView = [[UIView alloc] init];
    [self addSubview:_bgView];
    
    _leftText = [[UITextView alloc] init];
    _leftText.font = FONT(LENGTH(14.));
    _leftText.textColor = [RTColor rtBg11TypeColor];
    _leftText.editable = NO;
    _leftText.showsVerticalScrollIndicator = NO;
    _leftText.showsHorizontalScrollIndicator = NO;
    _leftText.backgroundColor = kClearColor;
    [_bgView addSubview:_leftText];
    
    _accessImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_red_arrow"]];
    [_bgView addSubview:_accessImg];
    
    _editView = [[RTPartnerEditView alloc] init];
    [_bgView addSubview:_editView];
    
    _visibleSetting = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightLeft
                                                       maggin:UIEdgeInsetsZero
                                                      padding:CGSizeMake(10., 0.)];
    [self addSubview:_visibleSetting];
}

- (void)configOwnViews {
    [super configOwnViews];
    
    _bgView.layer.cornerRadius = 15.;
    _bgView.layer.masksToBounds = YES;
    _bgView.backgroundColor = kWhiteColor;
    
    _visibleSetting.titleLabel.font = FONT(LENGTH(14.));
    [_visibleSetting setTitleColor:[RTColor rtBg11TypeColor] forState:UIControlStateNormal];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    _leftText.text = @"运营合伙人具备:场地、设备";
    [_visibleSetting setTitle:@"设置权限可见范围" forState:UIControlStateNormal];
    [_visibleSetting setImage:[UIImage imageNamed:@"form_partner_warn"] forState:UIControlStateNormal];
    
    [_editView setConfigureTypeBgColor:[RTColor rtBg4TypeColor]];
    
}

- (void)relayoutFrameOfSubViews {
    
    [_bgView marginParentWithEdgeInsets:UIEdgeInsetsMake(0., 0., 20., 0.)];
    [_leftText marginParentWithEdgeInsets:UIEdgeInsetsMake(2., 10., 2., 80.)];
    
    [_accessImg setSize:(CGSize){(10.),(23.)}];
    [_accessImg alignParentRightWithMargin:10.];
    [_accessImg layoutParentVerticalCenter];

    [_editView setSize:(CGSize){(60.),(30.)}];
    [_editView layoutToLeftOf:_accessImg margin:(10.)];
    [_editView layoutParentVerticalCenter];
    [_editView relayoutFrameOfSubViews];
    
    [_visibleSetting setSize:(CGSize){(150.),(20.)}];
    [_visibleSetting layoutBelow:_bgView margin:(4.)];
    [_visibleSetting alignLeft:_bgView margin:(10.)];
}

@end

@implementation RTFormCommonSecretTopView

- (void)addOwnViews{
    // 表 2-2 已有有形资本 背景
    _topBgView = [[UIView alloc] init];
    [self addSubview:_topBgView];
    _topBgView.backgroundColor = kRedColor;
    
    // 表 2-2 已有有形资本
    _topLabel = [[UILabel alloc] init];
    _topLabel.textColor = kWhiteColor;
    _topLabel.textAlignment = NSTextAlignmentCenter;
    [_topBgView addSubview:_topLabel];
    
    // 密档
    _secretView = [[RTFormSecretView alloc] init];
    [self addSubview:_secretView];
    // 密档描述
    _secretBtmLabel = [[UILabel alloc] init];
    _secretBtmLabel.textAlignment = NSTextAlignmentCenter;
    _secretBtmLabel.numberOfLines = 4;
    [self addSubview:_secretBtmLabel];
}

- (void)configOwnViews {
    
}

- (void)configOwnViewsWidthInfo:(RTBaseModel<RTFormViewProtocol> *)model {
    
     RTLabelAndIcon5Model  *labIcon5Model = ((RTFormCapitalModel *)model).capitalHeader;
    _topLabel.text = labIcon5Model.labTitle2;
    if ([labIcon5Model respondsToSelector:@selector(rowDetail)]) {
         _secretBtmLabel.attributedText = [labIcon5Model rowDetail];
    }
    [_secretView configOwnViewsWidthInfo:labIcon5Model];
    _baseModel = model;
}

- (void)relayoutFrameOfSubViews {
    
    [_topBgView setSize:(CGSize){(280.),(30.)}];
    [_topBgView alignParentTop];
    [_topBgView layoutParentHorizontalCenter];
    
     if([_baseModel.modelType isEqualToString:@"RTFormSubCapital232"]){
        _topBgView.hidden = YES;
        [_secretView setSize:(CGSize){(167.),(167.)}];
        [_secretView alignParentTopWithMargin:10.];
        [_secretView layoutParentHorizontalCenter];
    }
    else {
        _topBgView.hidden = NO;
        [_secretView setSize:(CGSize){(167.),(167.)}];
        [_secretView layoutBelow:_topBgView margin:(10.)];
        [_secretView layoutParentHorizontalCenter];
    }
    [_secretView relayoutFrameOfSubViews];
    
    [_topLabel setSize:(CGSize){(12),(12.)}];
    [_topLabel scaleParent];

    [_secretBtmLabel layoutBelow:_secretView margin:(15.)];
    [_secretBtmLabel setSize:(CGSize){(80.),(80.)}];
    [_secretBtmLabel alignParentLeftWithMargin:15.];
    [_secretBtmLabel scaleToParentRightWithMargin:15.];
}

@end


@implementation RTFormFieldProfileCardView

- (void)addOwnViews {
    _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_icon_logo"]];
    [self addSubview:_icon];
    _smallIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_hui"]];
    [_icon addSubview:_smallIcon];
    _labTitle = [[UILabel alloc] init];
    [self addSubview:_labTitle];
    _subText = [[UITextView alloc] init];
    [self addSubview:_subText];
    _accessImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_red_arrow"]];
    [self addSubview:_accessImg];
    _editView = [[RTPartnerEditView alloc] init];
    [self addSubview:_editView];
    _detail = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_detail];
    _labProfile = [[UILabel alloc] init];
    [self addSubview:_labProfile];
    _labProfileTime = [[UILabel alloc] init];
    _labProfileTime.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_labProfileTime];
}

- (void)configOwnViews {
    
    self.backgroundColor = kWhiteColor;
    _subText.editable = NO;
    _subText.showsVerticalScrollIndicator = NO;
    _subText.showsHorizontalScrollIndicator = NO;
    _subText.backgroundColor = kClearColor;
    
    [_detail setTitleColor:[RTColor rtBg16TypeColor] forState:UIControlStateNormal];
    _detail.titleLabel.font = FONT(LENGTH(12.));
    [_detail setBackgroundImage:[UIImage imageNamed:@"form_inputField"] forState:UIControlStateNormal];
    
    _labTitle.font = FONT(LENGTH(14.));
    
    _labProfile.font = FONT(LENGTH(10.));
    _labProfile.alpha = 0.5;
    _labProfile.textColor = [RTColor rtBg16TypeColor];
    
    _labProfileTime.font = FONT(LENGTH(10.));
    _labProfileTime.textColor = [RTColor rtBg16TypeColor];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    if ([info isKindOfClass:[RTLabelAndIcon4Model class]]) {
        RTLabelAndIcon4Model *personCardModel = (RTLabelAndIcon4Model *)info;
        _labTitle.text = personCardModel.labTitle;
        _subText.text = personCardModel.attriStr;
        [_detail setTitle:personCardModel.labDetail forState:UIControlStateNormal];
        _labProfile.text = personCardModel.labDetail2;
        _labProfileTime.text = personCardModel.attriStr2;
    }
    [_editView setConfigureTypeBgColor:[RTColor rtBg4TypeColor]];
}

- (void)relayoutFrameOfSubViews {
    
    [_icon setSize:(CGSize){(101.),(82.)}];
    [_icon alignParentLeftWithMargin:10.];
    [_icon alignParentTopWithMargin:10.];
    
    [_smallIcon setSize:(CGSize){(23.),(15.)}];
    [_smallIcon alignParentRightWithMargin:2.];
    [_smallIcon alignParentBottomWithMargin:2.];
    
    [_labTitle setSize:(CGSize){(15.),(15.)}];
    [_labTitle layoutToRightOf:_icon margin:(10.)];
    [_labTitle alignTop:_icon];
    [_labTitle scaleToParentRightWithMargin:10.];
    
    [_accessImg setSize:(CGSize){(10.),(23.)}];
    [_accessImg alignParentRightWithMargin:10.];
    [_accessImg layoutParentVerticalCenter];
    
    [_editView setSize:(CGSize){(60.),(30.)}];
    [_editView layoutToLeftOf:_accessImg margin:(10.)];
    [_editView layoutParentVerticalCenter];
    [_editView relayoutFrameOfSubViews];
    
    [_labProfile setSize:(CGSize){(210.),(12.)}];
    [_labProfile alignParentBottomWithMargin:10.];
    [_labProfile alignLeft:_labTitle];
    
    [_labProfileTime setSize:(CGSize){(12.),(12.)}];
    [_labProfileTime alignParentBottomWithMargin:10.];
    [_labProfileTime alignRight:_labProfile margin:(2.)];
    [_labProfileTime scaleToParentRightWithMargin:2.];
    
    [_detail setSize:(CGSize){(200.),(20.)}];
    [_detail layoutAbove:_labProfile margin:(1.)];
    [_detail alignLeft:_labTitle];
    
    [_subText layoutBelow:_labTitle margin:2.];
    [_subText alignLeft:_labTitle];
    [_subText scaleToLeftOf:_editView margin:(10.)];
    [_subText scaleToAboveOf:_detail margin:(10.)];

}

@end

@implementation RTFormFieldTipCardView

- (void)addOwnViews {
    _bgView = [[UIView alloc] init];
    [self addSubview:_bgView];
    
    _lBtn = [[UIButton alloc] init];
    [_bgView addSubview:_lBtn];
    
    _rTextView = [[UITextView alloc] init];
    _rTextView.editable = NO;
    [_bgView addSubview:_rTextView];
}

- (void)configOwnViews {
    _bgView.layer.cornerRadius = 5.;
    _bgView.layer.masksToBounds = YES;
    _rTextView.font = FONT(LENGTH(14.));
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormSubButtonsProtocol>)info {
    if ([info buttonIsSelected]) {
        [_lBtn setImage:[UIImage imageNamed:@"form_check_selected"] forState:UIControlStateNormal];
        [_lBtn setBackgroundColor:[RTColor rtBg23TypeColor]];
        [_rTextView setBackgroundColor:[RTColor rtBgBtnTypeColor]];
        _rTextView.text = ((RTButtonItemModel *)info).labStr;
    }
    else{
        [_lBtn setImage:[UIImage imageNamed:@"form_whiter_circle"] forState:UIControlStateNormal];
        [_lBtn setBackgroundColor:[RTColor rtBg21TypeColor]];
        [_rTextView setBackgroundColor:[RTColor rtBg22TypeColor]];
        _rTextView.textColor = [RTColor rtBg21TypeColor];
        _rTextView.text = ((RTButtonItemModel *)info).labStr;
    }
}

- (void)relayoutFrameOfSubViews {
    [_bgView scaleParent];
    
    [_lBtn setSize:(CGSize){(40.),(43.)}];
    [_lBtn alignParentLeft];
    [_lBtn layoutParentVerticalCenter];
    
    [_rTextView setSize:(CGSize){(43.),(43.)}];
    [_rTextView alignParentLeftWithMargin:40.];
    [_rTextView scaleToParentRight];
    [_rTextView scaleToParentBottom];
}

@end

