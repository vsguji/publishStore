//
//  RTAreaTipView.m
//  darongtong
//
//  Created by zy on 2018/1/4.
//  Copyright © 2018年 darongtong. All rights reserved.
//

#import "RTAreaTipView.h"
#import "UIView+Altar.h"
#import <QuartzCore/QuartzCore.h>
#import "RTColor.h"
#import "RTBriefModel.h"
#import "ColorMacro.h"
#import "UIColor+expanded.h"
#import "UtilsMacro.h"
#import "UIView+CustomAutoLayout.h"

@implementation RTCommonTipSectionView

- (void)addOwnViews {
    // 编辑
    _editAction = [[ImageTitleButton alloc] initWithStyle:ETitleLeftImageRightLeft];
    // 扩展
    _accessIcon = [[UIImageView alloc] init];
    
    [self addSubview:_editAction];
    [self addSubview:_accessIcon];
}

- (void)configOwnViews {
    
    self.backgroundColor = [UIColor colorWithHexString:@"0x823424"];
    
    [_editAction setBackgroundImage:[UIImage imageNamed:@"form_edit_bg"] forState:UIControlStateNormal];
    [_editAction setImage:[UIImage imageNamed:@"form_pen"] forState:UIControlStateNormal];
    [_editAction setTitle:@"编辑" forState:UIControlStateNormal];
    [_editAction.titleLabel setFont:FONT(LENGTH(12))];
    [_editAction setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [_editAction addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    [_accessIcon setImage:[UIImage imageNamed:@"form_yellow_access"]];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editAction)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [_accessIcon addGestureRecognizer:singleTap];
    
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
   
}


- (void)relayoutFrameOfSubViews {
    // 扩展
    [_accessIcon setSize:(CGSize){(10),(22)}];
    [_accessIcon alignParentRightWithMargin:10];
    [_accessIcon layoutParentVerticalCenter];
    // 编辑
    [_editAction setSize:(CGSize){(46),(44)}];
    [_editAction layoutToLeftOf:_accessIcon margin:(10)];
    [_editAction layoutParentVerticalCenter];
}

#pragma mark - 编辑

- (void)editAction {
    if (_dynamicDelegate && [_dynamicDelegate respondsToSelector:@selector(popViewController)]) {
        [_dynamicDelegate performSelector:@selector(popViewController)];
    }
}

@end

@implementation RTAreaTipSectionView

- (void)addOwnViews {
    [super addOwnViews];
    _leftView = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRightLeft
                                                maggin:UIEdgeInsetsMake(0, 4., 0, 0)
                                                padding:CGSizeMake(2., 0.)];
    [self addSubview:_leftView];
}

- (void)configOwnViews {
    [super configOwnViews];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    NSMutableAttributedString *titleAttri = [[NSMutableAttributedString alloc] initWithString:@"1号具备场地条件"
                                                                                   attributes:@{
                                                                                        NSFontAttributeName:FONT(LENGTH(12.)),
                                                                                        NSForegroundColorAttributeName:kWhiteColor
                                                                                                }];
    NSRange range = [titleAttri.string rangeOfString:@"1号"];
    [titleAttri addAttributes:@{
                                NSFontAttributeName:FONT(LENGTH(12.)),
                                NSForegroundColorAttributeName:kRedColor
                                } range:range];
    [_leftView setAttributedTitle:titleAttri forState:UIControlStateNormal];
    [_leftView setImage:[UIImage imageNamed:@"form_device_area"] forState:UIControlStateNormal];
}

- (void)relayoutFrameOfSubViews {
    [super relayoutFrameOfSubViews];
    [_leftView setSize:(CGSize){(25.),(25.)}];
    [_leftView alignParentLeftWithMargin:10.];
    [_leftView layoutParentVerticalCenter];
    [_leftView scaleToLeftOf:_editAction margin:10.];
    
}

@end

@implementation RTAreaTipCardView

- (void)addOwnViews {
    _bgView = [[UIView alloc] init];
    [self addSubview:_bgView];
    
    _areaView = [[RTCommonAreaView alloc] init];
    [_bgView addSubview:_areaView];
    
}

- (void)configOwnViews {
    _bgView.backgroundColor = kWhiteColor;
    _bgView.layer.cornerRadius = 5.;
    _bgView.layer.masksToBounds = YES;
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    [_areaView configOwnViewsWidthInfo:info];
}

