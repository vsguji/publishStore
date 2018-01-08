//
//  UIView+shadow.m
//  darongtong
//
//  Created by xie on 17/10/19.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "UIView+shadow.h"

@implementation UIView (shadow)

#pragma mark -- 添加立体效果 --
- (void) addShadow{
    self.layer.shadowOpacity = 0.5;// 阴影透明度
    self.layer.shadowColor = [UIColor grayColor].CGColor;// 阴影的颜色
    self.layer.shadowRadius = 3;// 阴影扩散的范围控制
    self.layer.shadowOffset = CGSizeMake(1, 1);// 阴影的范围
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
