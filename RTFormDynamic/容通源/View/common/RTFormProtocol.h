//
//  RTFormProtocol.h
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RTBaseModel.h" // lipeng 2017.12.11

typedef enum : NSUInteger {
    RTFormDateTime = 0,
    RTFormMoney
} RTFormComponent;

@protocol RTFormProtocol <NSObject>
@optional
- (id)initWithLeftCornerTitle:(NSString *)title;
- (BOOL)formIsCheck;
- (NSString *)fieldTopString;
- (CGFloat)verticalMargin;
- (CGFloat)horizontalMargin;
- (CGFloat)leftMagin;
- (CGFloat)padding;
@end

@protocol RTFormFieldsProtocol <NSObject>
@optional
- (NSArray *)formFields;
@end

@protocol RTFormSectionProtocol <NSObject>
@optional
- (UIView *)leftView;
- (UIView *)rightView;
- (UIImage *)leftIcon;
- (UIImage *)rightIcon;
- (UIImage *)sectionIcon;
- (NSAttributedString *)sectionTitle;
@end

@protocol RTFormFieldAttriProtocol<NSObject>
@optional
- (CGFloat)fieldAttriStart;
- (CGFloat)fieldAttriWidth;
- (CAShapeLayer *)fieldBgLayer;
@end

@protocol RTFormRowProtocol <NSObject,RTFormFieldAttriProtocol>
@optional
- (NSString *)rowString;
- (NSAttributedString *)sectionTitle;
- (NSAttributedString *)rowTitle;
- (NSAttributedString *)rowDetail;
- (CGFloat)rowHeight;
- (CGFloat)topMarginHeight;
- (CGFloat)rowTitlesWidth;
- (BOOL)btmLineVisible;
- (NSInteger)fieldTopStringPosition;
- (NSString *)fieldModelType;
@end

@protocol RTFormSubButtonsProtocol<NSObject>
@optional
- (BOOL)buttonIsSelected;
- (CGFloat)buttonWidth;
- (NSString *)buttonTitleColor;
- (NSString *)buttonBgColor;
- (NSString *)buttonTitle;
- (UIImage *)buttonNormalIcon;
- (UIImage *)buttonHightlIcon;
- (NSAttributedString *)buttonAttriTitle;
@end

@protocol RTFormFieldProtocol<RTFormProtocol,RTFormFieldsProtocol>
- (UIView *)leftView;
- (UIView *)rightView;
@optional
- (NSString *)fieldPlaceHolder;
- (NSAttributedString *)fieldAttriPlaceHolder;
- (UIView *)inputView;
@end


@protocol RTFormViewProtocol<RTFormProtocol,RTFormSectionProtocol,RTFormRowProtocol,RTFormSubButtonsProtocol>
- (BOOL)layoutHorizontalOrVertical;
- (NSInteger)layoutNumBtnsOfRows;
- (NSArray *)groupItems;
- (CGFloat)itemTitleHeight;
@end