- (void)relayoutFrameOfSubViews {
    [_bgView marginParentWithEdgeInsets:UIEdgeInsetsMake(10., 10., 15.,10.)];
    [_areaView setSize:(CGSize){(250.),(250.)}];
    [_areaView alignParentBottomWithMargin:10.];
    [_areaView alignParentLeftWithMargin:15.];
    [_areaView scaleToParentRightWithMargin:15.];
}

@end

@implementation RTCommonAreaView

- (void)addOwnViews {
    _location = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRight maggin:UIEdgeInsetsZero padding:CGSizeMake(4., 0.)];
    [self addSubview:_location];
    
    _locationText = [[UITextView alloc] init];
    _locationText.editable = NO;
    [self addSubview:_locationText];
    
    _area = [[UIView alloc] init];
    [self addSubview:_area];
    
    _areaLab = [[UILabel alloc] init];
    [self addSubview:_areaLab];
    
    _centerRange = [[ImageTitleButton alloc] initWithStyle:EImageLeftTitleRight maggin:UIEdgeInsetsZero padding:CGSizeMake(4., 0.)];
    [self addSubview:_centerRange];
    
    _areaImg = [[UIImageView alloc] init];
    [self addSubview:_areaImg];
    
    _latitude = [[UIView alloc] init];
    [_areaImg addSubview:_latitude];
    
    _latitudeValue = [[UILabel alloc] init];
    [_latitude addSubview:_latitudeValue];
    
    _radius = [[UILabel alloc] init];
    [_latitude addSubview:_radius];
}

- (void)configOwnViews {
    
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    
}

- (void)reloadInputViews {
    
    [_location setSize:(CGSize){(100.),(14.)}];
    [_location layoutParentHorizontalCenter];
    
    [_locationText setSize:(CGSize){(60.),(60.)}];
    [_locationText layoutParentHorizontalCenter];
    [_locationText alignParentLeftWithMargin:20.];
    [_locationText scaleToParentRightWithMargin:20.];
    
    [_area setSize:(CGSize){(45.),(45.)}];
    [_area layoutBelow:_locationText margin:10.];
    [_area alignParentLeft];
    [_area scaleToParentRight];
    
    [_areaLab setSize:(CGSize){(80.),(12.)}];
    [_areaLab alignParentLeft];
    [_areaLab layoutBelow:_area margin:10.];
    
    [_centerRange setSize:(CGSize){(12.),(12.)}];
    [_centerRange layoutBelow:_areaLab margin:10.];
    [_centerRange alignParentLeftWithMargin:10.];
    [_centerRange scaleToParentRightWithMargin:10.];
    
    [_areaImg layoutBelow:_centerRange margin:10.];
    [_areaImg setSize:(CGSize){(120.),(25.)}];
    [_areaImg layoutParentHorizontalCenter];
    
    [_latitude setSize:(CGSize){(90.),(25.)}];
    [_latitude alignParentTop];
    [_latitude alignParentLeftWithMargin:15.];
    [_latitude scaleToParentRightWithMargin:15.];
    
    [_latitudeValue setSize:(CGSize){(8.),(8.)}];
    [_latitudeValue alignParentLeftWithMargin:4.];
    [_latitudeValue scaleToParentRightWithMargin:4.];
    [_latitudeValue alignParentTopWithMargin:2.];

    [_radius setSize:(CGSize){(8.),(8.)}];
    [_radius layoutParentHorizontalCenter];
    [_radius alignParentLeftWithMargin:10.];
    [_radius scaleToParentRightWithMargin:10.];
}

@end


@implementation RTAreaTipView

- (void)addOwnViews {
    _sectionView = [[RTAreaTipSectionView alloc]init];
    [self addSubview:_sectionView];
    _cardView = [[RTAreaTipCardView alloc] init];
    [self addSubview:_cardView];
}

- (void)configOwnViews {
    self.backgroundColor = [RTColor rtBg22TypeColor];
}

