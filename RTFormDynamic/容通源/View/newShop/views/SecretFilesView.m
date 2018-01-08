//
//  SecretFilesView.m
//  darongtong
//
//  Created by xie on 17/12/16.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "SecretFilesView.h"
#import "KNavigation.h"
#import "ShopSecretFileViewController.h"
#import "NewShopSecretTiGangModel.h"
#import "KNavigation.h"
#import "FontHander.h"
#import "EditSecretFileLivelyVC.h"
#import "NewShopSecretFileFlowViewController.h"


@interface SecretFilesView()
@property (strong, nonatomic) IBOutlet UIView *SecreFileEditTextView;
@property (strong, nonatomic) IBOutlet UIView *secretPicEditView;
@property (strong, nonatomic) IBOutlet UILabel *midangTiGangLabel;

@property (strong, nonatomic) NSArray* tiGangArray;


@end


@implementation SecretFilesView

- (void) awakeFromNib{
    [super awakeFromNib];
    _secretPicEditView.layer.borderColor = [UIColor colorWithRed:85/255.0 green:98/255.0 blue:83/255.0 alpha:1].CGColor;
    _secretPicEditView.layer.borderWidth = 2;
    _SecreFileEditTextView.layer.masksToBounds = YES;
    _SecreFileEditTextView.layer.cornerRadius = 20;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setingSecretType)];
    [_SecreFileEditTextView addGestureRecognizer:tap];
    
    UITapGestureRecognizer* tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(editSecretFile)];
    [_secretPicEditView addGestureRecognizer:tap2];
    //填写下面密档1.图文绘声绘色篇里的提纲(密档文案中各组文内容的标题,作为密档文案的提纲)
    UIColor* partColor = [UIColor colorWithHexString:@"b8b8b8"];
    
    NSMutableAttributedString* attr =  [FontHander addColorText:@"填写下面" size:14 srcText:_midangTiGangLabel.text color:partColor];
    
    NSRange  range2 = [_midangTiGangLabel.text rangeOfString:@"绘声绘色篇里的"];
    NSRange  range3 = [_midangTiGangLabel.text rangeOfString:@"("];
    NSRange  range4 = [_midangTiGangLabel.text rangeOfString:@",作为密档文案的提纲)"];
    [attr addAttribute:NSForegroundColorAttributeName value:partColor range:range2];
    [attr addAttribute:NSForegroundColorAttributeName value:partColor range:range3];
    [attr addAttribute:NSForegroundColorAttributeName value:partColor range:range4];
    
    _midangTiGangLabel.attributedText = attr;
    
    UIColor* partColor2 = [UIColor colorWithHexString:@"aea489"];
    NSMutableAttributedString* att2 =  [FontHander addColorText:@"绘声绘色编辑上述提纲所指明的" size:14 srcText:_secretTitle.text color:partColor2];
    _secretTitle.attributedText = att2;
    
}

#pragma mark -- 选择密档类型 --
- (void) setingSecretType{
    
    __weak typeof(self) weakSelf = self;
    ShopSecretFileViewController* vc = [[ShopSecretFileViewController alloc]init];
    vc.callBlock = ^(NSArray*  array ,NSString* str){
        weakSelf.tiGangArray = array;
        //更新
        weakSelf.secretTextView.text = str;
        
    };
    
    [[KNavigation getNavigation] pushViewController:vc animated:YES];
    
    
}


#pragma mark -- 编辑密档 --
- (void) editSecretFile{
 
    if(_model){//编辑密档
        // 跳转到审核界面
        NewShopSecretFileFlowViewController* vc = [[NewShopSecretFileFlowViewController alloc]init];
        vc.hshs_id = _model.id;
        [[KNavigation getNavigation] pushViewController:vc animated:YES];
        
//        __block EditSecretFileLivelyVC *meipian = [[EditSecretFileLivelyVC alloc] init];
//        meipian.editModel = _model;
//        DaRongTongUser* user  = [DaRongTongUser sharedSingleton];
//        meipian.custom_id = user.customer_id;
//        meipian.secretTitle = _hshsTitle.text;
//        
//        [[KNavigation getNavigation] pushViewController:meipian animated:YES];
        return;
    }
    //选择图片
    if(self.tiGangArray && self.tiGangArray.count){
        if(_openCamera){
            _openCamera(_tiGangArray);
        }
    }else{
        [SVProgressHUD showWithStatus:@"请先填写密档提纲"];
        [SVProgressHUD dismissWithDelay:0.8];
    }
    
    
}

- (IBAction)goEideHSHS:(id)sender {
    
    if(_model){//编辑密档
        // 跳转到审核界面
        NewShopSecretFileFlowViewController* vc = [[NewShopSecretFileFlowViewController alloc]init];
        vc.hshs_id = _model.id;
        [[KNavigation getNavigation] pushViewController:vc animated:YES];
        
        //        __block EditSecretFileLivelyVC *meipian = [[EditSecretFileLivelyVC alloc] init];
        //        meipian.editModel = _model;
        //        DaRongTongUser* user  = [DaRongTongUser sharedSingleton];
        //        meipian.custom_id = user.customer_id;
        //        meipian.secretTitle = _hshsTitle.text;
        //
        //        [[KNavigation getNavigation] pushViewController:meipian animated:YES];
        return;
    }
    //选择图片
    if(self.tiGangArray && self.tiGangArray.count){
        if(_openCamera){
            _openCamera(_tiGangArray);
        }
    }else{
        [SVProgressHUD showWithStatus:@"请先填写密档提纲"];
        [SVProgressHUD dismissWithDelay:0.8];
    }

}


- (IBAction)addNewSecretHSHS:(id)sender {
}

#pragma mark -- 添加其它收益 --
- (IBAction)addOtherRecover:(id)sender {
    
    if(_addNewHSHS){
        _addNewHSHS();
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
