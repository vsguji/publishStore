//
//  RTLiveListModel.m
//  darongtong
//
//  Created by zy on 2017/8/25.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTLiveListModel.h"

@implementation RTTrades

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"title":@"title",
             @"picUrl":@"pic"
             };
}
    
// 交易标的
+ (NSValueTransformer *)picUrlJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end


@implementation RTCoordinate2D

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"coor2D":@[@"lng",@"lat"],
             @"address":@"address"
             };
}

+ (NSValueTransformer *)coor2DJSONTransformer{
    return [MTLValueTransformer transformerUsingReversibleBlock:^id(NSDictionary *coordinateDict, BOOL *success, NSError *__autoreleasing *error) {
        NSAssert(coordinateDict.count == 2, @"地址信息不能为空");
#warning "lng" "lat"
        CLLocationDegrees latitude = [coordinateDict[@"lat"] doubleValue];
        CLLocationDegrees longitude = [coordinateDict[@"lng"] doubleValue];
        return [NSValue valueWithMKCoordinate:CLLocationCoordinate2DMake(latitude, longitude)];
    }];
}
    
@end

@implementation RTLiveListModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"live_id":@"live_id",
             @"customer_id":@"customer_id",
             @"videoState":@"status",
             @"channel_name":@"channel_name",
             @"channel_pic":@"channel_pic",
             @"views":@"views",
             @"thumbs_up_num":@"thumbs_up_num",
             @"cate_name":@"cate_name",
             @"type_name":@"type_name",
             @"type":@"type",
             @"dist":@"dist",
             @"headUrl":@"head_pic",
             @"nick_name":@"nick_name",
             @"timestring":@"timestring",
             @"in_level":@"in_level",
             @"onStatus":@"online_status",
             @"cate_icon":@"cate_icon",
             @"role_icon":@"role_icon",
             @"fans_num":@"fans_num",
             @"about_num":@"about_num",
             @"is_about":@"is_about",
             @"is_attention":@"is_attention",
             @"is_collect":@"is_collect",
             @"is_zan":@"is_zan",
             @"often_lng_lat":@"often_lng_lat",
             @"online_time":@"online_time",
             @"trades":@"trades",
             @"local_lng_lat":@"local_lng_lat"
            };
}

    
#pragma mark - 视频状态
    
+ (NSValueTransformer *)videoStateJSONTransformer{
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @"0":@(kVideo_Live_0),
                                                                           @"1":@(kVideo_Live_1),
                                                                           @"2":@(kVideo_Live_2),
                                                                           @"3":@(kVideo_Live_3)
                                                                           }];

}
 

//#pragma mark - 是否显示
//    
//+ (NSValueTransformer *)in_levelJSONTransformer {
//    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
//                                                                           @"0":@(kVisible_0),
//                                                                           @"1":@(kVisible_1),
//                                                                           }];
//}
    
#pragma mark - 在线状态
    
+ (NSValueTransformer *)onStatusJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @"1":@(kOnLine_State_1),
                                                                           @"2":@(kOnLine_State_2),
                                                                           @"3":@(kOnLine_State_3),
                                                                           @"4":@(kOnLine_State_4)
                                                                           }];
}
    
#pragma mark - 头像
    
+ (NSValueTransformer *)headUrlJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}
 
#pragma mark - 交易标的
    
+ (NSValueTransformer *)tradesJSONTransformer{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTTrades class]];
}
 
#pragma mark - 经常地址
    
+ (NSValueTransformer *)often_lng_latJSONTransformer{
   return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTCoordinate2D class]];
}
    
#pragma mark - 当前地址
    
+ (NSValueTransformer *)local_lng_latJSONTransformer{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTCoordinate2D class]];
}
    
@end


@implementation RTLiveVodModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"create_time":@"create_time",
             @"duration":@"duration",
             @"file_id":@"file_id",
             @"file_format":@"file_format",
             @"file_size":@"file_size",
             @"views":@"views",
             @"vodIcon":@"image_url",
             @"vodUrl":@"video_url",
             @"room_id":@"room_id",
             @"video_id":@"video_id",
             @"channel_id":@"channel_id",
             @"channel_name":@"channel_name",
             @"modelId":@"id",
             @"live_id":@"live_id"
             };
}

#pragma mark - 点播缩略图

+ (NSValueTransformer *)vodIconJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

#pragma mark - 点播地址

+ (NSValueTransformer *)vodUrlJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}
@end