- (void)configSuperViewsWidthInfo:(id<RTFormProtocol>)info {
     [_sectionView configOwnViewsWidthInfo:info];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormViewProtocol>)info {
    if ([info respondsToSelector:@selector(groupItems)]) {
        NSArray *items = [info groupItems];
        if (items && items.count > 0) {
            _cardView.hidden = YES;
            CGFloat width = kScreenW - (2) * 2;
            CGFloat originY = 50.;
            NSInteger i = 0;
            for (RTBaseModel *model in items) {
                RTAreaTipCardView * cardView = [[RTAreaTipCardView alloc] init];
                [self addSubview:cardView];
                [cardView configOwnViewsWidthInfo:(id)model];
                [cardView setFrameAndLayout:CGRectMake(2., originY, width, 541.)];
                originY += 541. + 2.;
                if ( i < items.count - 1) {
                    UIView *line = [self middleLineByRect:CGRectMake(10., originY, width, 8.)];
                    [self addSubview:line];
                    originY += 8.;
                }
                i++;
            }
        }
    }
    else {
         [_cardView configOwnViewsWidthInfo:info];
    }
    
     _sectionView.dynamicDelegate = self.dynamicDelegate;
}

- (void)relayoutFrameOfSubViews {
    [_sectionView setSize:(CGSize){(50.),(50.)}];
    [_sectionView alignParentTop];
    [_sectionView alignParentLeft];
    [_sectionView scaleToParentRight];
    [_sectionView relayoutFrameOfSubViews];
    
    [_cardView layoutBelow:_sectionView];
    [_cardView alignParentLeft];
    [_cardView scaleToParentRight];
    [_cardView scaleToParentBottom];
    [_cardView relayoutFrameOfSubViews];
}

// private
- (UIView *)middleLineByRect:(CGRect)rect {
    UIImageView *line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"form_area_line"]];
    line.frame = rect;
    return line;
}

@end

@implementation RTFormAreaSecretAttachment

- (void)addOwnViews {
    
    _bgView = [[UIView alloc] init];
    [self addSubview:_bgView];
    
    _fieldView = [[RTFormTextView alloc] init];
    [_bgView addSubview:_fieldView];
    
    _fieldLimit = [[RTFormFieldView alloc] init];
    [_bgView addSubview:_fieldLimit];
    
    _uploadFile = [[RTFormSecretAttachment2UploadFile alloc] init];
    [_bgView addSubview:_uploadFile];
}

- (void)configOwnViews {
    _bgView.backgroundColor = [RTColor rtBg12TypeColor];
    _bgView.layer.cornerRadius = 15.;
    _bgView.layer.masksToBounds = YES;
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormViewProtocol>)info {
    NSArray *items = [info groupItems];
    if (items && items.count > 2) {
        [_fieldView configOwnViewsWidthInfo:items[0]];
        [_fieldLimit configOwnViewsWidthInfo:items[1]];
        [_uploadFile configOwnViewsWidthInfo:items[2]];
    }
}

- (void)relayoutFrameOfSubViews {
    
    [_bgView scaleParent];
    
    [_fieldView setSize:(CGSize){(2320.),(232.)}];
    [_fieldView alignParentTopWithMargin:4.];
    [_fieldView alignParentLeftWithMargin:4.];
    [_fieldView scaleToParentRightWithMargin:4.];
    [_fieldView relayoutFrameOfSubViews];
    
    [_fieldLimit setSize:(CGSize){102.,102.}];
    [_fieldLimit layoutBelow:_fieldView margin:4.];
    [_fieldLimit alignParentLeftWithMargin:4.];
    [_fieldLimit scaleToParentRightWithMargin:4.];
    [_fieldLimit relayoutFrameOfSubViews];
    
    [_uploadFile setSize:(CGSize){(160.),(160.)}];
    [_uploadFile layoutBelow:_fieldLimit margin:(10.)];
    [_uploadFile alignParentLeftWithMargin:4.];
    [_uploadFile scaleToParentRightWithMargin:4.];
    [_uploadFile relayoutFrameOfSubViews];
}

@end

@implementation RTAreaTipSecretInfoView

- (void)addOwnViews {
    _secretTopView  = [[RTFormCommonSecretTopView alloc] init];
    [self addSubview:_secretTopView];
    _secretAttachment = [[RTFormAreaSecretAttachment alloc] init];
    [self addSubview:_secretAttachment];
}

- (void)configOwnViews {
    
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    [_secretTopView configOwnViewsWidthInfo:info];
    [_secretAttachment configOwnViewsWidthInfo:info];
}

