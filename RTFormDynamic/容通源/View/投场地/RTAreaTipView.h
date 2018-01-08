//
//  RTAreaTipView.h
//  darongtong
//
//  Created by zy on 2018/1/4.
//  Copyright © 2018年 darongtong. All rights reserved.
//
// 可投场地
#import "RTBaseView.h"
#import "RTPartnerTipView.h"

@class RTCommonAreaView;
///////////////////////////////////////////////////////////////////////////////////////////////////////
// 公共分区

@interface RTCommonTipSectionView: RTBaseView
{
@protected
    // 编辑
    ImageTitleButton *_editAction;
    // 扩展
    UIImageView *_accessIcon;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 场地条件;设施条件

@interface RTAreaTipSectionView : RTCommonTipSectionView
{
    @protected
    ImageTitleButton *_leftView;
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 场地白卡;设备白卡

@interface RTAreaTipCardView : RTBaseView
{
    @protected
    UIView *_bgView;
    RTCommonAreaView *_areaView;
}
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 地理位置

@interface RTCommonAreaView : RTBaseView
{
    @protected
    ImageTitleButton *_location;
    UITextView       *_locationText;
    UIView           *_area;
    UILabel          *_areaLab;
    ImageTitleButton *_centerRange;
    UIImageView      *_areaImg;
    UIView           *_latitude;
    UILabel          *_latitudeValue;
    UILabel          *_radius;
}
@end




///////////////////////////////////////////////////////////////////////////////////////////////////////
// 场地条件

@interface RTAreaTipView : RTBaseView
{
    @protected
    RTAreaTipSectionView *_sectionView;
    RTAreaTipCardView *_cardView;
}
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 场地密档

@interface RTFormAreaSecretAttachment : RTBaseView
{
@protected
    UIView *_bgView;
    RTFormTextView *_fieldView;
    RTFormFieldView *_fieldLimit;
    RTFormSecretAttachment2UploadFile *_uploadFile;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 场地密档容器

@interface RTAreaTipSecretInfoView : RTBaseView
{
    @protected
    RTFormCommonSecretTopView *_secretTopView;
    RTFormAreaSecretAttachment *_secretAttachment;
}
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 要求具备场地条件

@interface  RTFormAreaConditionCommonView : RTBaseView
{
@protected
    UITextView   *_topText;
}
@end

@interface  RTFormAreaConditionStyle1View : RTFormAreaConditionCommonView
{
@protected
    ImageTitleButton  *_sCheck;
    ImageTitleButton  *_fCheck;
}

@end

@interface  RTFormAreaConditionStyle2View : RTFormAreaConditionCommonView
{
@protected
    UIButton  *_sSwitch;
    UIButton  *_fSwitch;
}

@end

@interface  RTFormAreaConditionStyle3View : RTFormAreaConditionCommonView
{
@protected
    UILabel *_btmLabel;
}

@end

@interface  RTFormAreaConditionView : RTFormAreaConditionCommonView
{
    @protected
    UIView *_bgView;
    // 要求被投资本对象填报
    RTFormAreaConditionStyle1View *_style1View;
    UIView          *_line1;
    // 是否有最低限
    RTFormAreaConditionStyle2View *_style2View;
    UIView          *_line2;
    // 货币投资人自已填写要求,被投资对象所具备最低限是多少
    RTFormAreaConditionStyle3View *_style3View;
    @private
    UIButton *_checkStatus;
    UIView  *_line3;
    UIButton *_lowLimit;
    
}

@end
