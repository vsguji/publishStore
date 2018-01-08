//
//  RTHeaderView.m
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTFormHeaderView.h"
#import "UIView+Altar.h" // lipeng 2017.12.07
#import "RTColor.h"
#import "ColorMacro.h"
#import "UtilsMacro.h"
#import "UIColor+expanded.h"
#import "UIView+CustomAutoLayout.h"

@implementation RTFormHeaderView

- (void)addOwnViews {
   // 背景
    _bgView = [[RTFormImageView alloc] init];
    _bgView.backgroundColor = kYellowColor;
    [self addSubview:_bgView];
    // 左下角
    _leftCorner = [[ImageTitleButton alloc] initWithStyle: EImageLeftTitleRight maggin:UIEdgeInsetsMake(0, 6, 0, 0)];
    [self addSubview:_leftCorner];
    // 右下角
    _rightCorner = [[ImageTitleButton alloc] initWithStyle:EImageTopTitleBottom maggin:UIEdgeInsetsMake(10, 0,4, 0)];
    [self addSubview:_rightCorner];
}

- (void)configOwnViews {
    
    [_rightCorner setTitle:@"上传图片" forState:UIControlStateNormal];
    [_rightCorner.titleLabel setFont:FONT(LENGTH(9))];
    [_rightCorner.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_rightCorner setTitleColor:[UIColor colorWithHexString:@"0x959595"] forState:UIControlStateNormal];
    [_rightCorner setImage:[UIImage imageNamed:@"form_upload_icon"] forState:UIControlStateNormal];
    [_rightCorner setBackgroundImage:[UIImage imageNamed:@"form_upload_bg"] forState:UIControlStateNormal];
    
    [_leftCorner.titleLabel setFont:FONT(LENGTH(12))];
    [_leftCorner setTitleColor:[UIColor colorWithHexString:@"0xffffcc"] forState:UIControlStateNormal];
}

- (void)relayoutFrameOfSubViews {
    
    [_bgView setFrameAndLayout:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 230)];
    [_leftCorner setSize:(CGSize){LENGTH(150),LENGTH(20)}];
    [_leftCorner alignParentLeftWithMargin:10];
    [_leftCorner alignParentBottomWithMargin:10];
    
    [_rightCorner setSize:(CGSize){LENGTH(56),LENGTH(56)}];
    [_rightCorner alignParentRightWithMargin:10];
    [_rightCorner alignParentBottomWithMargin:15];
}

- (id)initWithLeftCornerTitle:(NSString *)title {
    self = [super init];
    if (self) {
        [_leftCorner setTitle:title forState:UIControlStateNormal];
        [_leftCorner setImage:[UIImage imageNamed:@"form_bg_partner"] forState:UIControlStateNormal];
        [_leftCorner setBackgroundImage:[UIImage imageNamed:@"form_leftCorner"] forState:UIControlStateNormal];
    }
    return self;
}

@end


@implementation RTFormBriefTopView

- (void)addOwnViews {

    _briefDetail1 = [[UITextView alloc] init];
    _briefDetail1.editable = NO;
    _briefDetail1.textAlignment = NSTextAlignmentCenter;
    _briefDetail1.showsVerticalScrollIndicator = NO;
    _briefDetail1.showsHorizontalScrollIndicator = NO;
    _briefDetail1.backgroundColor = kClearColor;
    [self addSubview:_briefDetail1];
    
    _briefDetail2 = [[UILabel alloc] init];
    _briefDetail2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_briefDetail2];
    
    self.backgroundColor = [RTColor rtBg1TypeColor];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormRowProtocol>)info {
    _briefDetail1.attributedText = [info rowTitle];
    _briefDetail2.attributedText = [info rowDetail];
}

- (void)relayoutFrameOfSubViews {
    
    [_briefDetail1 setSize:(CGSize){LENGTH(42),LENGTH(42)}];
    [_briefDetail1 alignParentTopWithMargin:2];
    [_briefDetail1 alignParentLeftWithMargin:10.];
    [_briefDetail1 scaleToParentRightWithMargin:10.];
    
    [_briefDetail2 setSize:(CGSize){LENGTH(15),LENGTH(15)}];
    [_briefDetail2 layoutBelow:_briefDetail1 margin:4];
    [_briefDetail2 alignParentLeftWithMargin:10.];
    [_briefDetail2 scaleToParentRightWithMargin:10.];
    [_briefDetail2 alignParentBottomWithMargin:2];
}