- (void)relayoutFrameOfSubViews {
    [_secretTopView setSize:(CGSize){260.,157.}];
    [_secretTopView alignParentTop];
    [_secretTopView alignParentLeft];
    [_secretTopView scaleToParentRight];
    [_secretTopView relayoutFrameOfSubViews];
    
    [_secretAttachment layoutBelow:_secretTopView margin:10.];
    [_secretAttachment alignParentLeftWithMargin:4.];
    [_secretAttachment scaleToParentRightWithMargin:4.];
    [_secretAttachment scaleToParentBottom];
    [_secretAttachment relayoutFrameOfSubViews];
}

@end

@implementation RTFormAreaConditionCommonView

- (void)addOwnViews {
    _topText = [[UITextView alloc] init];
    _topText.editable = NO;
    _topText.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_topText];
}

- (void)configOwnViews {
    _topText.backgroundColor = kClearColor;
    _topText.font = FONT(LENGTH(12.));
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    
}

- (void)relayoutFrameOfSubViews {
    [_topText marginParentWithEdgeInsets:UIEdgeInsetsMake(1., 1., 26., 1.)];
}

@end

@implementation RTFormAreaConditionStyle1View

- (void)addOwnViews {
    [super addOwnViews];
    _sCheck = [[ImageTitleButton alloc] initWithStyle:ETitleLeftImageRight maggin:UIEdgeInsetsZero padding:CGSizeMake(2., 0.)];
    _sCheck.titleLabel.font = FONT(LENGTH(12.));
    [self addSubview:_sCheck];
    _fCheck = [[ImageTitleButton alloc] initWithStyle:ETitleLeftImageRight maggin:UIEdgeInsetsZero padding:CGSizeMake(2., 0.)];
    _fCheck.titleLabel.font = FONT(LENGTH(12.));
    [self addSubview:_fCheck];
}

- (void)configOwnViews {
    [super configOwnViews];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    _topText.textColor = kRedColor;
    _topText.text = @"是否要求被投资本对象填报如下项";
    
    [_sCheck setImage:[UIImage imageNamed:@"form_small_red"] forState:UIControlStateNormal];
    [_sCheck setTitle:@"是" forState:UIControlStateNormal];
    
    [_fCheck setImage:[UIImage imageNamed:@"form_small_gray"] forState:UIControlStateNormal];
    [_fCheck setTitle:@"否" forState:UIControlStateNormal];
}

- (void)relayoutFrameOfSubViews {
    
    [super relayoutFrameOfSubViews];
    [_sCheck setSize:(CGSize){25,15}];
    [_sCheck layoutBelow:_topText margin:6.];
    [_sCheck alignParentLeftWithMargin:2.];
    
    [_fCheck setSize:(CGSize){25,15}];
    [_fCheck layoutBelow:_topText margin:6.];
    [_fCheck layoutToRightOf:_sCheck margin:2.];
    [_fCheck alignParentRightWithMargin:4.];
}

@end

@implementation RTFormAreaConditionStyle2View

- (void)addOwnViews {
    [super addOwnViews];
    _sSwitch = [[UIButton alloc] init];
    [self addSubview:_sSwitch];
    _fSwitch = [[UIButton alloc] init];
    [self addSubview:_fSwitch];
}

- (void)configOwnViews {
    [super configOwnViews];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    _topText.textColor = [RTColor rtBg24TypeColor];
    _topText.text = @"是否有最低限";
    [_sSwitch setBackgroundImage:[UIImage imageNamed:@"form_has"] forState:UIControlStateNormal];
    [_fSwitch setBackgroundImage:[UIImage imageNamed:@"form_nohas"] forState:UIControlStateNormal];
}

- (void)relayoutFrameOfSubViews {
    [super relayoutFrameOfSubViews];
    
    [_sSwitch setSize:(CGSize){30,15}];
    [_sSwitch layoutBelow:_topText margin:6.];
    [_sSwitch alignParentLeftWithMargin:4.];
    
    [_fSwitch setSize:(CGSize){30,15}];
    [_fSwitch layoutBelow:_topText margin:6.];
    [_fSwitch layoutToRightOf:_sSwitch margin:2.];
    [_fSwitch alignParentRightWithMargin:4.];
}

@end

@implementation RTFormAreaConditionStyle3View

