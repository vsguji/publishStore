//
//  RTFormView.m
//  darongtong
//
//  Created by zy on 2017/12/11.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTFormView.h"
#import "UIView+Altar.h"
#import "RTButtonItemModel.h"
#import "RTFormButtonView.h"
#import "RTBaseModel+RTFormTableCell.h"
#import "RTLabelAndFieldModel.h" // lipeng 2017.12.19
#import "RTColor.h"
#import <QuartzCore/QuartzCore.h>
#import "RTPartnerTipView.h"
#import "ColorMacro.h"
#import "UtilsMacro.h"
#import "UIView+Altar.h"
#import "UILabel+Common.h"
#import "UIView+CustomAutoLayout.h"

@implementation RTFormTopLabView
- (void)addOwnViews {
    
    _fieldTopLab = [[UILabel alloc] init];
    [self addSubview:_fieldTopLab];
    
    _btmLine = [[UIImageView alloc] init];
    [self addSubview:_btmLine];
    _btmLine.hidden = YES;
}

- (void)configOwnViews {

    _fieldTopLab.font = FONT(LENGTH(14));
    _fieldTopLab.textAlignment = NSTextAlignmentLeft;
    _fieldTopLab.backgroundColor = kClearColor;
    
    UIImage *imgPattern1 = [UIImage imageNamed:@"form_line"];
    UIColor *colorPattern1 = [[UIColor alloc] initWithPatternImage:imgPattern1];
    [_btmLine setBackgroundColor:colorPattern1];
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormRowProtocol>)info {
    NSString *modelType = ((RTBaseModel *)info).modelType;
    
    if ([modelType containsString:@"RTFormSubCapacitivePartField1"]
        || [modelType containsString:@"RTPartnerFieldsProduct1"]) {
        _fieldTopLab.attributedText = [info rowTitle];
    }
    else if ([modelType containsString:@"RTProductSubFieldsProduct"]){
         _fieldTopLab.attributedText = [info rowTitle];
    }
    else if ([info respondsToSelector:@selector(fieldTopString)]) {
        _fieldTopLab.text = [info fieldTopString];
    }
    else {
         _fieldTopLab.textColor = [RTColor rtBg13TypeColor];
    }
    _fieldInfo = info;
    _fieldTopLab.textAlignment = NSTextAlignmentLeft;
}

- (void)relayoutFrameOfSubViews {
    
    [_fieldTopLab setSize:(CGSize){(14),(14)}];
    [_fieldTopLab alignParentLeftWithMargin:10];
    [_fieldTopLab alignParentTopWithMargin:4];
    [_fieldTopLab scaleToParentRightWithMargin:10];
    
    switch ([_fieldInfo fieldTopStringPosition]) {
        case kFiedlTopPositionLeft:
        {
            NSString *modelType = ((RTBaseModel *)_fieldInfo).modelType;
            if ([modelType containsString:@"RTFormSubCapacitivePartField1"]) {
                _fieldTopLab.textColor = [RTColor rtBg11TypeColor];
                if ([_fieldInfo respondsToSelector:@selector(fieldBgLayer)]) {
                    CAShapeLayer *maskLayer = [_fieldInfo fieldBgLayer];
                    [_fieldTopLab.layer insertSublayer:maskLayer atIndex:0];
                }
//                _fieldTopLab.textAlignment = NSTextAlignmentLeft;
            }
        }
            break;
        case kFiedlTopPositionMiddle:
            self.backgroundColor = kWhiteColor;
            _fieldTopLab.textColor = [RTColor rtSectionTitle];
            _fieldTopLab.textAlignment = NSTextAlignmentCenter;
            [_fieldTopLab setSize:(CGSize){(120),(14)}];
            [_fieldTopLab layoutParentHorizontalCenter];
            break;
        case kFiedlTopPositionRight:
            _fieldTopLab.textColor = kBlackColor;
            _fieldTopLab.textAlignment = NSTextAlignmentRight;
            break;
        case kFiedlTopPositionLeftOffSet:
            [_fieldTopLab alignParentLeftWithMargin:25.];
            break;
        default:
            break;
    }
    
    [_btmLine setSize:(CGSize){(1),(1)}];
    [_btmLine alignParentLeftWithMargin:10];
    [_btmLine scaleToParentRightWithMargin:10];
    [_btmLine alignParentBottom];
}

