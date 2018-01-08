//
//  UILabel+SizeToLabel.m
//  yqcf
//
//  Created by pro on 15/8/10.
//  Copyright (c) 2015年 feiyu. All rights reserved.
//

#import "UILabel+SizeToLabel.h"

@implementation UILabel (SizeToLabel)
- (void)lineSpacingText:(NSString *)text spacing:(float)space
{
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:space];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [text length])];
    [self setAttributedText:attributedString1];
    [self sizeToFit];
    
}
@end
