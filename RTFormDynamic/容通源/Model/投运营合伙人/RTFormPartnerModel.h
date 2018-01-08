//
//  RTFormPartnerModel.h
//  darongtong
//
//  Created by zy on 2017/12/16.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 投资运营合伙人
#import "RTLabelAndIconModel.h"
@interface RTFormPartnerModel : RTLabelAndIconModel
{
    @protected
    NSArray *_items;
}

@property (nonatomic,strong) NSArray <RTLabelAndIcon3Model *> *items;

@end


/////////////////////////////////////////////////////////////////////////////////////////
// 地理位置,圈子范围

@interface RTFormPartnerAreaModel : RTLabelAndIconModel
{
    
}
@end


/////////////////////////////////////////////////////////////////////////////////////////
// 地理位置,圈子范围数组

@interface RTFormPartnerAreasModel : RTLabelAndIconModel<RTFormViewProtocol>
{
    
}
@property (nonatomic,copy) NSArray <RTFormPartnerAreaModel *> *items;
@end
