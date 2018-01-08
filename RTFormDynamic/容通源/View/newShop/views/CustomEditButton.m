//
//  CustomEditButton.m
//  darongtong
//
//  Created by xie on 17/12/16.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "CustomEditButton.h"
#import "Masonry.h"
#import "FontHander.h"

@implementation CustomEditButton

- (void) awakeFromNib{
    [super awakeFromNib];
    __weak typeof(self) weakSelf = self;
    if(_type == NewShopCustomButtonTypeDefault){
        self.layer.masksToBounds = YES;
        UILabel* text = [[UILabel alloc]init];
         self.layer.cornerRadius = 10;
        text.textColor = [UIColor whiteColor];
        text.font = self.titleLabel.font;
        text.text = @"编辑";
        [self addSubview:text];
        
        [text mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf).mas_offset(8);
            make.centerY.equalTo(weakSelf);
        }];
        
        UIImageView* editIV = [[UIImageView alloc]init];
        editIV.image = [UIImage imageNamed:@"sp_画笔"];
        [self addSubview:editIV];
        [editIV mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(weakSelf).mas_offset(-8);
            make.centerY.equalTo(weakSelf);
            
        }];
         
    }else if(_type == NewShopCustomButtonTypeAuthority){
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        UILabel* text = [[UILabel alloc]init];
        text.textColor = [UIColor whiteColor];
        text.font = self.titleLabel.font;
        text.text = @"设置权限可见范围";
        [self addSubview:text];
        
        [text mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(weakSelf).mas_offset(-8);
            make.centerY.equalTo(weakSelf);
            
        }];
        
        UIImageView* editIV = [[UIImageView alloc]init];
        editIV.image = [UIImage imageNamed:@"newshop_提示"];
        [self addSubview:editIV];
        [editIV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf).mas_offset(8);
            make.centerY.equalTo(weakSelf);
            
        }];
    }else if(_type == NewShopCustomButtonTypeSecretTitle || NewShopCustomButtonTypeSecretSubject == _type){
         self.userInteractionEnabled = YES;
         self.tintColor = [UIColor clearColor];
        [self addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        NSString*  str = self.titleLabel.text;
        //根据文字自动调整合适大小
        CGSize size =  [FontHander counterText:14 srtText:str];
        
        // 标题和子集用一个样式 按钮不勾选不做区分
        UIView* boxView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,size.width+30+10+20,32)];
        [self addSubview:boxView];
         boxView.userInteractionEnabled = NO;
         
        self.frame = CGRectMake(0, 0,size.width+30+10+20,32);
        [boxView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.equalTo(weakSelf);
        }];
        
        boxView.layer.borderColor = [UIColor colorWithHexString:@"757760"].CGColor;
        boxView.layer.borderWidth = 0.5;
        
       __block UIView* leftRect = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, self.frame.size.height)];
        if(_type == NewShopCustomButtonTypeSecretTitle){
            leftRect.backgroundColor = [UIColor colorWithHexString:@"757760"];
        }else if(NewShopCustomButtonTypeSecretSubject == _type){
            leftRect.backgroundColor = [UIColor colorWithHexString:@"e9e9eb"];
        }
        UIButton* btn = [[UIButton alloc]init];
        btn.tag = 4;
        [btn setImage:[UIImage imageNamed:@"newshop_椭圆1拷贝4"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"newshop_红色勾"] forState:UIControlStateSelected];
        [leftRect addSubview:btn];
        [boxView addSubview:leftRect];
        
        [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(leftRect);
        }];
        
        [leftRect mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.equalTo(weakSelf);
            make.width.equalTo(30);
        }];
        
        UILabel* rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(30+ 10, 0, (self.frame.size.width - (30+10+20)), self.frame.size.height)];
        rightLabel.tag = 5;

        rightLabel.backgroundColor = [UIColor clearColor];
        [boxView addSubview:rightLabel];
        [rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(weakSelf);
            make.left.equalTo(leftRect.mas_right).mas_offset(10);
            make.right.equalTo(weakSelf).mas_offset(10);
        }];
        
        rightLabel.text =  self.titleLabel.text;
        rightLabel.textColor = self.titleLabel.textColor;
        rightLabel.font =  self.titleLabel.font;
        [self setTitle:@"" forState:UIControlStateNormal];
        if(_type == NewShopCustomButtonTypeSecretTitle){
//            text.textColor = self.titleLabel.textColor;
//            text.font = self.titleLabel.font;
            //rightLabel.text
//            rightLabel.backgroundColor = [UIColor colorWithHexString:@"757760"];
        }else if(NewShopCustomButtonTypeSecretSubject == _type){
//            rightLabel.backgroundColor = [UIColor colorWithHexString:@"e9e9eb"];
        }
        
    }else if(_type == NewShopCustomButtonTypeShopType){//组织结构类别
         
         
    }
    
}

-(void) clickBtn:(UIButton*) btn{
     
     btn.selected = !btn.selected;
     if(_type == NewShopCustomButtonTypeSecretSubject){//点子级
          if(_delegate){
               [_delegate clickItem:_indexPath btn:self];
          }
     }
     
}


- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if(_type == NewShopCustomButtonTypeSecretTitle){
         UIButton* btn = [self viewWithTag:4];
         btn.selected = selected;
    }else if(NewShopCustomButtonTypeSecretSubject == _type){
        UIButton* btn = [self viewWithTag:4];
        btn.selected = selected;
        UILabel* textLab = [self viewWithTag:5];
        if(selected){
            textLab.textColor = [UIColor whiteColor];
        }else{
            textLab.textColor = self.titleLabel.textColor;
        }
        if(selected){
            self.backgroundColor = [UIColor colorWithHexString:@"252432"];
        }else{
            self.backgroundColor = [UIColor whiteColor];
        }
    }

}


- (void) drawRect:(CGRect)rect{
    [super drawRect:rect];
   
   
    
}

@end
