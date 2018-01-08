//
//  WZCHome_ThridShaiAreaView.h
//  darongtong
//
//  Created by zy on 2017/5/24.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentLocationSelectedView : UIView


@property (nonatomic,copy)void (^blockThirdChangeAreaBtn)();

@property (nonatomic,copy)void (^blockThirdGoCirBtn)();


@property (nonatomic,copy)void (^changeAddressBlock)(UIButton *);
@property(nonatomic, copy) void (^jumpAddressList)();


@property (nonatomic,copy)void (^searchClick)();//点击查询按钮

@property (nonatomic)CGFloat sliderValue;
@property(nonatomic,strong)UILabel *labelString1;
@property(nonatomic,strong)UILabel *labelString2;
@property(nonatomic,strong)UILabel *labelString3;
@property(nonatomic,strong)UIButton *addressTitleBtn0;
@property(nonatomic,strong)UITextField *addressDetailTextfield1;
@property(nonatomic,strong)UITextField *addressTextfield0;

@property (nonatomic,strong)UIImageView *diYuImgage;
@end
