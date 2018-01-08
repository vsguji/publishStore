//
//  RTGroupModel.m
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTButtonsGroupModel.h"
#import "RTButtonItemModel.h"
#import "RTLabelAndFieldModel.h"
#import "RTColor.h"

#import "UtilsMacro.h"
#import "UIColor+expanded.h"

@implementation RTButtonsGroupModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"itemTitle":@"itemTitle",
             @"layoutDirection":@"layoutDirection",
             @"layoutNumOfRows":@"layoutNumOfRows",
             @"items":@"items"
             };
}

+ (NSValueTransformer *)layoutDirectionJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}


+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[RTButtonItemModel class]];
}

- (NSArray *)groupItems {
    return self.items ? self.items:@[];
}

- (BOOL)layoutHorizontalOrVertical {
    return self.layoutDirection; // YES 默认水平
}

- (NSInteger)layoutNumBtnsOfRows {
    return self.layoutNumOfRows;
}

- (UIImage *)leftIcon {
    if (self.labLIcon) {
       return [UIImage imageNamed:self.labLIcon];
    }
    return nil;
}

- (UIImage *)rightView {
    if (self.labRIcon) {
        return [UIImage imageNamed:self.labRIcon];
    }
    return nil;
}

- (NSAttributedString *)sectionTitle {
    if (self.labTitle) {
        NSMutableAttributedString *sectionAttri = [[NSMutableAttributedString alloc] initWithString:self.labTitle
                                                                                         attributes:@{
                                                                                                      NSFontAttributeName:FONT(LENGTH(14)),
                                                                                                      NSForegroundColorAttributeName:[UIColor colorWithHexString:@"0xbdbeae"]
                                                                                                      }];
        NSRange range = [self.labTitle rangeOfString:self.attriStr];
        [sectionAttri setAttributes:@{
                                      NSForegroundColorAttributeName:[RTColor rtBg17TypeColor]
                                      }
                              range:range];
        return sectionAttri;
    }
    return nil;
}

- (NSString *)rowString {
    return self.itemTitle ? self.itemTitle : @"";
}

- (CGFloat)itemTitleHeight {
    return 15.;
}
@end

@implementation RTFormButtonsGroupModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labLIcon":@"labLIcon",
             @"labRIcon":@"labRIcon",
             @"labTitle":@"labTitle",
             @"attriStr":@"attriStr",
             @"ways":@"ways"
             };
}

+ (NSValueTransformer *)waysJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSMutableArray *modelArray = [NSMutableArray arrayWithCapacity:value.count];
        for (NSDictionary *modelDic in value) {
             RTBaseModel *transformModel = nil;
            NSError *error = nil;
            if ([modelDic[@"modelType"] isEqualToString:@"RTPartnerFields9"]) {
                transformModel = [MTLJSONAdapter modelOfClass:[RTLabelAndFieldModel class] fromJSONDictionary:modelDic error:&error];
            }
            else{
                transformModel = [MTLJSONAdapter modelOfClass:[RTButtonsGroupModel class] fromJSONDictionary:modelDic error:&error];
            }
            if (error == nil) {
               [modelArray addObject:transformModel];
            }
        }
        return modelArray;
    }];
}

- (UIImage *)leftIcon {
    if (self.labLIcon) {
        return [UIImage imageNamed:self.labLIcon];
    }
    return nil;
}

- (UIImage *)rightIcon {
    if (self.labRIcon) {
        return [UIImage imageNamed:self.labRIcon];
    }
    return nil;
}

- (NSAttributedString *)sectionTitle {
    if (self.labTitle) {
        NSMutableAttributedString *sectionAttri = [[NSMutableAttributedString alloc] initWithString:self.labTitle
                                                                                         attributes:@{
                                                                                                      NSFontAttributeName:FONT(LENGTH(14)),
                                                                                                      NSForegroundColorAttributeName:[UIColor colorWithHexString:@"0xbdbeae"]
                                                                                                      }];
        NSRange range = [self.labTitle rangeOfString:self.attriStr];
        [sectionAttri setAttributes:@{
                                      NSForegroundColorAttributeName:[UIColor colorWithHexString:@"0x823424"]
                                      }
                              range:range];
        return sectionAttri;
    }
    return  nil;
}

- (NSArray *)groupItems{
    return self.ways ? self.ways : @[];
}

@end


@implementation RTFormSectionHeaderModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"modelType":@"modelType",
             @"labLIcon":@"labLIcon",
             @"labRIcon":@"labRIcon",
             @"labTitle":@"labTitle",
             @"attriStr":@"attriStr",
             @"labIcon":@"labIcon",
             @"labDetail":@"labDetail"
             };
}

+ (NSValueTransformer *)businessJSONTransformer{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[RTLabelAndIcon2Model class]];
}

- (UIImage *)leftIcon {
    if (self.labLIcon) {
        return [UIImage imageNamed:self.labLIcon];
    }
    return nil;
}

- (UIImage *)rightIcon {
    if (self.labRIcon) {
        return [UIImage imageNamed:self.labRIcon];
    }
    return nil;
}

- (UIImage *)sectionIcon {
    if (self.labIcon) {
        return [UIImage imageNamed:self.labIcon];
    }
    return nil;
}

- (NSAttributedString *)sectionTitle {
    if (self.labTitle) {
        UIColor *attriColor = [UIColor colorWithHexString:@"0xbdbeae"];
        if([self.modelType isEqualToString:@"RTFormAreaEntityProduct"]) {
            attriColor = [RTColor rtBg10TypeColor];
        }
        NSMutableAttributedString *sectionAttri = [[NSMutableAttributedString alloc] initWithString:self.labTitle
                                                                                         attributes:@{
                                                                                                      NSFontAttributeName:FONT(LENGTH(14)),
                                                                                    NSForegroundColorAttributeName:attriColor
                                                                                                      }];
        if (self.attriStr) {
            NSRange range = [self.labTitle rangeOfString:self.attriStr];
            [sectionAttri setAttributes:@{
                                          NSForegroundColorAttributeName:[UIColor colorWithHexString:@"0x823424"]
                                          }
                                  range:range];
        }
      
        return sectionAttri;
    }
    return  nil;
}

@end

