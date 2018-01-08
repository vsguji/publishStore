//
//  NewShopInLocationTypeView.m
//  darongtong
//
//  Created by xie on 17/12/18.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopInLocationTypeView.h"
@interface NewShopInLocationTypeView()
@property (strong, nonatomic) IBOutlet UIButton *oftenBtn;

@property (strong, nonatomic) IBOutlet UIButton *shopOfficeBtn;
@property (strong, nonatomic) IBOutlet UIButton *workCommunityBtn;

@property (strong, nonatomic) IBOutlet UIButton *shopFenZhiBtn;

@property (strong, nonatomic) IBOutlet UILabel *oftenLabel;

@property (strong, nonatomic) IBOutlet UILabel *shopAllLabel;

@property (strong, nonatomic) IBOutlet UILabel *workCommunity;
@property (strong, nonatomic) IBOutlet UILabel *shopFenzhiLabel;

@end


@implementation NewShopInLocationTypeView

- (void) awakeFromNib{
    [super awakeFromNib];
    
    NSArray* btnArrays = @[_oftenBtn,_workCommunityBtn,_shopFenZhiBtn,_shopOfficeBtn];
    NSArray* labelArrays = @[_oftenLabel,_workCommunity,_shopFenzhiLabel,_shopAllLabel];
    for(int  i = 0;i < btnArrays.count;i++){
        UIButton* btn = btnArrays[i];
        UILabel* locationLable = labelArrays[i];
        locationLable.tag = 40+i;
       btn.tag = i;
       [btn setImage:[UIImage imageNamed:@"newshop_红色勾"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    _oftenBtn.selected = YES;
    _oftenLabel.textColor = [UIColor redColor];
   

    
}

#pragma  mark -- 单选地理位置 --
- (void) clickBtn:(UIButton*) btn{
    NSArray* btnArrays = @[_oftenBtn,_workCommunityBtn,_shopFenZhiBtn,_shopOfficeBtn];
    NSArray* labelArrays = @[_oftenLabel,_workCommunity,_shopFenzhiLabel,_shopAllLabel];
    for(int  i = 0;i < btnArrays.count;i++){
        UIButton* btn = btnArrays[i];
        UILabel* locationLable = labelArrays[i];
        locationLable.textColor = [UIColor blackColor];
        btn.selected = NO;
    }
    btn.selected = YES;
    UILabel* label =  [self viewWithTag:btn.tag + 40];
    if(label){
        label.textColor =  [UIColor redColor];
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