@end

@implementation RTFormFieldContentView

- (void)addOwnViews{
    _fieldContentTitle = [[RTFormLabel alloc] init];
     _fieldContentTitle.numberOfLines = 0;
    [self addSubview:_fieldContentTitle];
    
    _fieldContentDetail = [[RTFormLabel alloc] init];
    _fieldContentDetail.numberOfLines = 0;
    _fieldContentDetail.lineBreakMode = NSLineBreakByTruncatingTail;
    [self addSubview:_fieldContentDetail];
}

- (void)configOwnViews {
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    
    RTLabelAndFieldModel *fieldModel = (RTLabelAndFieldModel *)info;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.firstLineHeadIndent = 10;
    if ([((RTBaseModel *)info).modelType containsString:@"RTFormFieldsBrief5"]) {
        _fieldContentTitle.attributedText = [[NSAttributedString alloc] initWithString:fieldModel.labTitle
                                                                            attributes:@{
                                                                                         NSFontAttributeName:FONT(LENGTH(12.)),
                                                                                         NSForegroundColorAttributeName:kBlackColor
                                                                                        // NSParagraphStyleAttributeName:style
                                                                                         }];
        
        _fieldContentDetail.attributedText = [[NSAttributedString alloc] initWithString:fieldModel.fieldPlaceholder
                                                                             attributes:@{
                                                                                          NSFontAttributeName:FONT(LENGTH(12.)),
                                                                                          NSForegroundColorAttributeName:kGrayColor,
                                                                                          NSParagraphStyleAttributeName:style
                                                                                          }];
    }
    else {
       
        _fieldContentTitle.attributedText = [[NSAttributedString alloc] initWithString:fieldModel.fieldPlaceholder
                                                                       attributes:@{
                                                                                    NSFontAttributeName:FONT(LENGTH(12.)),
                                                                                    NSForegroundColorAttributeName:kGrayColor,
                                                                                    NSParagraphStyleAttributeName:style
                                                                                    }];
    }
    _fieldInfo = info;
}

- (void)relayoutFrameOfSubViews {
    
    if ([((RTBaseModel *)_fieldInfo).modelType containsString:@"RTFormFieldsBrief5"]) {
        [_fieldContentTitle setSize:(CGSize){(12.),(12.)}];
        [_fieldContentTitle alignParentLeftWithMargin:2.];
        [_fieldContentTitle scaleToParentRightWithMargin:2.];
        
        [_fieldContentDetail layoutBelow:_fieldContentTitle margin:2.];
        [_fieldContentDetail alignLeft:_fieldContentTitle];
        [_fieldContentDetail scaleToParentRightWithMargin:2.];
        [_fieldContentDetail scaleToParentBottomWithMargin:2.];
         _fieldContentTitle.verticalAlignment = RTAlignmentMiddle;
         _fieldContentDetail.verticalAlignment = RTAlignmentMiddle;
    }
    else {
        _fieldContentTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        [_fieldContentTitle marginParentWithEdgeInsets:UIEdgeInsetsZero];
        _fieldContentDetail.hidden = YES;
        _fieldContentTitle.verticalAlignment = RTAlignmentTop;
    }
}

@end

@implementation RTPlaceholderVerticalAlignment

- (void)drawPlaceholderInRect:(CGRect)rect {
   // [super drawPlaceholderInRect:CGRectMake(0, self.bounds.size.height * 0.5 - 0.5, 0, 0)];
    [super drawPlaceholderInRect:rect];
}

@end

@implementation RTFormFieldView

