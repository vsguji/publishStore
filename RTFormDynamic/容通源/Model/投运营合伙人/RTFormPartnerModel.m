//
//  RTFormPartnerModel.m
//  darongtong
//
//  Created by zy on 2017/12/16.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTFormPartnerModel.h"

@implementation RTFormPartnerModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labStr":@"labStr",
             @"labIcon":@"labIcon",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr",
             @"items":@"items"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

@end

@implementation RTFormPartnerAreasModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"items":@"items",
             @"labStr":@"labStr"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
     return [MTLJSONAdapter arrayTransformerWithModelClass:[RTFormPartnerAreaModel class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

- (NSString *)rowString {
    return self.labStr ? self.labStr  : @"";
}
@end


@implementation RTFormPartnerAreaModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

@end


