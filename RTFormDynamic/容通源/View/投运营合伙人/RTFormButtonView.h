//
//  RTFormButtonView.h
//  darongtong
//
//  Created by zy on 2017/12/15.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 合作方式
#import "RTBaseView.h"
#import "ImageTitleButton.h"

@interface RTFormButtonView : RTBaseView
{
    @protected
    UIButton *_smallBtn;
    ImageTitleButton *_bgBtn;
    UIImageView *_rgImg;
}

- (NSString *)bgTitle;
@end