- (void)addOwnViews {
    [super addOwnViews];
    _field = [[RTPlaceholderVerticalAlignment alloc] init];
    [self addSubview:_field];
}

- (void)configOwnViews {
    [super configOwnViews];
    [_field setBackground:[UIImage imageNamed:@"form_field_bg"]];
}


- (void)configSuperViewsWidthInfo:(id<RTFormProtocol>)info {
    if ([info isKindOfClass:[RTButtonItemModel class]]) {
        _field.background = nil;
        RTButtonItemModel *buttonModel = (RTButtonItemModel *)info;
        _field.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _field.enabled = NO;
        _field.textAlignment = NSTextAlignmentCenter;
        _field.text = buttonModel.labStr;
    }
}

- (void)configOwnViewsWidthInfo:(id<RTFormFieldProtocol,RTFormRowProtocol,RTFormFieldsProtocol>)info {
    [super configOwnViewsWidthInfo:info];
    // 文本框头
    // _fieldTopLab.text = [info fieldTopString];
    // 文本框
    CGFloat fieldWith = kScreenW - ([info leftMagin] + [self leftMagin]) * 2;
    if ([[info fieldModelType] isEqualToString:@"RTFormFieldsBrief1"]) {
        UIView *subview = [_field viewWithTag:1000];
        if (subview) {
            [subview removeFromSuperview];
        }
        RTFormFieldContentView *fieldContentView = [[RTFormFieldContentView alloc] init];
        fieldContentView.tag = 1000;
        [_field addSubview:fieldContentView];
        [fieldContentView configOwnViewsWidthInfo:info];
        [fieldContentView setFrameAndLayout:CGRectMake([info leftMagin], [self verticalMargin], fieldWith,
                                                       [(RTBaseModel *)info formTableViewHeight] - [self verticalMargin])];
    }
    else if ([[info fieldModelType] isEqualToString:@"RTFormFieldsBrief2"]){
        UIView *subview = [_field viewWithTag:1000];
        if (subview) {
            [subview removeFromSuperview];
        }
        RTFormFieldContentView *fieldContentView = [[RTFormFieldContentView alloc] init];
        fieldContentView.tag = 1000;
        [_field addSubview:fieldContentView];
        [fieldContentView configOwnViewsWidthInfo:info];
        [fieldContentView setFrameAndLayout:CGRectMake([info leftMagin], [self verticalMargin], fieldWith,
                                                       [(RTBaseModel *)info formTableViewHeight] - [self verticalMargin])];
    }
    else if ([[info fieldModelType] isEqualToString:@"RTFormFieldsBrief5"]){
        NSArray *fields = [info formFields];
        for (NSInteger index = 0 ; index < fields.count; index++) {
            UIView *subview = [_field viewWithTag:1000 + index];
            if (subview) {
                [subview removeFromSuperview];
            }
        }
         NSInteger tag = 0;
         CGFloat originY = [self verticalMargin];
        for (RTLabelAndTextModel *fieldModel in fields) {
            RTFormFieldContentView *fieldContentView = [[RTFormFieldContentView alloc] init];
            fieldContentView.tag = 1000 + tag;
            [_field addSubview:fieldContentView];
            [fieldContentView configOwnViewsWidthInfo:fieldModel];
            [fieldContentView setFrameAndLayout:CGRectMake([fieldModel leftMagin], originY, fieldWith,
                                                           [(RTLabelAndTextModel *)info rowHeight])];
            originY += [(RTLabelAndTextModel *)info rowHeight] ;//+ [fieldModel verticalMargin];
            tag++;
        }
    }
    else{
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.firstLineHeadIndent = 10;
        style.lineBreakMode =  NSLineBreakByTruncatingTail;
        _field.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[info fieldPlaceHolder]
                                                                       attributes:@{
                                                                                    NSFontAttributeName:FONT(LENGTH(12.)),
                                                                                    NSForegroundColorAttributeName:kGrayColor,
                                                                                    NSParagraphStyleAttributeName:style
                                                                                    }];
    }
  
    if ([info leftView]) {
        _field.leftView = [info leftView];
        _field.leftViewMode = UITextFieldViewModeAlways;
    }
    else {
        _field.leftView = nil;
        _field.leftViewMode = UITextFieldViewModeNever;
    }
    
    if ([info rightView]) {
        _field.rightView = [info rightView];
        _field.rightViewMode = UITextFieldViewModeAlways;
    }
    else{
        _field.rightView = nil;
        _field.rightViewMode = UITextFieldViewModeNever;
    }
    _btmLine.hidden = [info btmLineVisible];
    _fieldInfo = info;
}