- (void)addOwnViews {
    [super addOwnViews];
    _btmLabel = [[UILabel alloc] init];
    _btmLabel.font = FONT(LENGTH(12.));
    _btmLabel.textColor = kWhiteColor;
    _btmLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_btmLabel];
}

- (void)configOwnViews {
    [super configOwnViews];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    _topText.textColor = kWhiteColor;
    _topText.text = @"货币投资人自己填写要求被投资对象所具备最低限是多少";
    _btmLabel.text = @"所限制是什么";
}

- (void)relayoutFrameOfSubViews {
    [super relayoutFrameOfSubViews];
    [_btmLabel setSize:(CGSize){12,12}];
    [_btmLabel layoutBelow:_topText margin:6.];
    [_btmLabel layoutParentHorizontalCenter];
    [_btmLabel alignParentLeftWithMargin:2.];
    [_btmLabel scaleToParentRightWithMargin:2.];
}

@end


@implementation RTFormAreaConditionView

- (void)addOwnViews {
    
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [RTColor rtBgColor];
    [self addSubview:_bgView];
    
    _style1View = [[RTFormAreaConditionStyle1View alloc] init];
    [_bgView addSubview:_style1View];
    
    _line1 = [[UIView alloc] init];
    _line1.backgroundColor = kWhiteColor;
    [_bgView addSubview:_line1];
    
    _style2View = [[RTFormAreaConditionStyle2View alloc] init];
    [_bgView addSubview:_style2View];
    
    _line2 = [[UIView alloc] init];
    _line2.backgroundColor = kWhiteColor;
    [_bgView addSubview:_line2];
    
    _style3View = [[RTFormAreaConditionStyle3View alloc] init];
    [_bgView addSubview:_style3View];
    
    
    _checkStatus = [[UIButton alloc]init];
    [self addSubview:_checkStatus];
    
    _line3 = [[UIView alloc] init];
    [self addSubview:_line3];
    
    _lowLimit = [[UIButton alloc] init];
    [self addSubview:_lowLimit];
    
    self.backgroundColor = [RTColor rtBg22TypeColor];
}

- (void)configOwnViews {
    
    _line1.backgroundColor = [RTColor rtBg25TypeColor];
    _line2.backgroundColor = [RTColor rtBg25TypeColor];
    _line3.backgroundColor = [RTColor rtBg27TypeColor];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    [_style1View configOwnViewsWidthInfo:info];
    [_style2View configOwnViewsWidthInfo:info];
    [_style3View configOwnViewsWidthInfo:info];
    
    [_checkStatus setBackgroundImage:[UIImage imageNamed:@"form_check_selected"] forState:UIControlStateNormal];
    [_lowLimit setBackgroundImage:[UIImage imageNamed:@"form_nohas"] forState:UIControlStateNormal];
    
}

- (void)relayoutFrameOfSubViews {
    
    [_bgView setSize:(CGSize){80,80}];
    [_bgView alignParentLeft];
    [_bgView alignParentTop];
    [_bgView scaleToParentRight];
    
    [_style1View setSize:(CGSize){80,80}];
    [_style1View alignParentLeft];
    [_style1View relayoutFrameOfSubViews];
    
    [_line1 setSize:(CGSize){1,80}];
    [_line1 layoutToRightOf:_style1View margin:2.];
    
    [_style2View setSize:(CGSize){90,80}];
    [_style2View layoutToRightOf:_line1];
    [_style2View relayoutFrameOfSubViews];
    
    [_line2 setSize:(CGSize){1,80}];
    [_line2 layoutToRightOf:_style2View margin:2.];
    
    [_style3View setSize:(CGSize){80,80}];
    [_style3View layoutToRightOf:_line2];
    [_style3View scaleToParentRight];
    [_style3View relayoutFrameOfSubViews];
    
    [_checkStatus setSize:(CGSize){25,25}];
    [_checkStatus layoutBelow:_bgView margin:10.];
    [_checkStatus alignParentLeftWithMargin:10.];
    
    [_line3 setSize:(CGSize){45,2}];
    [_line3 layoutToRightOf:_checkStatus margin:2.];
    [_line3 alignVerticalCenterOf:_checkStatus];
    
    [_lowLimit setSize:(CGSize){50,25}];
    [_lowLimit layoutToRightOf:_line3 margin:2.];
    [_lowLimit alignVerticalCenterOf:_line3];
}

@end


