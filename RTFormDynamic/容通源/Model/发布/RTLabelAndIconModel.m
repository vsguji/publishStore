//
//  RTLabelAndIcon.m
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTLabelAndIconModel.h"
#import "RTColor.h"
#import "RTBriefModel.h"
#import "ColorMacro.h"
#import "UtilsMacro.h"
@implementation RTLabelAndIconModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labStr":@"labStr",
             @"labIcon":@"labIcon",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr"
             };
}

- (NSString *)rowString{
    return self.labStr ?  self.labStr : @"";
}

- (NSAttributedString *)rowTitle {
    if (self.attriStr == nil || self.labStr == nil) return nil;
    @try{
        NSMutableAttributedString *titleAttri = [[NSMutableAttributedString alloc] initWithString:self.labStr attributes:@{NSForegroundColorAttributeName:kWhiteColor,NSFontAttributeName:FONT(LENGTH(12.))}];
        NSString *back = [self getAttriValueByIndex:0];
        if (back) {
            if ([back containsString:@","]) {
                NSArray *attriArray = [back componentsSeparatedByString:@","];
                for (NSString *str in attriArray) {
                    NSRange range = [self.labStr rangeOfString:str];
                    [titleAttri addAttributes:@{NSForegroundColorAttributeName:[RTColor rtBg4TypeColor]}
                                        range:NSMakeRange(range.location - 1, 1)];
                }
            }
        }
        return titleAttri;
    }
    @catch (NSException *e) {
        return  [[NSMutableAttributedString alloc] initWithString:self.labStr attributes:@{NSForegroundColorAttributeName:kWhiteColor}];
    }
   
    return nil;
}

- (NSString *)getAttriValueByIndex:(NSInteger)index {
    NSString *attris = self.attriStr;
    if (attris) {
        NSArray *attriRows = [attris componentsSeparatedByString:@";"];
        if (attriRows && attriRows.count > index) {
           return attriRows[index];
        }
    }
    return nil;
}

- (NSAttributedString *)rowDetail {
     if (self.attriStr == nil || self.labDetail == nil) return nil;
     NSMutableAttributedString *detailAttri = [[NSMutableAttributedString alloc] initWithString:self.labDetail attributes:@{NSForegroundColorAttributeName:kWhiteColor,NSFontAttributeName:FONT(LENGTH(12.))}];
     NSString *back = [self getAttriValueByIndex:1];
    if (back) {
        NSRange characterRange = [self.labDetail rangeOfString:back];
        [detailAttri addAttributes:@{NSForegroundColorAttributeName:[RTColor rtBg3TypeColor]} range:characterRange];
    }
    return detailAttri;
}

@end

@implementation RTLabelAndIcon2Model

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelId":@"modelId",
             @"modelType":@"modelType",
             @"labLIcon":@"labLIcon",
             @"labRIcon":@"labRIcon",
             @"labTitle":@"labTitle",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr"
             };
}

- (NSAttributedString *)rowTitle {
    if (self.attriStr == nil || self.labTitle == nil) return nil;
    NSMutableAttributedString *detailAttri = [[NSMutableAttributedString alloc] initWithString:self.labTitle attributes:@{NSForegroundColorAttributeName:kWhiteColor,NSFontAttributeName:FONT(LENGTH(12.))}];
    NSString *back = self.attriStr;
    if (back) {
        NSRange characterRange = [self.labTitle rangeOfString:back];
        if ([self.modelType isEqualToString:@"RTFormSubCapacitivePartField2"]) {
            [detailAttri addAttributes:@{NSForegroundColorAttributeName:[RTColor rtBg14TypeColor]} range:characterRange];
        }
        else {
            [detailAttri addAttributes:@{NSForegroundColorAttributeName:kRedColor} range:characterRange];
        }
    }
    return detailAttri;
}

@end


@implementation RTLabelAndIcon3Model
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelId":@"modelId",
             @"modelType":@"modelType",
             @"labIcon":@"labIcon",
             @"labStr":@"labStr",
             @"labLIcon":@"labLIcon",
             @"labRIcon":@"labRIcon",
             @"labTitle":@"labTitle",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr"
             };
}

