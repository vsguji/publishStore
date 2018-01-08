//
//  RTFormHeaderCell.m
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTFormCell.h"
#import "RTFormHeaderView.h" // lipeng 2017.12.07
#import "UIView+Altar.h"    // lipeng 2017.12.07
#import "RTBaseView.h"
#import "RTFormView.h" // lipeng 2017.12.12
#import "RTButtonItemModel.h"
#import "RTBaseModel+RTFormTableCell.h" // lipeng 2017.12.13
#import "RTFormPartnerModel.h"
#import "RTColor.h" // lipeng 2017.12.19
#import "RTFormView.h"
#import <QuartzCore/QuartzCore.h>

#import "UIView+Altar.h"
#import "UIView+CustomAutoLayout.h"
#import "UtilsMacro.h"
#import "ColorMacro.h"
#import "UIColor+expanded.h"

@implementation RTFormHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _headerView = [[RTFormHeaderView alloc] initWithLeftCornerTitle:@"投运营合伙人照片"];
    [self.contentView addSubview:_headerView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _headerIcon.hidden = YES;
    _userTitle.hidden = YES;
    _userNick.hidden = YES;
    
   // [_headerView scaleParent];
    [_headerView setFrameAndLayout:CGRectMake(0, 0,CGRectGetWidth(self.bounds), 230)];
    [_headerView relayoutFrameOfSubViews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end

@implementation RTFormPartnerSectionHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    
    _sectionLab = [[UILabel alloc] init];
    _longLine = [[UIView alloc] init];
    _sortLine = [[UIView alloc] init];
    _sectionNum = [[UIImageView alloc] init];
    
     [self addSubview:_sectionLab];
     [self addSubview:_longLine];
     [self addSubview:_sortLine];
     [self addSubview:_sectionNum];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _headerIcon.hidden = YES;
    _userTitle.hidden = YES;
    _userNick.hidden = YES;
    
    [_sectionLab setSize:(CGSize){(CGRectGetWidth(self.bounds)),(15)}];
    [_sectionLab alignParentTopWithMargin:15];
    [_sectionLab layoutParentHorizontalCenter];
    _sectionLab.textAlignment = NSTextAlignmentCenter;
    _sectionLab.text = @"投资一个项目组的运营合伙人资本";
    _sectionLab.font = FONT(LENGTH(15));
    _sectionLab.textColor = [UIColor colorWithHexString:@"0xa2a38a"];
    
    [_longLine setSize:(CGSize){(1),(1)}];
    [_longLine alignParentLeftWithMargin:10];
    [_longLine scaleToParentRightWithMargin:10];
    [_longLine alignParentTopWithMargin:45];
    _longLine.backgroundColor = [UIColor colorWithHexString:@"0xe1e1e1"];
    
    [_sortLine setSize:(CGSize){(100),(2)}];
    [_sortLine layoutAbove:_longLine];
    [_sortLine layoutParentHorizontalCenter];
    _sortLine.backgroundColor = [UIColor colorWithHexString:@"0xa2a38a"];

    [_sectionNum setSize:(CGSize){(32),(32)}];
    [_sectionNum layoutBelow:_longLine margin:(10)];
    [_sectionNum layoutParentHorizontalCenter];
    [_sectionNum setImage:[UIImage imageNamed:@"form_section_1"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end

@implementation RTFormPartnerMemberCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _baseView = [[UIView alloc] init];
    // 密档
    _secretInfoView  = [[RTFormSecretView alloc] init];
    // 合伙人--自己
    _partnerOwnerShip = [[RTPartnerRelationView alloc] init];
    // 合伙人--场院关系
    _partnerCircleShip = [[RTPartnerRelationView alloc] init];
    // 合伙人--名片
    _partnerInfo = [[RTPartnerInfoView alloc] init];
    // 合伙人--其它容通人
    _partnerOtherShip = [[RTPartnerRelationView alloc] init];
    
     [self addSubview:_baseView];
     [_baseView addSubview:_secretInfoView];
     [_baseView addSubview:_partnerOwnerShip];
     [_baseView addSubview:_partnerCircleShip];
     [_baseView addSubview:_partnerInfo];
     [_baseView addSubview:_partnerOtherShip];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _headerIcon.hidden = YES;
    _userTitle.hidden = YES;
    _userNick.hidden = YES;
    _baseView.backgroundColor = [UIColor colorWithHexString:@"0x000f21"];
    
    CGFloat width = CGRectGetWidth(self.bounds);
    [_secretInfoView setFrameAndLayout:CGRectMake(0, 0, width, 167)];
    [_partnerOwnerShip setFrameAndLayout:CGRectMake(0, 0, width, 60)];
    [_partnerInfo setFrameAndLayout:CGRectMake(0, 0, width, 365)];
    [_partnerCircleShip setFrameAndLayout:CGRectMake(0, 0, width, 60)];
    [_partnerOtherShip setFrameAndLayout:CGRectMake(0, 0, width, 60)];
    
//    [_secretInfoView configOwnViewsWidthInfo:nil];
//    [_partnerOwnerShip configOwnViewsWidthInfo:nil];
    [_partnerInfo configOwnViewsWidthInfo:nil];
//    [_partnerCircleShip configOwnViewsWidthInfo:nil];
//    [_partnerOtherShip configOwnViewsWidthInfo:nil];
    
    [_baseView layoutBelow:_longLine margin:52];
    [_baseView scaleToParentBottom];
    [_baseView scaleToParentLeft];
    [_baseView scaleToParentRight];
    
    [_secretInfoView alignParentTop];
    [_partnerOwnerShip layoutBelow:_secretInfoView margin:0];
    [_partnerCircleShip layoutBelow:_partnerOwnerShip margin:(6)];
    [_partnerInfo layoutBelow:_partnerCircleShip margin:0];
    [_partnerOtherShip layoutBelow:_partnerInfo margin:0];
}

- (void)setCellWithModel:(RTFormPartnerModel *)model {
    NSArray *models = model.items;
    
  //  [_partnerInfo configOwnViewsWidthInfo:nil];
    // 密档
    if (models.count > 4) {
        RTLabelAndIcon3Model *midang = models[1];
        [_secretInfoView configOwnViewsWidthInfo:midang];
        // 关系
        RTLabelAndIconModel *modelSelf = models[2];
        [_partnerOwnerShip configOwnViewsWidthInfo:modelSelf];
        
        RTLabelAndIconModel *modelRelation = models[3];
        [_partnerCircleShip configOwnViewsWidthInfo:modelRelation];
        
        RTLabelAndIconModel *modelOther = models[4];
        [_partnerOtherShip configOwnViewsWidthInfo:modelOther];
    }
    else if (models.count == 1) {
        _secretInfoView.hidden = YES;
        _partnerOwnerShip.hidden = YES;
        _partnerCircleShip.hidden = YES;
        _partnerOtherShip.hidden = YES;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
@end


@implementation RTFormButtonGroupCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _leftIcon = [[UIImageView alloc] init];
    _rightIcon = [[UIImageView alloc] init];
    [self addSubview:_leftIcon];
    [self addSubview:_rightIcon];
}

- (void)layoutSubviews {
    
    [_leftIcon setSize:(CGSize){(64),(10)}];
    [_leftIcon alignParentLeft];
    [_leftIcon alignParentTopWithMargin:30];
    
    [_rightIcon setSize:(CGSize){(64),(10)}];
    [_rightIcon alignParentRight];
    [_rightIcon alignParentTopWithMargin:30];
    
    [_sectionLab setSize:(CGSize){(14),(14)}];
    [_sectionLab alignVerticalCenterOf:_rightIcon];
    [_sectionLab layoutParentHorizontalCenter];
    [_sectionLab scaleToRightOf:_leftIcon margin:-(10)];
    [_sectionLab scaleToLeftOf:_rightIcon margin:10];
    _sortLine.hidden = YES;
    _longLine.hidden = YES;
}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
    
    _leftIcon.hidden = [model leftIcon] ? NO : YES;
    _rightIcon.hidden = [model rightIcon] ? NO : YES;
    _sectionLab.hidden = [model sectionTitle] ? NO : YES;
    
    _leftIcon.image = [model leftIcon];
    _rightIcon.image = [model rightIcon];
    _sectionLab.textAlignment = NSTextAlignmentCenter;
    _sectionLab.attributedText = [model sectionTitle];
    NSArray *buttons = [model groupItems];
    CGFloat originY = [model topMarginHeight];

    for (RTButtonsGroupModel<RTFormFieldProtocol> *buttonItem in buttons) {
        CGFloat itemHeight = [buttonItem formTableViewHeight];
        CGFloat verticeHeight = [buttonItem verticalMargin];
        if ([buttonItem isKindOfClass:[RTLabelAndFieldModel class]]) {
            RTFormFieldView *fileView = [[RTFormFieldView alloc] init];
            [self addSubview:fileView];
            [fileView configOwnViewsWidthInfo:(id<RTFormFieldProtocol>)buttonItem];
            [fileView setFrameAndLayout:CGRectMake(0,originY, kScreenW, itemHeight)];
        }
        else {
            RTButtonGroupView *buttonView = [[RTButtonGroupView alloc] init];
            [self addSubview:buttonView];
            [buttonView configOwnViewsWidthInfo:(id<RTFormViewProtocol>)buttonItem];
            [buttonView setFrameAndLayout:CGRectMake(0,originY, kScreenW, itemHeight)];
        }
        originY += (itemHeight + verticeHeight);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
@end

@implementation RTFormSectionHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _leftIcon = [[UIImageView alloc] init];
    _rightIcon = [[UIImageView alloc] init];
    _btmLabel = [[UILabel alloc] init];
    _btmLabel.font = FONT(12.);
    _btmLabel.textColor = [UIColor colorWithHexString:@"0xa2a38a"];
    _btmLabel.numberOfLines = 0;
    _btmLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_leftIcon];
    [self addSubview:_rightIcon];
    [self addSubview:_btmLabel];
}

- (void)layoutSubviews {
   // [super layoutSubviews];
   // _sectionLab.text = nil;
    
    [_longLine setSize:(CGSize){(1),(1)}];
    [_longLine alignParentLeftWithMargin:10];
    [_longLine scaleToParentRightWithMargin:10];
    [_longLine alignParentTopWithMargin:45];
    _longLine.backgroundColor = [UIColor colorWithHexString:@"0xe1e1e1"];
    
    [_leftIcon setSize:(CGSize){(75),(10)}];
    [_leftIcon alignParentLeft];
    [_leftIcon alignParentTopWithMargin:30];
    
    [_rightIcon setSize:(CGSize){(75),(10)}];
    [_rightIcon alignParentRight];
    [_rightIcon alignParentTopWithMargin:30];
    
    [_sectionLab setSize:(CGSize){(14),(14)}];
    [_sectionLab alignVerticalCenterOf:_rightIcon];
    [_sectionLab layoutParentHorizontalCenter];
    [_sectionLab scaleToRightOf:_leftIcon margin:-(10)];
    [_sectionLab scaleToLeftOf:_rightIcon margin:10];
    
    [_sectionNum setSize:(CGSize){(32),(32)}];
    [_sectionNum layoutBelow:_sectionLab margin:10];
    [_sectionNum alignHorizontalCenterOf:_sectionLab];
    
    [_btmLabel setSize:(CGSize){(220),(40)}];
    [_btmLabel layoutToRightOf:_leftIcon margin:(10)];
    [_btmLabel layoutToLeftOf:_rightIcon margin:(10)];
    [_btmLabel layoutBelow:_sectionNum margin:(10)];
    [_btmLabel alignHorizontalCenterOf:_sectionLab];
    _sortLine.hidden = YES;
    _longLine.hidden = YES;
    
   
    if ([_formInfo isKindOfClass:[RTFormSectionHeaderModel class]]) {
        RTFormSectionHeaderModel *sectionModel = (RTFormSectionHeaderModel *)_formInfo;
        if ([sectionModel.modelType isEqualToString:@"RTFormEntityProduct"]) {
            // 实体产品资本
            _sectionLab.hidden = YES;
             [_sectionNum alignParentTopWithMargin:25.];
             [_btmLabel layoutBelow:_sectionLab margin:(2)];
        }
       else if ([sectionModel.modelType isEqualToString:@"RTFormPartnerArea"]) {
             // 地理位置·圈子范围
            [_rightIcon setSize:(CGSize){(15),(15)}];
            [_sectionLab setSize:(CGSize){(180),(14)}];
            _rightIcon.hidden = NO;
            [_sectionNum alignParentTopWithMargin:15.];
            [_sectionLab layoutParentHorizontalCenter];
            [_sectionLab layoutBelow:_sectionNum margin:(10)];
            [_rightIcon layoutToRightOf:_sectionLab];
            [_rightIcon alignVerticalCenterOf:_sectionLab];
            [_btmLabel layoutBelow:_sectionLab margin:(2)];
        }
        else if ([sectionModel.modelType isEqualToString:@"RTFormPartnerCulture"]){
            // 文化宣传
            _btmLabel.font = FONT(LENGTH(15.));
             [_sectionNum alignParentTopWithMargin:15.];
             [_btmLabel layoutBelow:_sectionLab margin:(2)];
            self.backgroundColor = [RTColor rtBgColor];
        }
        else if ([sectionModel.modelType isEqualToString:@"RTFormPartnerCapacitive"]){
            //  容通值·创业气象
            [_sectionNum alignParentTopWithMargin:15];
            _sectionLab.textColor = kBlackColor;
            [_sectionLab layoutBelow:_sectionNum margin:(2)];
            
            [_btmLabel setSize:(CGSize){(220),(12)}];
            [_btmLabel layoutBelow:_sectionLab margin:(2)];
            
            [_leftIcon alignBottom:_sectionLab];
            [_rightIcon alignBottom:_sectionLab];
            
            [_longLine alignParentBottomWithMargin:20.];
            _longLine.hidden = NO;
        }
        else if ([sectionModel.modelType isEqualToString:@"RTFormEntityProductOne"]){
            // 可投项目
            [_sectionLab alignParentTopWithMargin:15.];
            _sortLine.hidden = NO;
            _longLine.hidden = NO;
            [_btmLabel setSize:(CGSize){(220),(12)}];
            [_btmLabel layoutBelow:_sectionNum margin:(2)];
        }
        else if ([sectionModel.modelType isEqualToString:@"RTFormProductEntityProduct"]){
            [_sectionNum alignParentTopWithMargin:20.];
            [_btmLabel setSize:(CGSize){(220),(12)}];
            [_btmLabel layoutBelow:_sectionNum margin:(2)];
        }
        else if ([sectionModel.modelType isEqualToString:@"RTFormAreaEntityProduct"]) {
            // 可投场地
            self.backgroundColor = [RTColor rtBg22TypeColor];
            [_sectionLab setSize:(CGSize){160,14}];
            [_sectionLab layoutParentHorizontalCenter];
            [_sectionNum setSize:(CGSize){(15),(15)}];
            [_sectionNum layoutToRightOf:_sectionLab margin:2.];
            [_sectionNum alignVerticalCenterOf:_leftIcon];
            [_sectionLab alignVerticalCenterOf:_leftIcon];
            _btmLabel.hidden = YES;
        }
    }
}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
    
    _formInfo = model;
    
    _leftIcon.hidden = [model leftIcon] ? NO : YES;
    _rightIcon.hidden = [model rightIcon] ? NO : YES;
    _sectionLab.hidden = [model sectionTitle] ? NO : YES;
    _sectionNum.hidden = [model sectionIcon] ? NO : YES;
    
    _leftIcon.image = [model leftIcon];
    _rightIcon.image = [model rightIcon];
    _sectionLab.textAlignment = NSTextAlignmentCenter;
    _sectionLab.attributedText = [model sectionTitle];
    _sectionNum.image = [model sectionIcon];

    // 该运营合伙人作为组合股权的资本落地股份制企业的组合限时
    if ([model isKindOfClass:[RTFormSectionHeaderModel class]]) {
        RTFormSectionHeaderModel *sectionModel = (RTFormSectionHeaderModel *)model;
        if ([sectionModel.modelType isEqualToString:@"area"] ) {
            // dosomething...
        }
        else{
            _btmLabel.text = ((RTFormSectionHeaderModel *)model).labDetail ? ((RTFormSectionHeaderModel *)model).labDetail : @"";
            [_btmLabel sizeToFit];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
@end


@implementation RTFormAreaCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _btmButton = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightCenter maggin:UIEdgeInsetsMake(0, 10, 0, 0) padding:CGSizeMake(10., 0.)];
    [_btmButton setImage:[UIImage imageNamed:@"form_blue_add"] forState:UIControlStateNormal];
    [_btmButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_btmButton.titleLabel setFont:FONT(LENGTH(15.))];
    [_btmButton setBackgroundColor:[RTColor rtBgBtnTypeColor]];
    [self addSubview:_btmButton];
    
    _btmBoldLine = [[UIView alloc] init];
    _btmBoldLine.backgroundColor = kBlackColor;
    [self addSubview:_btmBoldLine];
    _btmBoldLine.layer.cornerRadius = 10;
    _btmBoldLine.layer.masksToBounds = YES;
    self.backgroundColor = [RTColor rtBgColor];
    _btmButton.layer.cornerRadius = 10;
    _btmButton.layer.masksToBounds = YES;
}

- (void)layoutSubviews {
    
    [_btmButton setSize:(CGSize){(44),(44)}];
    [_btmButton alignParentLeftWithMargin:20];
    [_btmButton scaleToParentRightWithMargin:20];
    [_btmBoldLine setSize:(CGSize){(20),(20)}];
    [_btmBoldLine alignParentLeftWithMargin:20];
    [_btmBoldLine scaleToParentRightWithMargin:20];
    [_btmBoldLine alignParentBottomWithMargin:10];
    [_btmButton layoutAbove:_btmBoldLine margin:(10)];
}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
    
    for (RTFormPartnerAreaModel *areaModel in [model groupItems]) {

    }
    
    if ([model rowString]) {
        [_btmButton setTitle:[model rowString] forState:UIControlStateNormal];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
@end

@implementation RTFormBriefCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_brief_bg"]];
    [self addSubview:_bg];
    
    _briefTitle = [[UILabel alloc] init];
    _briefTitle.font = FONT(LENGTH(15.));
    _briefTitle.textColor = kWhiteColor;
    _briefTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_briefTitle];
    
    _topView = [[RTFormBriefTopView alloc] init];
    _topView.layer.cornerRadius = 20;
    _topView.layer.masksToBounds = YES;
    _topView.backgroundColor = [RTColor rtBg1TypeColor];
    [self addSubview:_topView];
    
    _btmView = [[RTFormBriefBottomView alloc] init];
    _btmView.layer.cornerRadius = 10;
    _btmView.layer.masksToBounds = YES;
    _btmView.backgroundColor = [RTColor rtBg2TypeColor];
    [self addSubview:_btmView];

    _btmFieldsBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_whiter_bg"]];
    [self addSubview:_btmFieldsBg];
    self.backgroundColor = [RTColor rtBgColor];
}

- (void)layoutSubviews {
    
    [_bg marginParentWithEdgeInsets:UIEdgeInsetsMake(10, 0, 0, 0)];
    [_briefTitle setSize:(CGSize){(15.),(15.)}];
    [_briefTitle alignParentTopWithMargin:40.];
    [_briefTitle alignParentLeftWithMargin:40.];
    [_briefTitle scaleToParentRightWithMargin:40.];
    [_briefTitle layoutParentHorizontalCenter];
    
    [_topView setSize:(CGSize){(64.),(64.)}];
    [_topView alignParentLeftWithMargin:10.];
    [_topView scaleToParentRightWithMargin:10.];
    [_topView layoutBelow:_briefTitle margin:(10)];
    
    [_btmView layoutBelow:_topView];
    [_btmView setSize:(CGSize){(185),(185.)}];
    [_btmView alignParentLeftWithMargin:10.];
    [_btmView scaleToParentRightWithMargin:10.];
    
    [_btmFieldsBg layoutBelow:_btmView];
    [_btmFieldsBg alignParentLeft];
    [_btmFieldsBg scaleToParentRight];
    [_btmFieldsBg scaleToParentBottom];
    
    [_topView relayoutFrameOfSubViews];
    [_btmView relayoutFrameOfSubViews];
}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
    _briefTitle.text = @"推广简介·标题";
    NSArray *items = [model groupItems];
    if (items && items.count > 1) {
        [_topView configOwnViewsWidthInfo:items[0]];
        [_btmView configOwnViewsWidthInfo:items[1]];
    }
    NSArray *subArray = [items subarrayWithRange:NSMakeRange(2, items.count -2)];
    CGFloat originY = [model topMargin];
    for (RTLabelAndFieldModel<RTFormFieldProtocol> *itemField in subArray) {
        CGFloat formHeight = [itemField formTableViewHeight];
        RTFormFieldView *fieldView = [[RTFormFieldView alloc] init];
        [_btmFieldsBg addSubview:fieldView];
        [fieldView configOwnViewsWidthInfo:itemField];
        [fieldView setFrameAndLayout:CGRectMake(0, originY, kScreenW, formHeight)];
        originY += formHeight + [model verticalMargin];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
@end



@implementation RTFormCapacitiveCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    
    _bgImg = [[UIImageView alloc] init];
    [self addSubview:_bgImg];
    
    _topView = [[RTFormSecretView alloc] init];
    [self addSubview:_topView];
    
    _bottomView = [[RTFormSecretAttachment alloc] init];
    [_bgImg addSubview:_bottomView];
    self.backgroundColor = [RTColor rtBg4TypeColor];
    
    _addDoc = [[RTPartnerAddDocsView alloc] init];
    [_bgImg addSubview:_addDoc];
    
    _bgImg.backgroundColor = [RTColor rtBg12TypeColor];
    _bgImg.layer.cornerRadius = 10.;
    _bgImg.layer.masksToBounds = YES;
}

- (void)layoutSubviews {
    
    if (_fieldModel) {
         RTFormCapacitiveModel *capacitiveModel = (RTFormCapacitiveModel *)_fieldModel;
        if (capacitiveModel.capacitiveHeader) {
             _topView.hidden = NO;
            [_topView setSize:(CGSize){(186.),(186.)}];
            [_topView alignParentLeft];
            [_topView scaleToParentRight];
            
            [_bgImg layoutBelow:_topView margin:(15.)];
            [_bgImg alignParentLeftWithMargin:4.];
            [_bgImg scaleToParentRightWithMargin:4.];
            [_bgImg scaleToParentBottomWithMargin:10.];
            
            [_bottomView alignParentTop];
            [_bottomView alignParentLeftWithMargin:10.];
            [_bottomView scaleToParentRightWithMargin:10.];
            
            [_addDoc setSize:(CGSize){(47.),(47.)}];
            [_addDoc alignParentLeftWithMargin:20.];
            [_addDoc scaleToParentRightWithMargin:20.];
            [_addDoc alignParentBottomWithMargin:10.];
            
            [_bottomView scaleToAboveOf:_addDoc margin:(10.)];
            
            [_topView relayoutFrameOfSubViews];
            [_bottomView relayoutFrameOfSubViews];
            [_addDoc relayoutFrameOfSubViews];
        }
        else {
            _topView.hidden = YES;
            [_bgImg alignParentTopWithMargin:0.];
            [_bgImg alignParentLeftWithMargin:10.];
            [_bgImg scaleToParentRightWithMargin:10.];
            [_bgImg scaleToParentBottomWithMargin:10.];
    
            
            [_addDoc setSize:(CGSize){(47.),(47.)}];
            [_addDoc alignParentLeftWithMargin:20.];
            [_addDoc scaleToParentRightWithMargin:20.];
            [_addDoc alignParentBottomWithMargin:15.];
            
            [_addDoc relayoutFrameOfSubViews];
        }
    }

}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
    
    RTFormCapacitiveModel *capacitiveModel = (RTFormCapacitiveModel *)model;
    if (capacitiveModel.capacitiveHeader) {
        [_topView configOwnViewsWidthInfo:capacitiveModel.capacitiveHeader];
    }
    // 上下游合同组合
    if ([model respondsToSelector:@selector(groupItems)]) {
        NSArray *fields = [model groupItems];
        if ([model.modelType isEqualToString:@"RTFormSubCapacitivePartOne"]) {
             [_bottomView configOwnViewsWidthInfo:(id<RTFormProtocol>)capacitiveModel.items];
        }
       else if ([model.modelType isEqualToString:@"RTFormSubPartTwo"]) {
           [_bottomView removeFromSuperview];
           _bottomView = nil;
            NSInteger sectionGroupField = fields.count / 2;
            CGFloat originY = 0.;
            for (NSInteger i = 0; i < sectionGroupField ; i++) {
                NSInteger location = 2 * i - 1;
                if (location < 0) {
                    location = 0;
                }
                // 密档附件卡片
                RTFormSecretAttachment *attachView = [[RTFormSecretAttachment alloc] init];
                [_bgImg addSubview:attachView];
                NSArray *items = [fields subarrayWithRange:NSMakeRange(2 * i, 2)];
                [attachView configOwnViewsWidthInfo:(id<RTFormProtocol>)items];
                CGFloat width = kScreenW - 14.0 * 2;
                [attachView setFrameAndLayout:CGRectMake(4., originY, width, [model rowHeight])];
                // n - 1
                if (i < sectionGroupField - 1) {
                    // 添加中线
                    UIView *line = [self middleLine];
                    [_bgImg addSubview:line];
                    width -= [model leftMagin] * 2;
                    [line setFrameAndLayout:CGRectMake([model leftMagin], [model rowHeight], width, [model verticalMargin])];
                }
                originY += [model rowHeight] + [model verticalMargin] * 1.5;
            }
        }
        else if ([model.modelType isEqualToString:@"RTFormSubPartThree"]){
            // 转移观看 ==>  RTFormCapacitive2Cell
        }
    }
    if (capacitiveModel.capacitiveFooter) {
         [_addDoc configOwnViewsWidthInfo:capacitiveModel.capacitiveFooter];
    }
    _fieldModel = model;
}

// RTFormSubPartTwo
// private 密档卡中间分割线

- (UIView *)middleLine {
    UIView *line = [[UIView alloc] init];
    [_bgImg addSubview:line];
    line.layer.cornerRadius = 5.;
    line.layer.masksToBounds = YES;
    line.backgroundColor = kBlackColor;
    [line setSize:(CGSize){LENGTH(10.),LENGTH(10.)}];
    [_bgImg alignParentLeftWithMargin:10.];
    [_bgImg scaleToParentRightWithMargin:10.];
    return line;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end

@implementation RTFormCapacitive2Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    self.backgroundColor = [RTColor rtBg4TypeColor];
}

- (void)layoutSubviews {
    
}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
    
    RTFormCapacitivePartThreeModel *part3Models = (RTFormCapacitivePartThreeModel *)model;
    // 底部添加
    RTLabelAndIcon3Model *footer = part3Models.capacitiveFooter;
    
    CGFloat originY = 0.;
    for (RTLabelAndField3Model *fieldModel in part3Models.items) {
        // 密档附件卡片
        RTFormSecretAttachmentStyle3 *attachView = [[RTFormSecretAttachmentStyle3 alloc] init];
        [self addSubview:attachView];
        [attachView configOwnViewsWidthInfo:fieldModel];
        [attachView configSuperViewsWidthInfo:footer];
        CGFloat width = kScreenW - 10.0 * 2;
        [attachView setFrameAndLayout:CGRectMake(10., originY, width, [model rowHeight] + [fieldModel rowHeight])];
        originY += [model rowHeight] + [fieldModel rowHeight] + [model verticalMargin];
    }
    _fieldModel = model;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end


@implementation RTFormCapitalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    // 内容 (除顶部,底部线外)
    _centerView = [[UIView alloc] init];
    [self addSubview:_centerView];
     _centerView.backgroundColor = [RTColor rtBg7TypeColor];
    
//    // 表 2-2 已有有形资本
    _secretTopView = [[RTFormCommonSecretTopView alloc] init];
    [_centerView addSubview:_secretTopView];
    
    // 创业气象·有形资本估值密档·提纲eg:1场地 2设备
    _secretStyle3 = [[RTFormSecretStyle3 alloc] init];
    [_centerView addSubview:_secretStyle3];
    
    // 运营合伙人具备:场地 设备
    _bottomView = [[RTFormFieldAlphaBottomView alloc] init];
    _bottomView.layer.cornerRadius = 5.;
    _bottomView.layer.masksToBounds = YES;
    [_centerView addSubview:_bottomView];
    
    // 人卡
    _personCard = [[RTFormFieldProfileCardView alloc] init];
    _personCard.layer.masksToBounds = YES;
    _personCard.layer.cornerRadius = 5.;
    [_centerView addSubview:_personCard];
    
    // 权限设置
    _authorView = [[RTPartnerAuthorSettingView alloc] init];
    [_centerView addSubview:_authorView];
    
    // 顶部分割线
    _topLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_black_line"]];
    [self addSubview:_topLine];

    // 底部分割线
    _btmLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_black_line"]];
    [self addSubview:_btmLine];
    self.backgroundColor = [RTColor rtBg4TypeColor];
    _btmLine.hidden = YES;
}

