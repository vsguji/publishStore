//
//  RTFormBriefModel.m
//  darongtong
//
//  Created by zy on 2017/12/20.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTBriefModel.h"
#import "RTLabelAndFieldModel.h"

@implementation RTFormBriefModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"items":@"items"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:value.count];
        for (NSDictionary *modelDic in value) {
            RTBaseModel *transformModel = nil;
            NSError *error = nil;
            if ([modelDic[@"modelType"] isEqualToString:@"RTFormFieldsBrief5"]) {
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndTextModel class] fromJSONDictionary:modelDic error:&error];
            }
            else if ([modelDic[@"modelType"] isEqualToString:@"RTFormBriefTop"]){
                 transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndIconModel class] fromJSONDictionary:modelDic error:&error];
            }
            else if ([modelDic[@"modelType"] isEqualToString:@"RTFormBriefBottom"]){
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndIconModel class] fromJSONDictionary:modelDic error:&error];
            }
            else{
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndFieldModel class] fromJSONDictionary:modelDic error:&error];
            }
            if (error == nil && transformModel) {
                [modelArray addObject:transformModel];
            }
        }
        return modelArray;
    }];
}

- (NSArray *)groupItems{
    return self.items ? self.items : @[];
}

@end



@implementation RTFormCapacitiveModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labStr":@"labStr",
             @"labIcon":@"labIcon",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr",
             @"centerIcon":@"centerIcon",
             @"rightDetail":@"rightDetail",
             @"capacitiveHeader":@"capacitiveHeader",
             @"items":@"items",
             @"capacitiveFooter":@"capacitiveFooter"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:value.count];
        for (NSDictionary *modelDic in value) {
            RTBaseModel *transformModel = nil;
            NSError *error = nil;
            if ([modelDic[@"modelType"] isEqualToString:@"RTFormSubCapacitivePartField1"]) {
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndField3Model class] fromJSONDictionary:modelDic error:&error];
            }
            else if ([modelDic[@"modelType"] isEqualToString:@"RTFormSubCapacitivePartField2"]){
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndIcon2Model class] fromJSONDictionary:modelDic error:&error];
            }
            if (error == nil && transformModel) {
                [modelArray addObject:transformModel];
            }
        }
        return modelArray;
    }];
}


+ (NSValueTransformer *)capacitiveHeaderJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

+ (NSValueTransformer *)capacitiveFooterJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

@end

@implementation RTFormCapitalModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labStr":@"labStr",
             @"labIcon":@"labIcon",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr",
             @"leftDetail":@"leftDetail",
             @"centerIcon":@"centerIcon",
             @"rightDetail":@"rightDetail",
             @"capitalHeader":@"capitalHeader",
             @"items":@"items",
           //  @"capitalFooter":@"capitalFooter"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:value.count];
        for (NSDictionary *modelDic in value) {
            RTBaseModel *transformModel = nil;
            NSError *error = nil;
            if ([modelDic[@"modelType"] isEqualToString:@"RTFormSubCapitalButtonTip"]){
                transformModel = [MTLJSONAdapter modelOfClass:[RTButtonItemModel class] fromJSONDictionary:modelDic error:&error];
            }
            else{
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndIcon4Model class] fromJSONDictionary:modelDic error:&error];
            }
            if (error == nil && transformModel) {
                [modelArray addObject:transformModel];
            }
        }
        return modelArray;
    }];
   // return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndIcon4Model class]];
}

+ (NSValueTransformer *)capitalHeaderJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon5Model class]];
}

+ (NSValueTransformer *)capitalFooterJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon4Model class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

@end


@implementation RTFormInvisibleCapitalModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labStr":@"labStr",
             @"labIcon":@"labIcon",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr",
             @"leftDetail":@"leftDetail",
             @"centerIcon":@"centerIcon",
             @"rightDetail":@"rightDetail",
             @"capitalHeader":@"capitalHeader",
             @"items":@"items",
             @"capacitiveFooter":@"capacitiveFooter"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:value.count];
        for (NSDictionary *modelDic in value) {
            RTBaseModel *transformModel = nil;
            NSError *error = nil;
            if ([modelDic[@"modelType"] isEqualToString:@"RTFormInvisibleCapacitiveItemOne"]) {
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndField2Model class] fromJSONDictionary:modelDic error:&error];
            }
            else if ([modelDic[@"modelType"] isEqualToString:@"RTFormInvisibleCapacitiveItemTwo"]){
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndIcon5Model class] fromJSONDictionary:modelDic error:&error];
            }
            if (error == nil && transformModel) {
                [modelArray addObject:transformModel];
            }
        }
        return modelArray;
    }];
}

+ (NSValueTransformer *)capitalHeaderJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon5Model class]];
}

+ (NSValueTransformer *)capacitiveFooterJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

@end


@implementation RTFormCapacitivePartTwoModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labStr":@"labStr",
             @"labIcon":@"labIcon",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr",
             @"leftDetail":@"leftDetail",
             @"centerIcon":@"centerIcon",
             @"rightDetail":@"rightDetail",
             @"capacitiveHeader":@"capacitiveHeader",
             @"items":@"items",
             @"capacitiveFooter":@"capacitiveFooter"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:value.count];
        for (NSDictionary *modelDic in value) {
            RTBaseModel *transformModel = nil;
            NSError *error = nil;
            if ([modelDic[@"modelType"] isEqualToString:@"RTFormSubCapacitivePartField1"]) {
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndField3Model class] fromJSONDictionary:modelDic error:&error];
            }
            else if ([modelDic[@"modelType"] isEqualToString:@"RTFormSubCapacitivePartField2"]){
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndIcon3Model class] fromJSONDictionary:modelDic error:&error];
            }
            if (error == nil && transformModel) {
                [modelArray addObject:transformModel];
            }
        }
        return modelArray;
    }];
}

+ (NSValueTransformer *)capacitiveHeaderJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

+ (NSValueTransformer *)capacitiveFooterJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

@end


@implementation RTFormCapacitivePartThreeModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labStr":@"labStr",
             @"labIcon":@"labIcon",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr",
             @"leftDetail":@"leftDetail",
             @"centerIcon":@"centerIcon",
             @"rightDetail":@"rightDetail",
             @"capacitiveHeader":@"capacitiveHeader",
             @"items":@"items",
             @"capacitiveFooter":@"capacitiveFooter"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndField3Model class]];
}

+ (NSValueTransformer *)capacitiveHeaderJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

+ (NSValueTransformer *)capacitiveFooterJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}
@end


@implementation RTFormAreaCapitalModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labStr":@"labStr",
             @"labIcon":@"labIcon",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr",
             @"leftDetail":@"leftDetail",
             @"centerIcon":@"centerIcon",
             @"rightDetail":@"rightDetail",
             @"capitalHeader":@"capitalHeader",
             @"items":@"items",
             @"capacitiveFooter":@"capacitiveFooter"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:value.count];
        for (NSDictionary *modelDic in value) {
            RTBaseModel *transformModel = nil;
            NSError *error = nil;
            if ([modelDic[@"modelType"] isEqualToString:@"RTFormAreaCapacitiveItemOne"]) {
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndField2Model class] fromJSONDictionary:modelDic error:&error];
            }
            else if ([modelDic[@"modelType"] isEqualToString:@"RTFormAreaCapacitiveItemTwo"]){
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndIcon5Model class] fromJSONDictionary:modelDic error:&error];
            }
            if (error == nil && transformModel) {
                [modelArray addObject:transformModel];
            }
        }
        return modelArray;
    }];
}

+ (NSValueTransformer *)capitalHeaderJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon5Model class]];
}

+ (NSValueTransformer *)capacitiveFooterJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

@end


@implementation RTFormBottomButtonsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
               @"modelType":@"modelType",
               @"items":@"items"
               };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndIconModel class]];
}

@end

@implementation RTFormCommonAddAreaModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"items":@"items"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndIcon3Model class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}
@end


