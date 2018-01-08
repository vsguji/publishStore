//
//  RTFormAreaModel.h
//  darongtong
//
//  Created by zy on 2018/1/4.
//  Copyright © 2018年 darongtong. All rights reserved.
//
// 场地条件
#import "RTBaseModel.h"
#import "RTLiveListModel.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
// 场地条件
@interface RTFormAreaModel : RTBaseModel
// 场地名称
@property (nonatomic,copy) NSString *name;
// 场地权益
@property (nonatomic,copy) NSString *belong;
// 场地原用途
@property (nonatomic,copy) NSString *oldUse;
// 场地用途所属行业
@property (nonatomic,copy) NSString *industry;
// 场地面积区间段
@property (nonatomic,copy) NSString *areas;
// 场地具体面积
@property (nonatomic,copy) NSString *totalAreas;
// 具体位置 && 经纬度
@property (nonatomic,copy) RTCoordinate2D *often_lng_lat;

@end