- (void)layoutSubviews {
    
    [_topLine setSize:(CGSize){(20),(20)}];
    [_topLine alignParentTop];
    [_topLine alignParentLeft];
    [_topLine scaleToParentRight];
    
    [_centerView alignParentLeft];
    [_centerView layoutBelow:_topLine margin:-(10)];
    [_centerView scaleToBelowOf:_topLine margin:-(10)];
    [_centerView scaleToParentBottom];
    [_centerView scaleToParentRight];
    
    [_secretTopView setSize:(CGSize){(290.),(290.)}];
    if([_baseModel.modelType isEqualToString:@"RTFormSubCapital232"]){
        // 底部变白线
        _btmLine.hidden = NO;
        _btmLine.image = nil;
        _btmLine.backgroundColor = kWhiteColor;
        [_btmLine setSize:(CGSize){(1.),(1.)}];
        [_btmLine alignParentBottom];
        [_btmLine alignParentLeft];
        [_btmLine scaleToParentRight];
        [_secretTopView setSize:(CGSize){(260.),(260.)}];
    }
    [_secretTopView alignParentTopWithMargin:20.];
    [_secretTopView alignParentLeft];
    [_secretTopView scaleToParentRight];
    [_secretTopView relayoutFrameOfSubViews];
    
    [_secretStyle3 layoutBelow:_secretTopView margin:(10.)];
    [_secretStyle3 setSize:(CGSize){(60.),(60.)}];
    [_secretStyle3 alignParentLeftWithMargin:10.];
    [_secretStyle3 scaleToParentRightWithMargin:10.];
    [_secretStyle3 relayoutFrameOfSubViews];
    
    [_bottomView setSize:(CGSize){(104.),(104.)}];
    [_bottomView layoutBelow:_secretStyle3];
    [_bottomView alignParentLeftWithMargin:10.];
    [_bottomView scaleToParentRightWithMargin:10.];
    [_bottomView relayoutFrameOfSubViews];

    [_personCard setSize:(CGSize){(124.),(124.)}];
    [_personCard layoutBelow:_bottomView margin:(10.)];
    [_personCard alignParentLeft];
    [_personCard scaleToParentRight];
    [_personCard relayoutFrameOfSubViews];
    
    [_authorView setSize:(CGSize){(180.),(30.)}];
    [_authorView alignLeft:_personCard];
    [_authorView layoutBelow:_personCard margin:(10.)];
    [_authorView relayoutFrameOfSubViews];
}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
    
    [_secretTopView configOwnViewsWidthInfo:model];
    
    NSArray<RTLabelAndIcon4Model *> *labIcon4ModelArray = [model groupItems];
    if (labIcon4ModelArray && labIcon4ModelArray.count > 0) {
         [_secretStyle3 configOwnViewsWidthInfo:labIcon4ModelArray[0]];
    }
    if (labIcon4ModelArray && labIcon4ModelArray.count > 1) {
        [_bottomView configOwnViewsWidthInfo:labIcon4ModelArray[1]];
    }
    if (labIcon4ModelArray && labIcon4ModelArray.count > 2) {
        [_personCard configOwnViewsWidthInfo:labIcon4ModelArray[2]];
    }
    if (labIcon4ModelArray && labIcon4ModelArray.count > 3) {
        [_authorView configOwnViewsWidthInfo:labIcon4ModelArray[3]];
    }
    
    if (labIcon4ModelArray && labIcon4ModelArray.count > 4) {
        NSArray *extenTips = [labIcon4ModelArray subarrayWithRange:NSMakeRange(labIcon4ModelArray.count - 2, 2)];
        if (extenTips) {
            CGFloat width = kScreenW - 10. * 2;
            CGFloat originY = [model formTableViewHeight] - 140.;
            for (RTButtonItemModel *btnModel in extenTips) {
                RTFormFieldTipCardView *tipCardView = [[RTFormFieldTipCardView alloc] init];
                [_centerView addSubview:tipCardView];
                [tipCardView configOwnViewsWidthInfo:btnModel];
                [tipCardView setFrameAndLayout:CGRectMake(10.,originY, width, 45.)];
                originY += 45. + 10.;
            }
        }
    }
    _baseModel = model;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end


@implementation RTFormInvisibleCapitalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
     self.backgroundColor = [RTColor rtBg7TypeColor];
    
    _centerView = [[UIView alloc] init];
    [self addSubview:_centerView];
    _centerView.backgroundColor = [RTColor rtBg4TypeColor];
    
    // 2-3-1密档说明
    _secretTopView  = [[RTFormCommonSecretTopView alloc] init];
    [_centerView addSubview:_secretTopView];
    
    // 表2-3-1密档x号
    _attachmentView = [[RTFormSecretAttachmentStyle2 alloc] init];
    _attachmentView.layer.cornerRadius = 15.;
    _attachmentView.layer.masksToBounds = YES;
    [_centerView addSubview:_attachmentView];
    
    // footer
    _addDoc = [[RTPartnerAddDocsView alloc] init];
    [_centerView addSubview:_addDoc];
    
    // 顶部分割线
    _topLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_black_line"]];
    [self addSubview:_topLine];
}

- (void)layoutSubviews {
    
    [_topLine setSize:(CGSize){(20),(20)}];
    [_topLine alignParentTop];
    [_topLine alignParentLeft];
    [_topLine scaleToParentRight];
    
    [_centerView alignParentLeft];
    [_centerView layoutBelow:_topLine margin:-(10)];
    [_centerView scaleToBelowOf:_topLine margin:-(10)];
    [_centerView scaleToParentBottom];
    [_centerView scaleToParentRight];
    
    [_secretTopView setSize:(CGSize){(290.),(290.)}];
    [_secretTopView alignParentTopWithMargin:20.];
    [_secretTopView alignParentLeft];
    [_secretTopView scaleToParentRight];
    [_secretTopView relayoutFrameOfSubViews];
    
    [_addDoc setSize:(CGSize){(47.),(47.)}];
    [_addDoc alignParentLeftWithMargin:20.];
    [_addDoc scaleToParentRightWithMargin:20.];
    [_addDoc alignParentBottomWithMargin:10.];
    [_addDoc relayoutFrameOfSubViews];
    
    [_attachmentView layoutBelow:_secretTopView margin:(25.)];
    [_attachmentView alignParentLeftWithMargin:2.];
    [_attachmentView scaleToParentRightWithMargin:2.];
    [_attachmentView scaleToAboveOf:_addDoc margin:(10.)];
    [_attachmentView relayoutFrameOfSubViews];
    
}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
    
    RTFormCapacitiveModel *capacitiveModel = (RTFormCapacitiveModel *)model;
    [_secretTopView configOwnViewsWidthInfo:model];
    
    if (capacitiveModel.capacitiveFooter) {
        [_addDoc configOwnViewsWidthInfo:capacitiveModel.capacitiveFooter];
    }
    
    [_attachmentView configOwnViewsWidthInfo:model];
    _fieldModel = model;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end