- (void)relayoutFrameOfSubViews {
    [super relayoutFrameOfSubViews];
    RTBaseModel *model = (RTBaseModel *)_fieldInfo;
    if (model && [model.modelType isEqualToString:@"RTFormFieldsBrief1"]) {
        [_field setSize:(CGSize){(82.),(82.)}];
    }
    else if (model && [model.modelType isEqualToString:@"RTFormFieldsBrief2"]){
        [_field setSize:(CGSize){(82.),(82.)}];
    }
    else if (model && [model.modelType isEqualToString:@"RTFormFieldsBrief5"]){
        [_field setSize:(CGSize){(251.),(251.)}];
    }
    else if ([model isKindOfClass:[RTFieldAndGroupModel class]]){
         // 运营合伙人资本·组织结构类别
         [_field setSize:(CGSize){(31.),(31.)}];
    }
    else{
          [_field setSize:(CGSize){(44.),(44.)}];
    }
    
    [_field layoutBelow:_fieldTopLab margin:10.];
    [_field alignParentLeftWithMargin:10.];
    [_field scaleToParentRightWithMargin:10.];
    
    // 运营合伙人资本·组织结构类别
    if ([model isKindOfClass:[RTFieldAndGroupModel class]] && ((RTFieldAndGroupModel *)model).items) {
        [self drawButtonLayerView:_field ByColor:kGrayColor];
    }
}

// private

- (void )drawButtonLayerView:(UIView *)targetView ByColor:(UIColor *)color  {
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = color.CGColor;
    border.fillColor = [UIColor clearColor].CGColor;
    border.path = [UIBezierPath bezierPathWithRoundedRect:targetView.bounds cornerRadius:CGRectGetHeight(targetView.bounds) / 2].CGPath;
    border.frame = targetView.bounds;
    border.lineWidth = 1.f;
    border.lineDashPattern = @[@4, @2];
    [targetView.layer addSublayer:border];
}

@end

@implementation RTFormAreaCustomerFieldView

- (void)addOwnViews {
    [super addOwnViews];
    _topBgImg = [[UIView alloc] init];
    [self addSubview:_topBgImg];
    _field = [[RTPlaceholderVerticalAlignment alloc] init];
    [self addSubview:_field];
    [self insertSubview:_fieldTopLab aboveSubview:_topBgImg];
}

- (void)configOwnViews {
    [super configOwnViews];
    _field.borderStyle = UITextBorderStyleRoundedRect;
    _topBgImg.backgroundColor = [RTColor rtBg26TypeColor];
    self.backgroundColor = [RTColor rtBg22TypeColor];
    _topBgImg.layer.cornerRadius = 26.;
    _topBgImg.layer.masksToBounds = YES;
}


- (void)configSuperViewsWidthInfo:(id<RTFormProtocol>)info {
   
}

