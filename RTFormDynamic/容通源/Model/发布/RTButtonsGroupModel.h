//
//  RTGroupModel.h
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 文本 + 组织机构类型
#import "RTLabelAndIconModel.h"
#import "RTButtonItemModel.h"
#import "RTFormProtocol.h"

///////////////////////////////////////////////////////////////////////////////////
//  表单头样式2: 类型选择
@interface RTButtonsGroupModel : RTLabelAndIcon2Model<RTFormViewProtocol>
{
    /**Elments*/
    @protected
    NSString          *_itemTitle;
    BOOL               _layoutDirection; // Yes默认水平
    NSInteger          _layoutNumOfRows;
    NSArray<RTButtonItemModel*> *_items;
}

/**Attribute*/
@property (nonatomic,copy) NSString *itemTitle;
@property (nonatomic,assign) BOOL layoutDirection;
@property (nonatomic,assign) NSInteger layoutNumOfRows;
@property (nonatomic,strong) NSArray<RTButtonItemModel*> *items;
@end


///////////////////////////////////////////////////////////////////////////////////
//  表单头样式2: 合伙合作方式
@interface  RTFormButtonsGroupModel:RTLabelAndIcon2Model<RTFormViewProtocol>
{
}
@property (nonatomic,strong) NSArray<RTButtonsGroupModel *> *ways;
@end

///////////////////////////////////////////////////////////////////////////////////
//  表单头样式3
@interface RTFormSectionHeaderModel:RTLabelAndIcon3Model<RTFormSectionProtocol>
@end




