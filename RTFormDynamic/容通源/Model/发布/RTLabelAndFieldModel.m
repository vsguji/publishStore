//
//  RTLabelAndField.m
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTLabelAndFieldModel.h"
#import "RTColor.h"
#import "ImageTitleButton.h"
#import "ColorMacro.h"
#import "UtilsMacro.h"
#import "UIColor+expanded.h"

@implementation RTLabelAndFieldModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelId":@"modelId",
             @"modelType":@"modelType",
             @"labTitle":@"labTitle",
             @"fieldLeftStr":@"fieldLeftStr",
             @"fieldLeftIcon":@"fieldLeftIcon",
             @"fieldPlaceholder":@"fieldPlaceholder",
             @"fieldRightStr":@"fieldRightStr",
             @"fieldRightIcon":@"fieldRightIcon",
             @"fieldIsAccessView":@"fieldIsAccessView",
             @"fieldIsAttri":@"fieldIsAttri",
             @"fieldBtmLineVisbile":@"fieldBtmLineVisbile",
             @"fieldPosition":@"fieldPosition",
             @"attriStr":@"attriStr"
             };
}

+ (NSValueTransformer *)fieldBtmLineVisbileJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

+ (NSValueTransformer *)fieldPositionJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @"0":@(kFiedlTopPositionLeft),
                                                                           @"1":@(kFiedlTopPositionMiddle),
                                                                           @"2":@(kFiedlTopPositionRight),
                                                                           @"3":@(kFiedlTopPositionLeftOffSet)
                                                                           }];
}

- (id)componentType {
    return self.modelType;
}

- (NSString *)fieldModelType {
    return self.modelType ? self.modelType : @"";
}

- (NSString *)fieldTopString {
    return self.labTitle ? self.labTitle : @"";
}

- (NSString *)fieldPlaceHolder {
    return self.fieldPlaceholder ? self.fieldPlaceholder : @"";
}

- (UIView *)leftView {
    if (self.fieldLeftIcon) {
         return [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.fieldLeftIcon]];
    }
    return nil;
}

- (UIView *)rightView {
    if (self.fieldRightStr == nil && self.fieldRightIcon) {
          return [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.fieldRightIcon]];
    }
    if (self.fieldRightStr && self.fieldRightIcon) {
        CGFloat btnWidth = 60.;
        if ([self.modelType isEqualToString:@"RTPartnerFieldsTrade1"]) {
            btnWidth = 80.;
        }
        else if ([self.modelType isEqualToString:@"RTPartnerFieldsTrade3"]) {
            btnWidth = 100.;
        }
        else if ([self.modelType isEqualToString:@"RTProductSubFieldsProduct"]){
            btnWidth = 70.;
        }
        
        ImageTitleButton *rightBtn = [[ImageTitleButton alloc] initWithStyle:ETitleLeftImageRightLeft];
        [rightBtn setImage:[UIImage imageNamed:self.fieldRightIcon] forState:UIControlStateNormal];
        [rightBtn setTitle:self.fieldRightStr forState:UIControlStateNormal];
        [rightBtn setTitleColor:kBlackColor forState:UIControlStateNormal];
        [rightBtn.titleLabel setFont:FONT(LENGTH(14))];
        rightBtn.frame = CGRectMake(0, 0, btnWidth, 35);
        return rightBtn;
    }
    return nil;
}

- (NSString *)rowString {
    return nil;
}

- (NSAttributedString *)rowTitle {
    if (self.attriStr == nil || self.labTitle == nil) return nil;
    UIFont *fontAttri = FONT(LENGTH(14.));

    NSMutableAttributedString *detailAttri = [[NSMutableAttributedString alloc] initWithString:self.labTitle
              attributes:@{
                    NSForegroundColorAttributeName:kBlackColor,
                    NSFontAttributeName:fontAttri,
                   // NSKernAttributeName:@(2)  // 字体间距
                    }];
    NSString *back = self.attriStr;
    if (back) {
        if ([self.modelType isEqualToString:@"RTPartnerFieldsProduct1"]) {
             NSRange characterRange = [self.labTitle rangeOfString:back];
             [detailAttri addAttributes:@{
                                          NSForegroundColorAttributeName:[UIColor colorWithHexString:@"0xa2a38a"],
                                           NSFontAttributeName:fontAttri,
                                          } range:characterRange];
        }
        else if ([self.modelType isEqualToString:@"RTProductSubFieldsProduct"]){
            NSRange characterRange = [self.labTitle rangeOfString:back];
            [detailAttri addAttributes:@{
                                         NSForegroundColorAttributeName:kRedColor,
                                         NSFontAttributeName:fontAttri,
                                         } range:characterRange];
        }
        else {
            NSRange characterRange = [self.labTitle rangeOfString:back];
            _attriStart = (characterRange.location) * (fontAttri.pointSize) ;//+ (characterRange.location - 1) * 2; // 字体大小
            _attriWidth = (characterRange.length) * 12.;  //这里 fontAttri.pointSize:15. 数字:11.
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_attriStart , -1, _attriWidth - 1, fontAttri.pointSize + 1)cornerRadius:_attriWidth / 2];
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            maskLayer.frame = CGRectMake(0, 0, _attriWidth, fontAttri.pointSize + 1);
            maskLayer.path = maskPath.CGPath;
            maskLayer.fillColor = [RTColor rtBg4TypeColor].CGColor;
            _bgLayer = maskLayer;
            [detailAttri addAttributes:@{NSForegroundColorAttributeName:kWhiteColor} range:characterRange];
        }
    }
    return detailAttri;
}