- (void)configOwnViewsWidthInfo:(id<RTFormFieldProtocol,RTFormRowProtocol,RTFormFieldsProtocol>)info {
    [super configOwnViewsWidthInfo:info];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.firstLineHeadIndent = 10;
    style.lineBreakMode =  NSLineBreakByTruncatingTail;
    style.alignment = NSTextAlignmentCenter;
    _field.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[info fieldPlaceHolder]
                                                                   attributes:@{
                                                                                NSFontAttributeName:FONT(LENGTH(12.)),
                                                                                NSForegroundColorAttributeName:kGrayColor,
                                                                                NSParagraphStyleAttributeName:style
                                                                                }];

    
    if ([info leftView]) {
        _field.leftView = [info leftView];
        _field.leftViewMode = UITextFieldViewModeAlways;
    }
    else {
        _field.leftView = nil;
        _field.leftViewMode = UITextFieldViewModeNever;
    }
    
    if ([info rightView]) {
        _field.rightView = [info rightView];
        _field.rightViewMode = UITextFieldViewModeAlways;
    }
    else{
        _field.rightView = nil;
        _field.rightViewMode = UITextFieldViewModeNever;
    }
    _btmLine.hidden = [info btmLineVisible];
    _fieldInfo = info;
    _fieldTopLab.textAlignment = NSTextAlignmentCenter;
}

- (void)relayoutFrameOfSubViews {
    [super relayoutFrameOfSubViews];
    
    [_topBgImg setSize:(CGSize){216,52}];
    [_topBgImg alignParentTop];
    [_topBgImg layoutParentHorizontalCenter];
    
    [_fieldTopLab layoutParentHorizontalCenter];
    [_fieldTopLab alignVerticalCenterOf:_topBgImg];
    
    [_field setSize:(CGSize){(44.),(44.)}];
    [_field layoutBelow:_topBgImg];
    [_field alignParentLeftWithMargin:10.];
    [_field scaleToParentRightWithMargin:10.];
}

@end

@implementation RTFormAreaMapView

- (void)addOwnViews {
    [super addOwnViews];
    _topBgImg = [[UIView alloc] init];
    [self addSubview:_topBgImg];
    
    [self insertSubview:_fieldTopLab aboveSubview:_topBgImg];
    
    _commit = [[UIButton alloc] init];
    [_commit setBackgroundColor:[RTColor rtBgBtnTypeColor]];
    _commit.titleLabel.font = FONT(LENGTH(14.));
    [self addSubview:_commit];
    
    _reset = [[UIButton alloc] init];
    [_reset setBackgroundColor:[RTColor rtBgBtnTypeColor]];
    _reset.titleLabel.font = FONT(LENGTH(12.));
    [self addSubview:_reset];
    
    _line = [[UIView alloc] init];
    _line.backgroundColor = [RTColor rtBgBtnTypeColor];
    [self addSubview:_line];
}

