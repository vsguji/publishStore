//
//  HshsMenuView.h
//  darongtong
//
//  Created by liuxin on 2017/6/28.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPMenuView : UIView
{
    float v_h;
    UIView * backView;
}
@property(nonatomic,strong)UIView *BtnbgView;
@property(nonatomic,strong)NSArray * array;
@property (nonatomic,copy)void (^blockSelectType)(UIButton *);
- (instancetype)initWithDataArray:(NSArray *)arr;
- (void)show;
- (void)hide;
@end
