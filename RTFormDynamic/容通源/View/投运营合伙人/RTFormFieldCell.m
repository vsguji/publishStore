//
//  RTFormFieldCell.m
//  darongtong
//
//  Created by zy on 2017/12/11.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTFormFieldCell.h"
#import "RTFormView.h"
#import "RTBaseView.h"
#import "UIView+Altar.h"
#import "RTFormProtocol.h"
#import "RTLabelAndFieldModel.h" // lipeng 2017.12.11
#import "RTBaseModel+RTFormTableCell.h"
#import "RTColor.h"
#import "UIView+CustomAutoLayout.h"
#import "UIColor+expanded.h"
#import "UtilsMacro.h"
#import "ColorMacro.h"

@implementation RTFormFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    _bgView = [[UIView alloc] init];
    [self addSubview:_bgView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _headerIcon.hidden = YES;
    _userTitle.hidden = YES;
    _userNick.hidden = YES;
    
    [_bgView alignParentTopWithMargin:20];
    [_bgView scaleToParentLeft];
    [_bgView scaleToParentRight];
    [_bgView scaleToParentBottom];
}

- (void)setCellWithModel:(RTBaseModel<RTFormFieldsProtocol> *)model {
    NSString *modelType = model.modelType;
    if ([modelType isEqualToString:@"RTPartnerFieldsCustomer"]) {
        _bgView.backgroundColor = kClearColor;
    }
    else if([modelType isEqualToString:@"RTFormAreaCustomer"]){
        _bgView.backgroundColor = [RTColor rtBg22TypeColor];
        self.backgroundColor = [RTColor rtBg22TypeColor];
    }else{
        _bgView.backgroundColor = [UIColor colorWithHexString:@"0xf4f4f4"];
    }
    
    NSArray *fields = [model formFields];
  //  NSMutableArray *fieldViews = [NSMutableArray arrayWithCapacity:10];
    
    if ([modelType isEqualToString:@"RTFormAreaCustomer"]) {
        CGFloat originY = 0.;
        for (RTLabelAndFieldModel<RTFormFieldProtocol> *itemField in fields) {
            CGFloat formHeight = [itemField formTableViewHeight];
            if ([itemField.modelType isEqualToString:@"RTAreaFields1"]) {
                RTFormAreaCustomerFieldView *fieldView = [[RTFormAreaCustomerFieldView alloc] init];
                [_bgView addSubview:fieldView];
                [fieldView configOwnViewsWidthInfo:itemField];
                [fieldView setFrameAndLayout:CGRectMake(0, originY , kScreenW, formHeight)];
    //            [fieldViews addObject:fieldView];
            }
            else if ([itemField.modelType isEqualToString:@"RTAreaFieldsLocation"]){
                RTFormAreaMapView *mapView = [[RTFormAreaMapView alloc] init];
                [_bgView addSubview:mapView];
                [mapView configOwnViewsWidthInfo:itemField];
                [mapView setFrameAndLayout:CGRectMake(0, originY , kScreenW, formHeight)];
            }
            originY += formHeight;
        }
    }
    else {
        int i = 0;
        for (RTLabelAndFieldModel<RTFormFieldProtocol> *itemField in fields) {
            CGFloat formHeight = [itemField formTableViewHeight];
            RTFormFieldView *fieldView = [[RTFormFieldView alloc] init];
            [_bgView addSubview:fieldView];
            [fieldView configOwnViewsWidthInfo:itemField];
            [fieldView setFrameAndLayout:CGRectMake(0,formHeight * i , kScreenW, formHeight)];
      //      [fieldViews addObject:fieldView];
            i++;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
@end

@implementation RTFormFieldStyle2Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setCellWithModel:(RTBaseModel<RTFormFieldsProtocol> *)model {
    
    NSArray *fields = [model formFields];
    NSMutableArray *fieldViews = [NSMutableArray arrayWithCapacity:10];
    CGFloat originY = 0.;
    for (RTFieldAndGroupModel<RTFormFieldProtocol> *itemField in fields) {
        CGFloat formHeight = [itemField formTableViewHeight];
        if (itemField.items) {
            RTFormFieldAndButtonGroupView *fieldAndGroup = [[RTFormFieldAndButtonGroupView alloc] init];
            [self addSubview:fieldAndGroup];
            [fieldAndGroup configOwnViewsWidthInfo:itemField];
            [fieldAndGroup setFrameAndLayout:CGRectMake(0,originY, kScreenW, formHeight)];
        }
        else{
            RTFormFieldView *fieldView = [[RTFormFieldView alloc] init];
            [self addSubview:fieldView];
            [fieldView configOwnViewsWidthInfo:itemField];
            [fieldView setFrameAndLayout:CGRectMake(0,originY , kScreenW, formHeight)];
            [fieldViews addObject:fieldView];
        }
        originY += formHeight;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end


@implementation RTFormFieldStyle3Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)loadViews {
    [super loadViews];
    
    _fieldTop = [[UILabel alloc] init];
    _fieldTop.font = FONT(LENGTH(14.));
    [self addSubview:_fieldTop];
    
    _bgView = [[UIView alloc] init];
    [self addSubview:_bgView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
     _bgView.backgroundColor = [UIColor colorWithHexString:@"0xf4f4f4"];
    _headerIcon.hidden = YES;
    _userTitle.hidden = YES;
    _userNick.hidden = YES;
    
    [_fieldTop setSize:(CGSize){LENGTH(14.),LENGTH(14.)}];
    [_fieldTop alignParentLeftWithMargin:10.];
    [_fieldTop alignParentTopWithMargin:2.];
    [_fieldTop scaleToParentRightWithMargin:10.];
    
    [_bgView alignParentTopWithMargin:20.];
    [_bgView scaleToParentLeft];
    [_bgView scaleToParentRight];
    [_bgView scaleToParentBottom];
}

- (void)setCellWithModel:(RTBaseModel<RTFormFieldsProtocol,RTFormRowProtocol> *)model {
    if (model) {
        RTLabelAndFieldModels4 *field4Model = (RTLabelAndFieldModels4 *)model;
        NSArray *titleFields = [field4Model formFields];
        if (titleFields) {
            RTTitleAndFieldsModel *tField = (RTTitleAndFieldsModel *)titleFields[0];
            _fieldTop.attributedText = [tField rowTitle];
            
            NSArray *fields = [tField formFields];
            NSMutableArray *fieldViews = [NSMutableArray arrayWithCapacity:10];
            int i = 0;
            for (RTLabelAndFieldModel<RTFormFieldProtocol> *itemField in fields) {
                CGFloat formHeight = [itemField formTableViewHeight];
                RTFormFieldView *fieldView = [[RTFormFieldView alloc] init];
                [_bgView addSubview:fieldView];
                [fieldView configOwnViewsWidthInfo:itemField];
                [fieldView setFrameAndLayout:CGRectMake(0.,formHeight * i , kScreenW , formHeight)];
                [fieldViews addObject:fieldView];
                i++;
            }
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end