- (void)configOwnViews {
    [super configOwnViews];
    _topBgImg.backgroundColor = [RTColor rtBg26TypeColor];
    self.backgroundColor = [RTColor rtBg22TypeColor];
   // _mapView.backgroundColor = kClearColor;
    _topBgImg.layer.cornerRadius = 26.;
    _topBgImg.layer.masksToBounds = YES;
    _commit.layer.cornerRadius = 5.;
    _commit.layer.masksToBounds = YES;
    _reset.layer.cornerRadius = 5.;
    _reset.layer.masksToBounds = YES;
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info {
    [super configOwnViewsWidthInfo:info];
    _fieldTopLab.textAlignment = NSTextAlignmentCenter;
    [_commit setTitle:@"确定" forState:UIControlStateNormal];
    [_reset setTitle:@"重置" forState:UIControlStateNormal];
}

- (void)relayoutFrameOfSubViews {
    [super relayoutFrameOfSubViews];
    [_topBgImg setSize:(CGSize){216,52}];
    [_topBgImg alignParentTop];
    [_topBgImg layoutParentHorizontalCenter];
    
    [_fieldTopLab layoutParentHorizontalCenter];
    [_fieldTopLab alignVerticalCenterOf:_topBgImg];
    
    [_commit setSize:(CGSize){120,45}];
   // [_commit layoutBelow:_mapView margin:10.];
    [_commit alignParentBottomWithMargin:80.];
    [_commit layoutParentHorizontalCenter];
    
    [_reset setSize:(CGSize){50,25}];
    [_reset alignParentRightWithMargin:30.];
    [_reset layoutBelow:_commit margin:-20.];
    
    [_line setSize:(CGSize){1,1}];
    [_line layoutToRightOf:_reset];
    [_line alignVerticalCenterOf:_reset];
    [_line scaleToParentRight];
}

@end

@implementation RTFormFieldAndButtonGroupView

- (void)addOwnViews {
    _fieldView = [[RTFormFieldView alloc] init];
    [self addSubview:_fieldView];
}

- (void)configOwnViews {
    
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormViewProtocol>)info {
    [_fieldView configOwnViewsWidthInfo:info];

    NSArray *items = [info groupItems];
    
    NSMutableArray *buttonViews = [NSMutableArray arrayWithCapacity:items.count];
    
    for (RTButtonItemModel<RTFormRowProtocol> *subItem in items) {
        RTFormButtonView *subButton = [[RTFormButtonView alloc] init];
        [self addSubview:subButton];
        [subButton configOwnViewsWidthInfo:subItem];
        [_fieldView configSuperViewsWidthInfo:subItem];
        CGFloat width = [subItem buttonWidth];
        [subButton setFrameAndLayout:CGRectMake(0,0, width, [subItem formTableViewHeight])];
        [buttonViews addObject:subButton];
    }
    
    if (items) {
        if (items.count == 1) {
            RTButtonItemModel *item = items[0];
            [_fieldView configSuperViewsWidthInfo:item];
            RTFormButtonView *subButton = [[RTFormButtonView alloc] init];
            [self addSubview:subButton];
            [subButton configOwnViewsWidthInfo:item];
            CGFloat width = [item buttonWidth] * 2;
            CGFloat originX = (kScreenW - width) / 2;
            [subButton setFrameAndLayout:CGRectMake(originX,80.,width, [item formTableViewHeight])];
        }
        else{

            NSInteger rows = buttonViews.count / 3;
            CGFloat originY = 65.;
            for (NSInteger i = 1; i <= rows; i++) {
                NSArray *colArray = [buttonViews subarrayWithRange:NSMakeRange(3 * (i - 1), 3)];
                CGFloat buttonHeight = 0.;
                CGFloat originx = [self leftMagin];
                for (NSInteger j = 1; j <= colArray.count ; j++ ) {
                    RTFormButtonView<RTFormRowProtocol> *button = colArray[j-1];
                    //TCAVIMLog(@"button title :%@",[button bgTitle]);
                    CGRect btnBounds = button.bounds;
                    buttonHeight = CGRectGetHeight(btnBounds);
                    button.frame = CGRectMake(originx, originY, CGRectGetWidth(btnBounds), CGRectGetHeight(btnBounds));
                    originx += (CGRectGetWidth(btnBounds) + [self horizontalMargin]);
                }
                originY += (buttonHeight +  [self verticalMargin]);
            }
            
            NSArray *small3 = [buttonViews subarrayWithRange:NSMakeRange(3 * rows, items.count - 3 * rows)];
            CGFloat originx = [self leftMagin];
            NSInteger i = 0;
            for (RTFormButtonView<RTFormRowProtocol> *button in small3) {
                CGRect btnBounds = button.bounds;
                button.frame = CGRectMake(originx + (CGRectGetWidth(btnBounds) + [self horizontalMargin]) * i , originY, CGRectGetWidth(btnBounds), CGRectGetHeight(btnBounds));
                i++;
            }
        }
    }
}

- (void)relayoutFrameOfSubViews {
    [_fieldView setSize:(CGSize){(60),(60)}];
    [_fieldView alignParentLeft];
    [_fieldView scaleToParentRight];
    [_fieldView relayoutFrameOfSubViews];
}

@end


@implementation RTFormTextView

- (void)addOwnViews {
    _labTop = [[UILabel alloc] init];
    [self addSubview:_labTop];
    
    _textView = [[UITextView alloc] init];
    [self addSubview:_textView];
    
    _editView = [[RTPartnerEditView alloc] init];
    [_textView addSubview:_editView];
}

- (void)configOwnViews {
    _labTop.numberOfLines = 4;
    _textView.editable = NO;
    _textView.layer.cornerRadius = 5.;
    _textView.layer.masksToBounds = YES;
}

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol,RTFormViewProtocol,RTFormFieldProtocol>)info {
    if ([info respondsToSelector:@selector(rowTitle)]) {
       _labTop.attributedText = [info rowTitle];
    }
    if ([info respondsToSelector:@selector(fieldAttriPlaceHolder)]) {
       _textView.attributedText = [info fieldAttriPlaceHolder];
    }
    [_editView setConfigureTypeBgColor:[RTColor rtBg4TypeColor]];
}