@end



@implementation RTFormBriefBottomView

- (void)addOwnViews {
    _bgImg = [[UIImageView alloc] init];
    [self addSubview:_bgImg];
    
    _relation = [[UITextView alloc] init];
    _relation.editable = NO;
    _relation.showsVerticalScrollIndicator = NO;
    _relation.showsHorizontalScrollIndicator = NO;
    [self addSubview:_relation];
    
    _case = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRight];
    [self addSubview:_case];
    
    _area = [[UITextView alloc] init];
    _area.editable = NO;
    _area.showsVerticalScrollIndicator = NO;
    _area.showsHorizontalScrollIndicator = NO;
    [self addSubview:_area];
    
    _model = [[UILabel alloc] init];
    [self addSubview:_model];
    
    _limitTime = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRight];
    [self addSubview:_limitTime];
    
    self.backgroundColor = [RTColor rtBg2TypeColor];
}

- (void)configOwnViews {
    
    _relation.backgroundColor = kClearColor;
    [_case setImage:[UIImage imageNamed:@"form_logo"] forState:UIControlStateNormal];
    [_case setTitleColor:[RTColor rtBg5TypeColor] forState:UIControlStateNormal];
    [_case.titleLabel setFont:FONT(LENGTH(12))];
    
    _area.backgroundColor = kClearColor;
    _model.font = FONT(LENGTH(12.));
    
    [_limitTime setTitleColor:[RTColor rtBg5TypeColor] forState:UIControlStateNormal];
    [_limitTime.titleLabel setFont:FONT(LENGTH(12))];
    [_limitTime setImage:[UIImage imageNamed:@"form_limit_time"] forState:UIControlStateNormal];
    _limitTime.titleLabel.numberOfLines = 0;
    _limitTime.titleLabel.lineBreakMode = kCTLineBreakByTruncatingTail;
    
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    _model.text = @"·交易模式:创业组合股权";
    _relation.text = @"运营合伙人·张三·智慧人·行家·信息技术互联网+·八坛科技股份公司·企业法定代表人|CEO·已供职:365天·任职部门:董事会股东会";
    [_limitTime setTitle:@"限时自2017.5.1~2017.9.1止" forState:UIControlStateNormal];
    [_case setTitle:@"投资风向" forState:UIControlStateNormal];
    _area.text = @"·运营合伙人作为资本的业务开展地区:内蒙古资质区呼和浩特市和林格尔县盛乐镇·附件圈子";
}

- (void)relayoutFrameOfSubViews {
    
    [_relation setSize:(CGSize){(60.),(60.)}];
    [_relation alignParentTopWithMargin:2];
    [_relation alignParentLeftWithMargin:10.];
    [_relation scaleToParentRightWithMargin:10.];
    
    [_case setSize:(CGSize){(12.),(12.)}];
    [_case layoutBelow:_relation margin:(10.)];
    [_case alignParentLeftWithMargin:10.];
    [_case scaleToParentRightWithMargin:10.];
    
    [_area setSize:(CGSize){(35),(35)}];
    [_area layoutBelow:_case margin:(10)];
    [_area alignParentLeftWithMargin:10.];
    [_area scaleToParentRightWithMargin:10.];
    
    [_model setSize:(CGSize){(12.),(12.)}];
    [_model layoutBelow:_area margin:(10)];
    [_model alignParentLeftWithMargin:10.];
    [_model scaleToParentRightWithMargin:10.];
    
    [_limitTime setSize:(CGSize){(15.),(15.)}];
    [_limitTime layoutBelow:_model margin:(10.)];
    [_limitTime alignParentLeftWithMargin:10.];
    [_limitTime scaleToParentRightWithMargin:10.];
    [_limitTime alignParentBottomWithMargin:10.];
}

@end