- (NSAttributedString *)rowTitle {
    if (self.attriStr == nil || self.labTitle == nil) return nil;
    NSMutableAttributedString *detailAttri = [[NSMutableAttributedString alloc] initWithString:self.labTitle
                                                                                    attributes:@{
                                                                            NSForegroundColorAttributeName:kWhiteColor,
                                                                            NSFontAttributeName:FONT(LENGTH(14.))
                                                                            }];
    NSString *back = self.attriStr;
    if (back) {
        NSRange characterRange = [self.labTitle rangeOfString:back];
        if ([self.modelType isEqualToString:@"RTFormSubCapacitivePartField2"]) {
            [detailAttri addAttributes:@{NSForegroundColorAttributeName:[RTColor rtBg14TypeColor]} range:characterRange];
        }
        else {
           [detailAttri addAttributes:@{NSForegroundColorAttributeName:kRedColor} range:characterRange];
        }
    }
    return detailAttri;
}

@end


@implementation  RTLabelAndIcon4Model

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
            @"modelId":@"modelId",
             @"modelType":@"modelType",
             @"labIcon":@"labIcon",
             @"labStr":@"labStr",
             @"labTitle":@"labTitle",
             @"labDetail":@"labDetail",
             @"labDetail2":@"labDetail2",
             @"attriStr":@"attriStr",
             @"attriStr2":@"attriStr2"
             };
}

- (NSAttributedString *)rowTitle {
    UIFont *fontAttri = FONT(LENGTH(14.));
    if (self.labTitle) {
        NSMutableAttributedString *titleAttri = [[NSMutableAttributedString alloc] initWithString:self.labTitle
                                                                                       attributes:@{
                                                                            NSFontAttributeName:FONT(LENGTH(14.)),
                                                                            NSForegroundColorAttributeName:[RTColor rtBg11TypeColor]}];
        if (self.attriStr) {
            if ([self.attriStr rangeOfString:@";"].location != NSNotFound) {
                NSArray *attriArray = [self.attriStr componentsSeparatedByString:@";"];
                for (NSString *str in attriArray) {
                    if ([str isEqualToString:self.separateStr]) {
                        NSRange partRange = [self.labTitle rangeOfString:str];
                        [titleAttri addAttributes:@{NSFontAttributeName:FONT(LENGTH(12.)),NSForegroundColorAttributeName:kBlackColor} range:partRange];
                    }
                    else{
                        NSRange partRange = [self.labTitle rangeOfString:str];
                        [titleAttri addAttributes:@{NSFontAttributeName:FONT(LENGTH(12.)),NSForegroundColorAttributeName:kRedColor} range:partRange];
                    }
                }
            }
            else {
                if ([self.modelType isEqualToString:@"RTFormSubCapacitivePart3Field"]
                    || [self.modelType isEqualToString:@"RTFormSubCapacitivePart2Field"] ) {
                    // 区域背景色
                    NSRange characterAttriStrRange = [self.labTitle rangeOfString:self.attriStr];
                    [titleAttri addAttributes:@{NSFontAttributeName:fontAttri,NSForegroundColorAttributeName:[RTColor rtBg14TypeColor]}
                                        range:characterAttriStrRange];
                    // 添加文件单号布局
                    NSRange characterRange = [self.labTitle rangeOfString:self.attriStr2];
                    CGFloat attriStart = (characterRange.location) * (fontAttri.pointSize);
                    CGFloat attriWidth = (characterRange.length) * 12.;
                    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(attriStart , -1, attriWidth - 1, fontAttri.pointSize + 1)cornerRadius:attriWidth / 2];
                    CAShapeLayer *maskLayer = [CAShapeLayer layer];
                    maskLayer.frame = CGRectMake(0, 0, attriWidth, fontAttri.pointSize + 1);
                    maskLayer.path = maskPath.CGPath;
                    maskLayer.fillColor = [RTColor rtBg4TypeColor].CGColor;
                    _bgLayer = maskLayer;
                }
            }
        }
        return titleAttri;
    }
    return  nil;
}

- (NSAttributedString *)rowDetail {
    if (self.attriStr == nil || self.labDetail == nil) return nil;
    NSMutableAttributedString *detailAttri = [[NSMutableAttributedString alloc] initWithString:self.labDetail attributes:@{NSForegroundColorAttributeName:kWhiteColor,NSFontAttributeName:FONT(LENGTH(12.))}];
    NSString *back = [self getAttriValueByIndex:1];
    if (back) {
        NSRange characterRange = [self.labStr rangeOfString:back];
        [detailAttri addAttributes:@{NSForegroundColorAttributeName:[RTColor rtBg3TypeColor]} range:characterRange];
    }
    return detailAttri;
}