- (void)relayoutFrameOfSubViews {
    
    [_labTop setSize:(CGSize){(14.),(60.)}];
    [_labTop alignParentLeftWithMargin:10.];
    [_labTop scaleToParentRightWithMargin:10.];
    
    [_textView layoutBelow:_labTop margin:(8.)];
    [_textView alignParentLeft];
    [_textView scaleToParentRight];
    [_textView scaleToParentBottom];
    
    [_editView setSize:(CGSize){(60.),(30.)}];
    [_editView alignParentRightWithMargin:10.];
    [_editView alignParentBottomWithMargin:10.];
    [_editView relayoutFrameOfSubViews];
}

@end


@implementation  RTButtonGroupView

- (void)addOwnViews {
    [super addOwnViews];
}

- (void)configOwnViews {
    [super configOwnViews];
     _btmLine.hidden = NO;
}

- (void)configSuperViewsWidthInfo:(id<RTFormRowProtocol>)info {
    _fieldTopLab.attributedText = [info sectionTitle];
   
}

- (void)configOwnViewsWidthInfo:(id<RTFormViewProtocol>)info {
    _btnsProtocol = info;
    _fieldTopLab.text = [info rowString];
    _btmLine.hidden = NO;
    if ([info respondsToSelector:@selector(groupItems)]) {
        NSArray *subItems = [info groupItems] ? [info groupItems] : @[];
        NSMutableArray *buttons =[NSMutableArray arrayWithCapacity:subItems.count];
        for (RTButtonItemModel<RTFormRowProtocol> *subItem in subItems) {
            RTFormButtonView *subButton = [[RTFormButtonView alloc] init];
            [self addSubview:subButton];
            [subButton configOwnViewsWidthInfo:subItem];
            CGFloat width = [subItem buttonWidth];
            [subButton setFrameAndLayout:CGRectMake(0,0, width, [subItem formTableViewHeight])];
            [buttons addObject:subButton];
        }
        _fButtons = [buttons copy];
    }
}