- (CGFloat)fieldAttriStart {
    return _attriStart;
}

- (CGFloat)fieldAttriWidth {
    return _attriWidth;
}

- (CALayer *)fieldBgLayer {
    return _bgLayer;
}

- (BOOL)btmLineVisible {
    return self.fieldBtmLineVisbile;
}

- (NSInteger)fieldTopStringPosition {
    return self.fieldPosition;
}

@end

@implementation RTLabelAndField2Model

- (NSAttributedString *)rowTitle {
    if (self.labTitle) {
        NSMutableAttributedString *titleAttri = [[NSMutableAttributedString alloc] initWithString:self.labTitle
                                                                                       attributes:@{
                                                                                                    NSFontAttributeName:FONT(LENGTH(14.)),
                                                                                                    NSForegroundColorAttributeName:[RTColor rtBg11TypeColor]
                                                                                                    }];
        if (self.attriStr) {
            NSArray *attriItems = [self.attriStr componentsSeparatedByString:@";"];
            for (NSString *item in attriItems) {
                NSRange itemRange = [self.labTitle rangeOfString:item];
                [titleAttri addAttributes:@{
                                            NSFontAttributeName:FONT(LENGTH(14.)),
                                            NSForegroundColorAttributeName:kRedColor
                                            } range:itemRange];
            }
        }
        return titleAttri;
    }
    return nil;
}

- (NSAttributedString *)fieldAttriPlaceHolder {
    if (self.fieldPlaceholder) {
        NSMutableAttributedString *fieldAttriPlace= [[NSMutableAttributedString alloc] initWithString:self.fieldPlaceholder
                                                                                             attributes:@{
                                                                                        NSFontAttributeName:FONT(LENGTH(14.)),
                                                                                        NSForegroundColorAttributeName:[RTColor rtBg11TypeColor]
                                                                                                }];
        if ([self.fieldPlaceholder rangeOfString:@"eg:"].location != NSNotFound) {
            NSRange egRange = [self.fieldPlaceholder rangeOfString:@"eg:"];
            [fieldAttriPlace addAttributes:@{
                                             NSFontAttributeName:FONT(LENGTH(14.)),
                                             NSForegroundColorAttributeName:kRedColor
                                             } range:NSMakeRange(0, egRange.location)];
            [fieldAttriPlace addAttributes:@{
                                             NSFontAttributeName:FONT(LENGTH(14.)),
                                             NSForegroundColorAttributeName:kBlackColor
                                             } range:egRange];
            return fieldAttriPlace;
        }
    }
    return nil;
}

@end

@implementation RTLabelAndField3Model

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labTitle":@"labTitle",
             @"fieldLeftStr":@"fieldLeftStr",
             @"fieldLeftIcon":@"fieldLeftIcon",
             @"fieldPlaceholder":@"fieldPlaceholder",
             @"fieldRightStr":@"fieldRightStr",
             @"fieldRightIcon":@"fieldRightIcon",
             @"fieldIsAccessView":@"fieldIsAccessView",
             @"fieldIsAttri":@"fieldIsAttri",
             @"fieldBtmLineVisbile":@"fieldBtmLineVisbile",
             @"fieldPosition":@"fieldPosition",
             @"attriStr":@"attriStr",
             @"items":@"items",
             @"labDetail":@"labDetail",
             @"labDetailStatus":@"labDetailStatus"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndIcon4Model class]];
}

+ (NSValueTransformer *)labDetailStatusJSONTransformer {
    return [MTLValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}


- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

- (CGFloat)rowHeight {
    CGFloat height = 105. * self.items.count;
    if (self.labDetail) {
        height += 40.;
    }
    return height;
}

@end

@implementation RTLabelAndFieldModels

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
              @"modelType":@"modelType",
              @"fields":@"fields"
             };
}

#pragma mark - 文本表单

+ (NSValueTransformer *)fieldsJSONTransformer{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndFieldModel class]];
}

- (NSArray *)formFields {
    return self.fields ? self.fields:@[];
}

@end


@implementation RTLabelAndFieldModels2

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"fields2":@"fields2"
             };
}

#pragma mark - 文本表单

