//
//  RTFormFieldCell.h
//  darongtong
//
//  Created by zy on 2017/12/11.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 文本框 单元格

#import "RTBaseCell.h"

/////////////////////////////////////////////////////////////////////////////////////////////////////
// 基本文本框表单

@interface RTFormFieldCell : RTBaseCell
{
    @protected
    UIView *_bgView;
    
}
@end

/////////////////////////////////////////////////////////////////////////////////////////////////////
// 基本文本框表单 样式2

@interface RTFormFieldStyle2Cell : RTBaseCell
{
@protected
    UIView *_bgView;
    
}
@end


/////////////////////////////////////////////////////////////////////////////////////////////////////
// 基本文本框表单 样式3

@interface RTFormFieldStyle3Cell : RTBaseCell
{
@protected
    UILabel *_fieldTop;
    UIView *_bgView;
    
}
@end
