//
//  RTButtonItemModel.m
//  darongtong
//
//  Created by zy on 2017/12/13.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTButtonItemModel.h"
#import "UtilsMacro.h"

@implementation RTButtonItemModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    [super JSONKeyPathsByPropertyKey];
    return @{
             @"modelId":@"modelId",
             @"modelType":@"modelType",
             @"labStr":@"labStr",
             @"labLIcon":@"labLIcon",
             @"labRIcon":@"labRIcon",
             @"labDetail":@"labDetail",
             @"attriStr":@"attriStr",
             @"isSelected":@"isSelected"
             };
}

#pragma mark -  是否选中
+ (NSValueTransformer *)isSelectedJSONTransformer{
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

- (NSString *)rowString {
    return self.labStr ? self.labStr : @"";
}

- (BOOL)buttonIsSelected {
    return self.isSelected;
}

- (CGFloat)rowHeight {
    CGRect bounds = [self.labStr boundingRectWithSize:CGSizeMake(120, HUGE_VALF)
                                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                           attributes:@{NSFontAttributeName:FONT(LENGTH(14))}
                                              context:nil];
    return CGRectGetHeight(bounds) + 10;
}

- (CGFloat)buttonWidth {
     CGRect bounds = [self.labStr boundingRectWithSize:CGSizeMake(120, HUGE_VALF)
                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName:FONT(LENGTH(14))}
                                               context:nil];
    return CGRectGetWidth(bounds) + 50;
}


- (UIImage *)buttonNormalIcon {
    if (self.labLIcon) {
        return [UIImage imageNamed:self.labLIcon];
    }
    return [UIImage imageNamed:@"form_person_default"];
}

- (UIImage *)buttonHightlIcon {
    if (self.labRIcon) {
        return [UIImage imageNamed:self.labRIcon];
    }
    return [UIImage imageNamed:@"form_person_click"];
}

@end
