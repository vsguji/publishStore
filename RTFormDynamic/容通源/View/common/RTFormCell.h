//
//  RTFormHeaderCell.h
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTBaseCell.h"
#import "RTPartnerTipView.h"

@class RTFormHeaderView;
@class RTFormBriefTopView;
@class RTFormBriefBottomView;
@class RTFormPersonCardCell;
///////////////////////////////////////////////////////////////////////////////////////////////////////
// 表单页眉:拍照

@interface RTFormHeaderCell : RTBaseCell
{
    @protected
    RTFormHeaderView *_headerView;
}
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 表单头分区投基类

@interface RTFormPartnerSectionHeaderCell : RTBaseCell
{
@protected
    UILabel *_sectionLab;
    UIView  *_longLine;
    UIView  *_sortLine;
    UIImageView *_sectionNum;
    id _formInfo;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 运营合伙人
@interface RTFormPartnerMemberCell : RTFormPartnerSectionHeaderCell
{
    @protected
    UIView *_baseView;
    // 密档
    RTFormSecretView *_secretInfoView;
    // 选择合伙人 -- 自己
    RTPartnerRelationView *_partnerOwnerShip;
    // 选择合伙人 -- 选个性场院关系
    RTPartnerRelationView *_partnerCircleShip;
    // 选择合伙人 -- 名片
    RTPartnerInfoView  *_partnerInfo;
    // 选择合伙人 -- 选其它容通人
    RTPartnerRelationView *_partnerOtherShip;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 运营合作方式

@interface RTFormButtonGroupCell : RTFormPartnerSectionHeaderCell
{
    @protected
    UIImageView *_leftIcon;
    UIImageView *_rightIcon;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 表单头分区样式1

@interface RTFormSectionHeaderCell:RTFormPartnerSectionHeaderCell{
@protected
    UIImageView *_leftIcon;
    UIImageView *_rightIcon;
    UILabel  *_btmLabel;
}
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 地理位置,圈子范围

@interface RTFormAreaCell:RTBaseCell {
    @protected
    ImageTitleButton  *_btmButton;
    UIView            *_btmBoldLine;
    RTBaseModel       *_areaModel;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 推广简介·标题

@interface RTFormBriefCell:RTBaseCell {
    @protected
    // 推广简介背景
    UIImageView *_bg;
    // 推广简介标题
    UILabel   *_briefTitle;
    RTFormBriefTopView *_topView;
    RTFormBriefBottomView *_btmView;
    UIImageView *_btmFieldsBg;
}
@end



///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象

@interface RTFormCapacitiveCell:RTBaseCell {
@protected
    UIImageView *_bgImg;
    RTFormSecretView *_topView;
    RTFormSecretAttachment *_bottomView;
@private
    RTPartnerAddDocsView *_addDoc;
    RTBaseModel *_fieldModel;
}
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象 样式2

@interface RTFormCapacitive2Cell:RTBaseCell {
@private
    RTBaseModel *_fieldModel;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象  资本+密档

@interface RTFormCapitalCell: RTBaseCell {
   @protected
    UIImageView *_topLine;
    UIView      *_centerView;
    RTFormCommonSecretTopView *_secretTopView;
    RTFormSecretStyle3 *_secretStyle3;
    RTFormFieldAlphaBottomView    *_bottomView;
    RTFormFieldProfileCardView    *_personCard;
    UIImageView *_btmLine;
    @private
    RTBaseModel<RTFormViewProtocol> *_baseModel;
    RTBaseModel *_secret3Model;
    RTPartnerAuthorSettingView *_authorView;   /// 设置权限可见范围
}
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象  资本+密档 (无形资本)

@interface RTFormInvisibleCapitalCell: RTBaseCell {
@protected
    UIImageView *_topLine;
    UIView      *_centerView;
    RTFormCommonSecretTopView *_secretTopView;
    RTFormSecretAttachmentStyle2 *_attachmentView; /// 表2-3-1密档
@private
    RTPartnerAddDocsView *_addDoc;
    RTBaseModel *_fieldModel;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象  人员介绍卡

@interface RTFormPersonCardCell:RTBaseCell {
    @protected
    UIImageView *_accessImg;
    RTPartnerEditView *_editView;
    UIButton    *_relationBtn;  /// 绘声绘色·创业气象·已有有形资本
    UILabel     *_dateAndTime;   /// 八坛公司 发出时间 2017-02-28 18:00 7分钟前
}

@end
///////////////////////////////////////////////////////////////////////////////////////////////////////
// 表单页尾

@interface RTFormFooterCell:RTBaseCell {
@protected
    UIButton  *_leftBtn;
    UIButton  *_rightBtn;
}
@end