- (CALayer *)fieldBgLayer {
    return _bgLayer;
}

// private
- (NSString *)separateStr {
    return @"eg:";
}

@end

@implementation RTLabelAndIcon5Model

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labIcon":@"labIcon",
             @"labStr":@"labStr",
             @"labTitle":@"labTitle",
             @"labTitle2":@"labTitle2",
             @"labDetail":@"labDetail",
             @"labDetail2":@"labDetail2",
             @"attriStr":@"attriStr",
             @"attriStr2":@"attriStr2"
             };
}

- (NSAttributedString *)rowTitle {
    UIColor *titleBaseColor = [RTColor rtBg11TypeColor];
    UIColor *attriBaseColor = [RTColor rtBg11TypeColor];
    if ([self.modelType isEqualToString:@"RTFormInvisibleCapacitiveItemTwo"]) {
        titleBaseColor = [RTColor rtBg14TypeColor];
        attriBaseColor = kRedColor;
    }
    if (self.labTitle) {
        NSMutableAttributedString *titleAttri = [[NSMutableAttributedString alloc] initWithString:self.labTitle
                                                                                       attributes:@{
                                                                                        NSFontAttributeName:FONT(LENGTH(14.)),
                                                                                        NSForegroundColorAttributeName:titleBaseColor
                                                                                                    }];
        if (self.attriStr) {
            NSArray *attriItems = [self.attriStr componentsSeparatedByString:@";"];
            for (NSString *item in attriItems) {
                NSRange itemRange = [self.labTitle rangeOfString:item];
                [titleAttri addAttributes:@{
                                            NSFontAttributeName:FONT(LENGTH(14.)),
                                            NSForegroundColorAttributeName:attriBaseColor
                                            } range:itemRange];
            }
        }
        return titleAttri;
    }
    return nil;
}


- (NSAttributedString *)rowDetail{
    if (self.labDetail2) {
        NSMutableAttributedString *labDetail = [[NSMutableAttributedString alloc] initWithString:self.labDetail2
                                                                            attributes:@{
                                                                                NSFontAttributeName:FONT(LENGTH(14.)),
                                                                                NSForegroundColorAttributeName:[RTColor rtBg11TypeColor]
                                                                                }];
        if (self.attriStr2) {
            NSString *attris = self.attriStr2;
            NSArray *attriArray = [attris componentsSeparatedByString:@";"];
            for (NSString *itemStr in attriArray) {
                NSRange itemRange = [self.labDetail2 rangeOfString:itemStr];
                NSDictionary *attriDic =@{
                                          NSFontAttributeName:FONT(LENGTH(14.)),
                                          NSForegroundColorAttributeName:kRedColor
                                          };
                [labDetail addAttributes:attriDic range:itemRange];
            }
        }
        return labDetail;
    }
    return nil;
}

- (CGFloat)rowHeight {
    CGFloat width = kScreenW - 15. * 2;
    CGRect stringRect = [[self rowDetail] boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                       context:nil];
    return stringRect.size.height;
}

@end


@implementation RTLabelAndIcon101Model

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
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:value.count];
        for (NSDictionary *modelDic in value) {
            RTBaseModel *transformModel = nil;
            NSError *error = nil;
            if ([modelDic[@"modelType"] isEqualToString:@"RTAreaSubCard"]) {
                transformModel = [MTLJSONAdapter modelOfClass:[RTFormAreaModel class] fromJSONDictionary:modelDic error:&error];
            }
            else{
                NSDictionary *valueDic = [modelDic objectForKey:@"areaCapital"];
                transformModel = [MTLJSONAdapter modelOfClass:[RTFormAreaCapitalModel class] fromJSONDictionary:valueDic error:&error];
            }
            if (error == nil && transformModel) {
                [modelArray addObject:transformModel];
            }
        }
        return modelArray;
    }];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

@end

@implementation RTAreaCondition

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
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndIcon101Model class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

@end

@implementation RTAreaDevicesCondition
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
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndIcon101Model class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

@end

