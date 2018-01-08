//
//  NewShopGroupButtonView.m
//  darongtong
//
//  Created by xie on 17/12/22.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopGroupButtonView.h"
@interface NewShopGroupButtonView()


@end

@implementation NewShopGroupButtonView

- (void) awakeFromNib{
    [super awakeFromNib];
    
    _yuanView.layer.cornerRadius = 20;
    _yuanView.layer.masksToBounds = YES;
    _yuanView.layer.borderColor = [UIColor colorWithHexString:@"999999"].CGColor;
    _yuanView.layer.borderWidth = 0.5;
    UIImage* image = [UIImage imageNamed:@"form_check_normal_btn"];
    [_startusBtn setImage:image forState:UIControlStateNormal];
    [_startusBtn setImage:[UIImage imageNamed:@"form_check_sel_btn"] forState:UIControlStateSelected];
    


}

#pragma mark -- 这是值 --
- (void) setModel:(NewShopSecretTiGangModel*) model{
    _model = model;
    _valueLabel.text = model.name;
    
}

//#pragma mark -- 这是值 --
//- (void) clickSelected{
//    _startusBtn.selected = !_startusBtn.selected;
//    if(_startusBtn.selected ){
//        //调用方法
//        if(_delegate){
//          
//        }
//    }else{
//        
//    }
//  
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
