//
//  RTFormView.h
//  darongtong
//
//  Created by zy on 2017/12/11.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 表单控件
#import "RTBaseView.h"
#import "RTFormLabel.h"

@class RTPartnerEditView;
/////////////////////////////////////////////////////////////////////////////////////////
// 表单文本框顶部说明

@interface RTFormTopLabView : RTBaseView
{
@protected
    UILabel *_fieldTopLab;
    UIImageView *_btmLine;
    id<RTFormProtocol,RTFormRowProtocol,RTFormFieldsProtocol>_fieldInfo;
}
@end

/////////////////////////////////////////////////////////////////////////////////////////
// 解决 UITextField  多行显示

@interface RTFormFieldContentView:RTBaseView {
   @protected
    RTFormLabel *_fieldContentTitle;
    RTFormLabel *_fieldContentDetail;
    id<RTFormProtocol>_fieldInfo;
}
@end


/////////////////////////////////////////////////////////////////////////////////////////
// 调整UITextField Placeholder 偏上

@interface RTPlaceholderVerticalAlignment:UITextField
@end

/////////////////////////////////////////////////////////////////////////////////////////
// 表单文本框 (UITextField)

@interface RTFormFieldView : RTFormTopLabView
{
    @protected
    RTPlaceholderVerticalAlignment *_field;
}

@end


/////////////////////////////////////////////////////////////////////////////////////////
// 要求具备场地条件,设备条件 表单文本框 (UITextField)

@interface RTFormAreaCustomerFieldView : RTFormTopLabView
{
@protected
    UIView      *_topBgImg;
    RTPlaceholderVerticalAlignment *_field;
}

@end

/////////////////////////////////////////////////////////////////////////////////////////
// 要求具备场地条件 地图

@interface RTFormAreaMapView : RTFormTopLabView
{
@protected
    UIView      *_topBgImg;
    UIButton *_commit;
    UIButton *_reset;
    UIView *_line;
}

@end

/////////////////////////////////////////////////////////////////////////////////////////
// 表单文本框 (UITextField + UIButton)

@interface RTFormFieldAndButtonGroupView : RTFormFieldView
{
    @protected
    RTFormFieldView *_fieldView;
}

@end

/////////////////////////////////////////////////////////////////////////////////////////
// 表单文本框 (UITextView)

@interface RTFormTextView : RTFormTopLabView
{
@protected
    UILabel *_labTop;
    UITextView *_textView;
    RTPartnerEditView *_editView;
}

@end

/////////////////////////////////////////////////////////////////////////////////////////
// 表单按钮数组

@interface RTButtonGroupView : RTFormTopLabView<RTFormProtocol>
{
@protected
    NSArray *_fButtons;
    id<RTFormViewProtocol> _btnsProtocol;
//    UIImageView *_btmLine;
}

@end






