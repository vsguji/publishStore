//
//  RTLabelAndIconAttri.h
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//
//  文本 + 图片 + 富文本
#import "RTLabelAndIconModel.h"

@interface RTLabelAndIconAttriModel : RTLabelAndIconModel
{
    /*Elments*/
    @protected
    NSAttributedString *_leftDetail;
    NSString           *_centerIcon;
    NSString           *_rightDetail;
}
@property (nonatomic,copy) NSAttributedString *leftDetail;
@property (nonatomic,copy) NSString *centerIcon;
@property (nonatomic,copy) NSString *rightDetail;
@end



