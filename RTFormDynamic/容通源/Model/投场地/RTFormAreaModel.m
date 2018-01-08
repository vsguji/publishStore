//
//  RTFormAreaModel.m
//  darongtong
//
//  Created by zy on 2018/1/4.
//  Copyright © 2018年 darongtong. All rights reserved.
//

#import "RTFormAreaModel.h"
#import "RTLabelAndIconModel.h"

@implementation RTFormAreaModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name":@"name",
             @"belong":@"belong",
             @"oldUse":@"oldUse",
             @"industry":@"industry",
             @"areas":@"areas",
             @"totalAreas":@"totalAreas",
             @"often_lng_lat":@"often_lng_lat"
             };
}


#pragma mark - 经常地址

+ (NSValueTransformer *)often_lng_latJSONTransformer{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTCoordinate2D class]];
}

@end
