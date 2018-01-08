//
//  RTLabelAndField.h
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 标题 + 文本框
#import "RTBaseModel.h"
#import "RTFormProtocol.h"
#import "RTLabelAndIconModel.h" // lipeng 2017.12.20
#import "RTButtonItemModel.h"
typedef enum : NSUInteger {
    kFiedlTopPositionLeft = 0,
    kFiedlTopPositionMiddle,
    kFiedlTopPositionRight,
    kFiedlTopPositionLeftOffSet
} kFiedlTopPosition;

@class RTFieldAndGroupModel;
@class RTTitleAndFieldsModel;
///////////////////////////////////////////////////////////////////////////////////////////////////////
// 基础样式: 标题 + 文本框

@interface RTLabelAndFieldModel : RTBaseModel<RTFormFieldProtocol,RTFormRowProtocol>
{
    /**Elements*/
    @protected
    /*标题*/
    NSString *_labTitle;
    /*文本框*/
    NSString *_fieldLeftStr;
    NSString *_fieldLeftIcon;
    NSString *_fieldPlaceholder;
    NSString *_fieldRightStr;
    NSString *_fieldRightIcon;
    NSNumber *_fieldIsAccessView;
    NSNumber *_fieldIsAttri;
    BOOL      _fieldBtmLineVisbile;
   // kFiedlTopPosition _fieldPosition; // 标题位置
    @private
    CGFloat _attriStart;
    CGFloat _attriWidth;
    CAShapeLayer *_bgLayer;
}

/**Attribute*/
@property (nonatomic,copy) NSString *labTitle;
@property (nonatomic,copy) NSString *fieldLeftStr;
@property (nonatomic,copy) NSString *fieldLeftIcon;
@property (nonatomic,copy) NSString *fieldPlaceholder;
@property (nonatomic,copy) NSString *fieldRightStr;
@property (nonatomic,copy) NSString *fieldRightIcon;
@property (nonatomic,copy) NSNumber *fieldIsAccessView;
@property (nonatomic,copy) NSNumber *fieldIsAttri;
@property (nonatomic,assign) BOOL fieldBtmLineVisbile;
@property (nonatomic,assign) kFiedlTopPosition fieldPosition;
@property (nonatomic,copy) NSString *attriStr;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 标题 + 文本框 样式2

@interface RTLabelAndField2Model : RTLabelAndFieldModel<RTFormFieldProtocol>

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 标题 + 文本框 样式3 (财务报表及做账凭证)

@interface RTLabelAndField3Model : RTLabelAndFieldModel<RTFormViewProtocol,RTFormRowProtocol>
@property (nonatomic,strong) NSArray <RTLabelAndIcon4Model *> *items;
@property (nonatomic,copy) NSString *labDetail;
@property (nonatomic,assign) BOOL     labDetailStatus;
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 多选文本框 样式1

@interface RTLabelAndFieldModels: RTBaseModel<RTFormFieldsProtocol>
@property (nonatomic,strong) NSArray <RTLabelAndFieldModel*> *fields;
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 多选文本框 样式2

@interface RTLabelAndFieldModels2: RTBaseModel<RTFormFieldsProtocol>
@property (nonatomic,strong) NSArray <RTLabelAndFieldModel*> *fields2;
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 多选文本框 样式3

@interface RTLabelAndFieldModels3: RTBaseModel<RTFormFieldsProtocol>
@property (nonatomic,strong) NSArray <RTFieldAndGroupModel*> *fields3;
@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 标题 + 多级文本框 样式4

@interface RTLabelAndFieldModels4: RTBaseModel<RTFormFieldsProtocol,RTFormRowProtocol>
@property (nonatomic,strong) NSArray <RTTitleAndFieldsModel*> *fields4;
@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 文本框内部嵌套 主题+详情

@interface RTLabelAndTextModel:RTLabelAndFieldModel {
    @protected
    NSArray <RTLabelAndIconModel *> *_items;
}
@property (nonatomic,strong) NSArray <RTLabelAndIconModel *> *items;

@end

///////////////////////////////////////////////////////////////////////////////////////////////////////
// 文本框内部嵌套 媒体元素

@interface RTLabelAndMediaModel:RTLabelAndFieldModel {
@protected
    NSArray <RTLabelAndIcon2Model *> *_items;
}
@property (nonatomic,strong) NSArray <RTLabelAndIcon2Model *> *items;

@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 文本框内部嵌套 多个按钮

@interface RTFieldAndGroupModel:RTLabelAndFieldModel<RTFormViewProtocol,RTFormRowProtocol> {
@protected
    NSArray <RTButtonItemModel *> *_items;
}
@property (nonatomic,strong) NSArray <RTButtonItemModel *> *items;

- (NSAttributedString *)bothAttriTitle;

@end


///////////////////////////////////////////////////////////////////////////////////////////////////////
// 标题 + 多级文本框

@interface RTTitleAndFieldsModel:RTLabelAndFieldModel<RTFormViewProtocol,RTFormRowProtocol> {
@protected
    NSArray <RTLabelAndFieldModel *> *_items;
}
@property (nonatomic,strong) NSArray <RTLabelAndFieldModel *> *items;

- (NSAttributedString *)bothAttriTitle;

@end


