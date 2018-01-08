//
//  RTBaseModel+RTFormTableCell.h
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 投模型UI
#import "RTBaseModel.h"
#import "RTCellProtocal.h"

#import "RTLabelAndIconModel.h"
#import "RTLabelAndFieldModel.h"
#import "RTButtonItemModel.h"
#import "RTButtonsGroupModel.h"
#import "RTFormPartnerModel.h"
#import "RTBriefModel.h"


@interface RTBaseModel (RTFormTableCell)

// 单元样式
- (UITableViewCell<RTCellProtocal> *)formTableView:(UITableView *)tableView modelStyle:(RTBaseModel *)cellStyle;

// 单元高度
- (CGFloat)formTableViewHeight;

// 分区总数
- (NSInteger)formTableViewSections;

// 分区标题
- (NSString *)formTableViewSectionTitle;

// 水平间距
- (CGFloat)horizontalMargin;

// 垂直间距
- (CGFloat)verticalMargin;

// 顶部间距
- (CGFloat)topMargin;

// 底部间距
- (CGFloat)bottomMargin;

@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 运营合伙人

@interface RTFormPartnerModel (RTFormTableCell)
@end

////////////////////////////////////////////////////////////////////////////////////////////////
//

@interface RTLabelAndIconModel (RTFormTableCell)
@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 单体文本框

@interface RTLabelAndFieldModel (RTFormTableCell)

@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 多个文本框

@interface RTLabelAndFieldModels (RTFormTableCell)
@end

@interface RTLabelAndFieldModels2 (RTFormTableCell)
@end

@interface RTLabelAndFieldModels3 (RTFormTableCell)
@end

@interface RTLabelAndFieldModels4 (RTFormTableCell)
@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 文本框 + 多个按钮组合

@interface RTFieldAndGroupModel (RTFormTableCell)
@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 多个按钮总和

@interface RTFormButtonsGroupModel (RTFormTableCell)<RTFormRowProtocol>
@end


////////////////////////////////////////////////////////////////////////////////////////////////
// 多个按钮

@interface RTButtonsGroupModel (RTFormTableCell)
@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 单个按钮

@interface RTButtonItemModel (RTFormTableCell)
@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 表头样式2

@interface RTFormSectionHeaderModel (RTFormTableCell)
@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 地理位置,圈子范围数组

@interface RTFormPartnerAreasModel (RTFormTableCell)
@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 地理位置,圈子范围

@interface RTFormPartnerAreaModel (RTFormTableCell)
@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 推广范围

@interface RTFormBriefModel (RTFormTableCell)
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 文本框内部嵌套

@interface RTLabelAndTextModel (RTFormTableCell)
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象

@interface RTFormCapacitiveModel (RTFormTableCell)
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象 上下游合同

@interface RTFormCapacitivePartTwoModel (RTFormTableCell)
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象 财务报表

@interface RTFormCapacitivePartThreeModel (RTFormTableCell)
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象 资本+密档 (有形资本)

@interface RTFormCapitalModel (RTFormTableCell)
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 创业气象 资本+密档 (无形资本)

@interface RTFormInvisibleCapitalModel (RTFormTableCell)
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 表单页尾

@interface RTFormBottomButtonsModel (RTFormTableCell)
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 具备场地条件

@interface RTAreaCondition (RTFormTableCell)
@end

@interface RTFormAreaCapitalModel (RTFormTableCell)
@end

@interface RTFormCommonAddAreaModel (RTFormTableCell)
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 具备设施设备条件

@interface RTAreaDevicesCondition (RTFormTableCell)
@end
