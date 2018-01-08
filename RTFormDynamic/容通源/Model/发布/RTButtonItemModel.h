//
//  RTButtonItemModel.h
//  darongtong
//
//  Created by zy on 2017/12/13.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 标题 + 选择状态
#import "RTLabelAndIconModel.h"
#import "RTFormProtocol.h"
@interface RTButtonItemModel : RTLabelAndIcon3Model<RTFormRowProtocol,RTFormSubButtonsProtocol>
{
    @protected
    BOOL        _isSelected;
}
@property (nonatomic,assign) BOOL isSelected;
@end