@implementation RTFormPersonCardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    
    [self.contentView addSubview:_headerIcon];
    self.headerIcon.image = [UIImage imageNamed:@"form_icon_logo"];
    
    _accessImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_red_arrow"]];
    [self.contentView addSubview:_accessImg];
    
    _editView = [[RTPartnerEditView alloc] init];
    [self.contentView addSubview:_editView];
    
    _relationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:_relationBtn];
    [_relationBtn setBackgroundImage:[UIImage imageNamed:@"form_inputField"] forState:UIControlStateNormal];
    [_relationBtn setTitleColor:[RTColor rtBg16TypeColor] forState:UIControlStateNormal];
    _relationBtn.titleLabel.font = FONT(LENGTH(12.));
    
    _dateAndTime = [[UILabel alloc] init];
    _dateAndTime.font = FONT(LENGTH(12.));
    [self.contentView addSubview:_dateAndTime];
    
    self.userTitle.textColor = kBlackColor;
    
    self.backgroundColor = [RTColor rtBg7TypeColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_accessImg setSize:(CGSize){(10.),(23.)}];
    [_accessImg alignParentRightWithMargin:10.];
    [_accessImg layoutParentVerticalCenter];
    
    [_editView setSize:(CGSize){(60.),(30.)}];
    [_editView layoutToLeftOf:_accessImg margin:(10.)];
    [_editView layoutParentVerticalCenter];
    
    [_relationBtn setSize:(CGSize){(15.),(15.)}];
    [_relationBtn alignLeft:self.userTitle];
    [_relationBtn scaleToRightOf:_editView margin:(10.)];

    [_dateAndTime alignParentBottomWithMargin:10.];
    [_dateAndTime alignLeft:self.userTitle];
    [_dateAndTime scaleToParentRightWithMargin:10.];
    
    [_relationBtn layoutAbove:_dateAndTime margin:(2.)];

}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
   // self.userTitle.text = @"张三运营合伙人·有形资本";
    self.userNick.text = @"设备、场地...";
    [_relationBtn setTitle:@"绘声绘色·创业气象·已有有形资本" forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end

@implementation RTFormFooterCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_leftBtn];
    [self addSubview:_rightBtn];
    _leftBtn.layer.cornerRadius = 10.;
    _leftBtn.layer.masksToBounds = YES;
    _rightBtn.layer.cornerRadius = 10.;
    _rightBtn.layer.masksToBounds = YES;
    [_leftBtn.titleLabel setFont:FONT(LENGTH(18.))];
    [_leftBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_rightBtn.titleLabel setFont:FONT(LENGTH(18.))];
    [_rightBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_leftBtn setBackgroundColor:[RTColor rtBg8TypeColor]];
    [_rightBtn setBackgroundColor:[RTColor rtBg9TypeColor]];
    self.backgroundColor = [RTColor rtBg7TypeColor];
}

- (void)layoutSubviews {
    CGFloat width = (kScreenW - 15 * 2 - 10) / 2;
    [_leftBtn setSize:(CGSize){(width),(45.)}];
    [_leftBtn alignParentLeftWithMargin:10.];
    [_leftBtn layoutParentVerticalCenter];
    
    [_rightBtn setSize:(CGSize){(width),(45.)}];
    [_rightBtn alignParentRightWithMargin:10.];
    [_rightBtn layoutParentVerticalCenter];
}

- (void)setCellWithModel:(RTBaseModel<RTFormViewProtocol> *)model {
    [_leftBtn setTitle:@"发布" forState:UIControlStateNormal];
    [_rightBtn setTitle:@"保存" forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
