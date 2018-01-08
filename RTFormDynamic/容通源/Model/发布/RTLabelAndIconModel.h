//
//  RTLabelAndIcon.h
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 文本 + 图片
#import "RTBaseModel.h"
#import "RTFormProtocol.h"
#import "RTFormAreaModel.h"

////////////////////////////////////////////////////////////////////////////////////////////////
// 样式1
@interface RTLabelAndIconModel : RTBaseModel<RTFormProtocol,RTFormRowProtocol>
{
    /**Elements*/
    @protected
    // section
    NSString *_labStr;
    NSString *_labIcon;
    NSString *_labDetail;
    
    @private
    // 高亮
    NSString *_attriStr;
}

/**Attribute*/
@property (nonatomic,copy) NSString *labStr;
@property (nonatomic,copy) NSString *labIcon;
@property (nonatomic,copy) NSString *labDetail;
@property (nonatomic,copy) NSString *attriStr;

@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 样式2

@interface RTLabelAndIcon2Model : RTBaseModel
{
    /**Elements*/
@protected
    // section
    NSString *_labLIcon;
    NSString *_labRIcon;
    NSString *_labTitle;
    NSString *_labDetail;
@private
    // 高亮
    NSString *_attriStr;
}

/**Attribute*/
@property (nonatomic,copy) NSString *labLIcon;
@property (nonatomic,copy) NSString *labRIcon;
@property (nonatomic,copy) NSString *labTitle;
@property (nonatomic,copy) NSString *labDetail;
@property (nonatomic,copy) NSString *attriStr;

@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 样式3

@interface RTLabelAndIcon3Model : RTLabelAndIconModel
{
    /**Elements*/
@protected
    // section
    NSString *_labLIcon;
    NSString *_labRIcon;
    NSString *_labTitle;
}

/**Attribute*/
@property (nonatomic,copy) NSString *labLIcon;
@property (nonatomic,copy) NSString *labRIcon;
@property (nonatomic,copy) NSString *labTitle;

@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 样式4

@interface RTLabelAndIcon4Model : RTLabelAndIconModel
{
    /**Elements*/
    @protected
    NSString *_labTitle;
    NSString *_labDetail2;
    NSString *_attriStr2;
    @private
     CAShapeLayer *_bgLayer;
}

/**Attribute*/
@property (nonatomic,copy) NSString *labTitle;
@property (nonatomic,copy) NSString *labDetail2;
@property (nonatomic,copy) NSString *attriStr2;
@end


////////////////////////////////////////////////////////////////////////////////////////////////
// 样式5

@interface RTLabelAndIcon5Model : RTLabelAndIconModel<RTFormRowProtocol>
{
    /**Elements*/
@protected
    NSString *_labTitle;
    NSString *_labTitle2;
    NSString *_labDetail2;
    NSString *_attriStr2;
}

/**Attribute*/
@property (nonatomic,copy) NSString *labTitle;
@property (nonatomic,copy) NSString *labTitle2;
@property (nonatomic,copy) NSString *labDetail2;
@property (nonatomic,copy) NSString *attriStr2;
@end


////////////////////////////////////////////////////////////////////////////////////////////////
// 基于样式1 具备场地条件

@interface RTLabelAndIcon101Model:RTLabelAndIconModel<RTFormViewProtocol>
@property (nonatomic,strong) NSArray <RTBaseModel *> *items;
@end


@interface RTAreaCondition: RTLabelAndIconModel<RTFormViewProtocol>
@property (nonatomic,strong) NSArray<RTLabelAndIcon101Model *> *items;
@end


////////////////////////////////////////////////////////////////////////////////////////////////
// 基于样式1 具备设备条件

@interface RTAreaDevicesCondition: RTLabelAndIconModel<RTFormViewProtocol>
@property (nonatomic,strong) NSArray<RTLabelAndIcon101Model *> *items;
@end