+ (NSValueTransformer *)fields2JSONTransformer{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndFieldModel class]];
}

- (NSArray *)formFields {
    return self.fields2 ? self.fields2:@[];
}

@end

@implementation RTLabelAndFieldModels3

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"fields3":@"fields3"
             };
}

#pragma mark - 文本表单

+ (NSValueTransformer *)fields3JSONTransformer{
        return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
            NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:value.count];
            for (NSDictionary *modelDic in value) {
                RTBaseModel *transformModel = nil;
                NSError *error = nil;
                if ([modelDic[@"modelType"] isEqualToString:@"RTPartnerFields3"]) {
                    transformModel = [MTLJSONAdapter modelOfClass:[RTTitleAndFieldsModel class] fromJSONDictionary:modelDic error:&error];
                }
                else{
                    transformModel = [MTLJSONAdapter modelOfClass:[RTFieldAndGroupModel class] fromJSONDictionary:modelDic error:&error];
                }
                if (error == nil && transformModel) {
                    [modelArray addObject:transformModel];
                }
            }
            return modelArray;
        }];
}

- (NSArray *)formFields {
    return self.fields3 ? self.fields3 :@[];
}
@end

@implementation RTLabelAndFieldModels4

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"fields4":@"fields4"
             };
}

#pragma mark - 文本表单

+ (NSValueTransformer *)fields4JSONTransformer{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTTitleAndFieldsModel class]];
}

- (NSArray *)formFields {
    return self.fields4 ? self.fields4 :@[];
}

@end

@implementation RTLabelAndTextModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labTitle":@"labTitle",
             @"fieldLeftStr":@"fieldLeftStr",
             @"fieldLeftIcon":@"fieldLeftIcon",
             @"fieldPlaceholder":@"fieldPlaceholder",
             @"fieldRightStr":@"fieldRightStr",
             @"fieldRightIcon":@"fieldRightIcon",
             @"fieldIsAccessView":@"fieldIsAccessView",
             @"fieldIsAttri":@"fieldIsAttri",
             @"fieldBtmLineVisbile":@"fieldBtmLineVisbile",
             @"fieldPosition":@"fieldPosition",
             @"items":@"items"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndFieldModel class]];
}

- (NSArray *)formFields {
    return self.items ? self.items : @[];
}

@end

@implementation RTLabelAndMediaModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labTitle":@"labTitle",
             @"fieldLeftStr":@"fieldLeftStr",
             @"fieldLeftIcon":@"fieldLeftIcon",
             @"fieldPlaceholder":@"fieldPlaceholder",
             @"fieldRightStr":@"fieldRightStr",
             @"fieldRightIcon":@"fieldRightIcon",
             @"fieldIsAccessView":@"fieldIsAccessView",
             @"fieldIsAttri":@"fieldIsAttri",
             @"fieldBtmLineVisbile":@"fieldBtmLineVisbile",
             @"fieldPosition":@"fieldPosition",
             @"items":@"items"
             };
}


+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndIcon2Model class]];
}

- (NSArray *)formFields {
    return self.items ? self.items : @[];
}

@end


@implementation RTFieldAndGroupModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labTitle":@"labTitle",
             @"fieldLeftStr":@"fieldLeftStr",
             @"fieldLeftIcon":@"fieldLeftIcon",
             @"fieldPlaceholder":@"fieldPlaceholder",
             @"fieldRightStr":@"fieldRightStr",
             @"fieldRightIcon":@"fieldRightIcon",
             @"fieldIsAccessView":@"fieldIsAccessView",
             @"fieldIsAttri":@"fieldIsAttri",
             @"fieldBtmLineVisbile":@"fieldBtmLineVisbile",
             @"fieldPosition":@"fieldPosition",
             @"items":@"items",
             @"attriStr":@"attriStr"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTButtonItemModel class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items : @[];
}

- (CGFloat)rowHeight {
    return 40.;
}


- (NSAttributedString *)bothAttriTitle {
     return [self rowTitle];
}

@end


@implementation RTTitleAndFieldsModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labTitle":@"labTitle",
             @"fieldLeftStr":@"fieldLeftStr",
             @"fieldLeftIcon":@"fieldLeftIcon",
             @"fieldPlaceholder":@"fieldPlaceholder",
             @"fieldRightStr":@"fieldRightStr",
             @"fieldRightIcon":@"fieldRightIcon",
             @"fieldIsAccessView":@"fieldIsAccessView",
             @"fieldIsAttri":@"fieldIsAttri",
             @"fieldBtmLineVisbile":@"fieldBtmLineVisbile",
             @"fieldPosition":@"fieldPosition",
             @"items":@"items",
             @"attriStr":@"attriStr"
             };
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTLabelAndFieldModel class]];
}

- (NSArray *)formFields {
    return self.items ? self.items : @[];
}

- (CGFloat)leftMagin {
    return 10.;
}

@end
