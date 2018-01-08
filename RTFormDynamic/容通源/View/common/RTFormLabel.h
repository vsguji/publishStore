//
//  RTFormLabel.h
//  darongtong
//
//  Created by zy on 2017/12/21.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 系统label矫正位置
#import <UIKit/UIKit.h>

typedef enum
{
    RTAlignmentTop = 0, // default
    RTAlignmentMiddle,
    RTAlignmentBottom,
} RTAlignment;

@interface RTFormLabel : UILabel
{
@private
    RTAlignment _verticalAlignment;
}
@property (nonatomic) RTAlignment verticalAlignment;

@end

