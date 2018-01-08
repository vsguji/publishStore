//
//  RTHeaderView.h
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTFormProtocol.h" // lipeng 2017.12.07
#import "RTFormImageView.h" // lipeng 2017.12.07
#import "RTBaseView.h"
#import "ImageTitleButton.h"

////////////////////////////////////////////////////////////////////////////////////////////////
// 上传图片
@interface RTFormHeaderView : RTBaseView<RTFormProtocol>
{
    @protected
    RTFormImageView *_bgView;
    ImageTitleButton *_leftCorner;
    ImageTitleButton *_rightCorner;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 推广简介1

@interface RTFormBriefTopView:RTBaseView
{
  @protected
    // 背景
    UIImageView *_bgImg;
    // 推广简介·标题
    UILabel *_briefTitle;
    // 简介详情
    UITextView *_briefDetail1;
    UILabel *_briefDetail2;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////
// 推广简介2

@interface RTFormBriefBottomView:RTBaseView
{
    @protected
    // 背景
    UIImageView *_bgImg;
    // 社会关系
     UITextView *_relation;
    // 投资风向
    ImageTitleButton *_case;
    
    // 地区
    UITextView *_area;
    UILabel *_model;
    
    // 限时
    ImageTitleButton *_limitTime;
}
@end