- (void)relayoutFrameOfSubViews {
    [super relayoutFrameOfSubViews];
    [_fieldTopLab alignParentLeftWithMargin:10];
    [_fieldTopLab scaleToParentRightWithMargin:10];
    if ([_btnsProtocol layoutHorizontalOrVertical]) { // 默认水平方向
        if ([_btnsProtocol layoutNumBtnsOfRows] == 2) {
            if (_fButtons.count == 2) {
                NSInteger rows = _fButtons.count / 2;
                CGFloat originY = 30.;
                for (NSInteger i = 1; i <= rows; i++) {
                    NSArray *colArray = [_fButtons subarrayWithRange:NSMakeRange(1 * (i - 1), 2)];
                    CGFloat buttonHeight = 0.;
                    CGFloat originx = (kScreenW -  [self leftMagin] * 2 - [self padding] - [_btnsProtocol rowTitlesWidth]) / 2;
                    for (NSInteger j = 1; j <= colArray.count ; j++ ) {
                        RTFormButtonView<RTFormRowProtocol> *button = colArray[j-1];
                     //  TCAVIMLog(@"button title :%@",[button bgTitle]);
                        CGRect btnBounds = button.bounds;
                        buttonHeight = CGRectGetHeight(btnBounds);
                        button.frame = CGRectMake(originx, originY, CGRectGetWidth(btnBounds), CGRectGetHeight(btnBounds));
                        originx += (CGRectGetWidth(btnBounds) + [self padding]);
                    }
                    originY += (buttonHeight +  [self verticalMargin] );
                }
            }
            else{
                NSInteger rows = _fButtons.count / 2;
                CGFloat originY = 30.;
                for (NSInteger i = 1; i <= rows; i++) {
                    NSArray *colArray = [_fButtons subarrayWithRange:NSMakeRange(2 * (i - 1), 2)];
                    CGFloat buttonHeight = 0.;
                    CGFloat originx = [self leftMagin];
                    for (NSInteger j = 1; j <= colArray.count ; j++ ) {
                        RTFormButtonView<RTFormRowProtocol> *button = colArray[j-1];
                      //  TCAVIMLog(@"button title :%@",[button bgTitle]);
                        CGRect btnBounds = button.bounds;
                        buttonHeight = CGRectGetHeight(btnBounds);
                        button.frame = CGRectMake(originx, originY, CGRectGetWidth(btnBounds), CGRectGetHeight(btnBounds));
                        originx += (CGRectGetWidth(btnBounds) + [self horizontalMargin]);
                    }
                    originY += (buttonHeight +  [self verticalMargin] );
                }
            }
        }
        else if ([_btnsProtocol layoutNumBtnsOfRows] == 3){
            NSInteger rows = _fButtons.count / 3;
            CGFloat originY = 30.;
            for (NSInteger i = 1; i <= rows; i++) {
                NSArray *colArray = [_fButtons subarrayWithRange:NSMakeRange(3 * (i - 1), 3)];
                CGFloat buttonHeight = 0.;
                CGFloat originx = [self leftMagin];
                for (NSInteger j = 1; j <= colArray.count ; j++ ) {
                    RTFormButtonView<RTFormRowProtocol> *button = colArray[j-1];
                  //  TCAVIMLog(@"button title :%@",[button bgTitle]);
                    CGRect btnBounds = button.bounds;
                    buttonHeight = CGRectGetHeight(btnBounds);
                    button.frame = CGRectMake(originx, originY, CGRectGetWidth(btnBounds), CGRectGetHeight(btnBounds));
                    originx += (CGRectGetWidth(btnBounds) + [self horizontalMargin]);
                }
                 originY += (buttonHeight +  [self verticalMargin]);
            }
            
            NSArray *small3 = [_fButtons subarrayWithRange:NSMakeRange(3 * rows, _fButtons.count - 3 * rows)];
            CGFloat originx = [self leftMagin];
            NSInteger i = 0;
            for (RTFormButtonView<RTFormRowProtocol> *button in small3) {
                 CGRect btnBounds = button.bounds;
                button.frame = CGRectMake(originx + (CGRectGetWidth(btnBounds) + [self horizontalMargin]) * i , originY, CGRectGetWidth(btnBounds), CGRectGetHeight(btnBounds));
                i++;
            }
        }
    }
    else{
        NSInteger i = 0;
        CGFloat originx = [_btnsProtocol leftMagin];
        CGFloat buttonWidth = kScreenW - originx * 2;
        for (RTFormButtonView<RTFormRowProtocol> *button in _fButtons) {
            CGRect btnBounds = button.bounds;
            button.frame = CGRectMake(originx, (CGRectGetHeight(btnBounds) + [button verticalMargin]) * i + [_btnsProtocol itemTitleHeight] + [_btnsProtocol verticalMargin], buttonWidth, CGRectGetHeight(btnBounds));
            [button relayoutFrameOfSubViews];
            i++;
        }
   }
}

- (CGFloat)leftMagin {
    return 14.;
}

- (CGFloat)padding {
    return 15.;
}

@end
