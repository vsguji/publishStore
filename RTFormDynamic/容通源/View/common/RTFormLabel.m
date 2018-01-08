//
//  RTFormLabel.m
//  darongtong
//
//  Created by zy on 2017/12/21.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTFormLabel.h"

@implementation RTFormLabel

@synthesize verticalAlignment = _verticalAlignment;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = RTAlignmentMiddle;
    }
    return self;
}

- (void)setVerticalAlignment:(RTAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case RTAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case RTAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case RTAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

@end
