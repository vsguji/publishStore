//
//  RTPartnerRelationView.h
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//
//  合同选择关系
#import <UIKit/UIKit.h>
#import "RTBaseView.h"
#import "RTFormView.h" // lipeng 2017.12.22
#import "ImageTitleButton.h"

@class RTLabelAndIconModel;
///////////////////////////////////////////////////////////////////////////////////////////////////////
// 展开容通关系

@interface RTPartnerLeftView : RTBaseView
{
    @private
    UIImageView *_bgImg;
    UIButton *_checkBtn;
    UIButton *_upOrDown;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通编辑

@interface RTPartnerEditView : RTBaseView
{
@private
    ImageTitleButton *_editAction;
}

- (void)setConfigureTypeBgColor:(UIColor *)color;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通访问权限设置

@interface RTPartnerAuthorSettingView : RTBaseView
{
@private
    ImageTitleButton *_authOAction;
}
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通添加文档

@interface RTPartnerAddDocsView : RTBaseView
{
@private
    ImageTitleButton *_addAction;
    RTBaseModel *_baseModel;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通关系

@interface RTPartnerRelationView : RTBaseView
{
    @protected
    // 背景
    UIImageView *_bgImg;
    // 选择状态
    RTPartnerLeftView *_leftView;
    // 关系
    UILabel *_labRelation;
    // 编辑
    ImageTitleButton *_editAction;
    // 扩展
    UIImageView *_accessIcon;
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通关系密档说明

@interface RTPartnerSecretInfoView : RTBaseView
{
@protected
    UILabel  *_topTitle;
    UIImageView *_bgImg;
    UILabel *_btmTitle;
    UIImageView *_leftIcon;
    UIImageView *_rightIcon;
    id<RTFormProtocol> _fileInfo;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通关系密档

@interface RTFormSecretView : RTBaseView
{
   @protected
    RTPartnerSecretInfoView *_secretInfo;
    UILabel *_secretCard;
    id<RTFormProtocol> _fieldInfo;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通关系合伙人名片

@interface RTPartnerInfoView : RTBaseView
{
@protected
    // 白色背景
    UIView *_infoBgView;
    // 合伙人
    UIImageView *_icon;
    //
    ImageTitleButton *_rgTitle;
    // 开展地区
    UILabel *_rgArea;
    // 交易模式
    UILabel *_rgTrading;
    // 交易限时
    ImageTitleButton *_rgTradeTime;
    // 简介关系
    UITextView *_partnerDes;
    // 详细介绍
    UITextView *_partnerDes2;
    // 权限设置
    ImageTitleButton *_visibleSetting;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通密档附件上传 基础样式

@interface RTFormSecretAttachmentUploadFile : RTBaseView
{
   @protected
    UIImageView *_bgImg;
    UIImageView *_uploadIcon;
    UIImageView *_uploadSmallIcon;
    UITextView  *_titleView;
    RTPartnerEditView *_editView;
    @protected
    UITextView  *_subTitleView;
    UILabel     *_uploadTime;
    UILabel     *_uploadAuthor;
    UILabel     *_uploadTitle;
    RTLabelAndIconModel *_baseModel;
}
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通密档附件上传 样式2

@interface RTFormSecretAttachment2UploadFile : RTFormSecretAttachmentUploadFile
{
   @protected
    UILabel *_labTop;
    RTPartnerAuthorSettingView *_visibleSetting;
    @private
    ImageTitleButton *_uploadIconAdd;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通密档附件上传类型2

@interface RTFormSecretAttachmentUploadFile2 : RTBaseView
{
@protected
     RTPartnerEditView *_deleteView;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通密档附件容器

@interface RTFormSecretAttachment : RTBaseView
{
    @protected
    RTFormFieldView *_fieldView;
    RTFormSecretAttachmentUploadFile *_uploadFile;
    RTPartnerAuthorSettingView *_authorView;
    @private
    RTBaseModel *_baseModel;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通密档附件容器 2-3-1 密档x号

@interface RTFormSecretAttachmentStyle2 : RTBaseView
{
@protected
    UIView *_bgBlackView;
    UILabel *_left;
    UIButton *_numBtn;
    UILabel *_right;
@protected
    UIView *_bgView;
    RTFormTextView *_fieldView;
    RTFormSecretAttachment2UploadFile *_uploadFile;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通密档附件容器 2-3

@interface RTFormSecretAttachmentStyle3 : RTBaseView
{
@protected
    UIView *_bgView;
    RTFormFieldView *_fieldView;
    RTPartnerAuthorSettingView *_authorView;
    RTPartnerAddDocsView   *_addDoc;
}
@end



///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通密档类型2

@interface RTFormSecretStyle2 : RTBaseView
{
   @protected
    RTFormSecretView *_secretInfo;
    
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 容通密档类型3

@interface RTFormSecretStyle3 : RTBaseView {
    @protected
    UIView      *_bgView;
    UITextView  *_leftView;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象半透明图

@interface RTFormFieldAlphaTopView : RTBaseView {
    @protected
    UIView *_bgView;
    UILabel *_labTitle;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象 运营合伙人具备:场地 设备

@interface RTFormFieldAlphaBottomView : RTBaseView {
    @protected
    UIView *_bgView;
    UITextView *_leftText;
    UIImageView *_accessImg;
    RTPartnerEditView *_editView;
    ImageTitleButton *_visibleSetting;
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象 运营合伙人 资本密档 公共头部卡

@interface RTFormCommonSecretTopView : RTBaseView {
@protected
    UIView      *_topBgView;
    UILabel     *_topLabel;
    RTFormSecretView *_secretView;
    UILabel     *_secretBtmLabel;
    @private
     RTBaseModel<RTFormViewProtocol> *_baseModel;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象 运营合伙人信息卡片

@interface RTFormFieldProfileCardView : RTBaseView {
    @protected
    UIImageView *_icon;
    UIImageView *_smallIcon;
    UILabel *_labTitle;
    UITextView  *_subText;
    UIImageView *_accessImg;
    RTPartnerEditView *_editView;
    
    UIButton *_detail;
    UILabel *_labProfile;
    UILabel *_labProfileTime;
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象 运营合伙人信息卡片 底部设置条形卡

@interface RTFormFieldTipCardView : RTBaseView {
   @protected
    UIView     *_bgView;
    UIButton   *_lBtn;
    UITextView *_rTextView;
}

@end

