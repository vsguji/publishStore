//
//  RTFormBriefModel.h
//  darongtong
//
//  Created by zy on 2017/12/20.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 简介
#import "RTLabelAndIconModel.h"
#import "RTLabelAndFieldModel.h" // lipeng 2017.12.20
#import "RTLabelAndIconAttriModel.h"

//////////////////////////////////////////////////////////////////////////////////////////////////
// 简介
@interface RTFormBriefModel : RTLabelAndIconModel<RTFormViewProtocol>
{
}
@property (nonatomic,strong) NSArray <RTLabelAndFieldModel *> *items;
@end

//////////////////////////////////////////////////////////////////////////////////////////////////
// 容通值·创业气象

@interface RTFormCapacitiveModel : RTLabelAndIconAttriModel<RTFormViewProtocol>
@property (nonatomic,copy) RTLabelAndIcon3Model *capacitiveHeader;
@property (nonatomic,strong) NSArray <RTBaseModel *> *items;
@property (nonatomic,copy) RTLabelAndIcon3Model *capacitiveFooter;
@end


//////////////////////////////////////////////////////////////////////////////////////////////////
// 容通值·创业气象 资本 + 密档 (有形资本)

@interface RTFormCapitalModel : RTLabelAndIconAttriModel <RTFormViewProtocol>
@property (nonatomic,copy) RTLabelAndIcon5Model *capitalHeader;
@property (nonatomic,strong) NSArray <RTBaseModel *> *items;
@property (nonatomic,copy) RTLabelAndIcon4Model *capitalFooter;
@end


//////////////////////////////////////////////////////////////////////////////////////////////////
// 容通值·创业气象 资本 + 密档 (无形资本)

@interface RTFormInvisibleCapitalModel : RTLabelAndIconAttriModel <RTFormViewProtocol>
@property (nonatomic,copy) RTLabelAndIcon5Model *capitalHeader;
@property (nonatomic,strong) NSArray <RTBaseModel *> *items;
@property (nonatomic,copy) RTLabelAndIcon3Model *capacitiveFooter;
@end


//////////////////////////////////////////////////////////////////////////////////////////////////
// 容通值·创业气象合同

@interface RTFormCapacitivePartTwoModel : RTLabelAndIconAttriModel<RTFormViewProtocol>
@property (nonatomic,copy) RTLabelAndIcon3Model *capacitiveHeader;
@property (nonatomic,strong) NSArray <RTBaseModel *> *items;
@property (nonatomic,copy) RTLabelAndIcon3Model *capacitiveFooter;
@end


//////////////////////////////////////////////////////////////////////////////////////////////////
// 容通值·创业气象财务报表

@interface RTFormCapacitivePartThreeModel : RTLabelAndIconAttriModel<RTFormViewProtocol>
@property (nonatomic,copy) RTLabelAndIcon3Model *capacitiveHeader;
@property (nonatomic,strong) NSArray <RTBaseModel *> *items;
@property (nonatomic,copy) RTLabelAndIcon3Model *capacitiveFooter;
@end


///////////////////////////////////////////////////////////////////////////////////////////////////
// 场地密档

@interface RTFormAreaCapitalModel : RTLabelAndIconAttriModel <RTFormViewProtocol>
@property (nonatomic,copy) RTLabelAndIcon5Model *capitalHeader;
@property (nonatomic,strong) NSArray <RTBaseModel *> *items;
@property (nonatomic,copy) RTLabelAndIcon3Model *capacitiveFooter;
@end

//////////////////////////////////////////////////////////////////////////////////////////////////
// 发布 && 保存
@interface RTFormBottomButtonsModel : RTBaseModel<RTFormViewProtocol>
@property (nonatomic,strong) NSArray <RTLabelAndIconModel *> *items;
@end


//////////////////////////////////////////////////////////////////////////////////////////////////
// 添加其它号场地
@interface RTFormCommonAddAreaModel : RTBaseModel<RTFormViewProtocol>
@property (nonatomic,strong) NSArray <RTLabelAndIconModel *> *items;
@end
