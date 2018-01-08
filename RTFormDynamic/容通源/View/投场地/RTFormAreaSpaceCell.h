//
//  RTFormAreaCell.h
//  darongtong
//
//  Created by zy on 2018/1/4.
//  Copyright © 2018年 darongtong. All rights reserved.
//
// 具备场地
#import "RTBaseCell.h"
#import "RTAreaTipView.h"
////////////////////////////////////////////////////////////////////////////
// 具备场地条件

@interface RTFormAreaSpaceCell : RTBaseCell<RTFormViewDynamicDelegate>
{
    
}
@end

@interface RTFormAreaConditionSecretCell : RTBaseCell<RTFormViewDynamicDelegate>
{
    @protected
    RTAreaTipSecretInfoView *_secretView;
    RTPartnerAddDocsView *_addDoc;
}
@end


@interface RTFormAreaCommonAddCell : RTBaseCell<RTFormViewDynamicDelegate>
{
@protected
    RTPartnerAddDocsView *_addDoc;
}
@end

////////////////////////////////////////////////////////////////////////////
// 具备设施设备

@interface RTFormAreaDeviceCell : RTBaseCell
{
    @protected
    RTAreaTipView *_areaTipView;
    ImageTitleButton *_addOtherArea;
}
@end
