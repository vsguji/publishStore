//
//  NewShopMainCategoryTypeCell.m
//  darongtong
//
//  Created by xie on 17/12/25.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopMainCategoryTypeCell.h"

@interface NewShopMainCategoryTypeCell()
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UILabel *allLabel;

@end

@implementation NewShopMainCategoryTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_allBtn setImage:[UIImage imageNamed:@"newshop_红色－勾选"] forState:UIControlStateSelected];
}


- (void) setModel:(NewShopSecretTiGangModel *)model{
    _LeftViewBg.backgroundColor = [UIColor colorWithHexString:@"e9e9eb"];
    _rightViewBg.backgroundColor = [UIColor whiteColor];
    _model = model;
    _title.text = model.name;
    _content.text = model.sub_name;
    _num.text = @"0";
    
    
}

#pragma mark -- 点击全部 --
- (IBAction)clickAllBtn:(UIButton*)sender {
    __weak typeof(self) weakSelf = self;

    _allBtn.selected = !sender.selected;
    
    if(_allBtn.selected){//true
        _LeftViewBg.backgroundColor = [UIColor colorWithHexString:@"151521"];
        _rightViewBg.backgroundColor = [UIColor colorWithHexString:@"252432"];
        if(self.delegate){
            [self.delegate alllSelected:weakSelf operation:2];
        }
    }else{
        _LeftViewBg.backgroundColor = [UIColor colorWithHexString:@"e9e9eb"];
        _rightViewBg.backgroundColor = [UIColor whiteColor];
        if(self.delegate){
            [self.delegate alllSelected:weakSelf operation:1];
        }
    }
}


- (void) setSelecte:(BOOL)selected{
    
    __weak typeof(self) weakSelf = self;

        if(self.delegate){
              BOOL isAllChecked =  [self.delegate counterCurrentNextSelected:weakSelf];
              if(!isAllChecked){//没有全部选中
                  _allBtn.selected = isAllChecked;
                  if([self.num.text isEqualToString:@"0"]){
                      _LeftViewBg.backgroundColor = [UIColor colorWithHexString:@"e9e9eb"];
                      _rightViewBg.backgroundColor = [UIColor whiteColor];
                      _allLabel.textColor = [UIColor colorWithHexString:@"666666"];
                      _title.textColor = [UIColor colorWithHexString:@
                                          "343240"];
                      _content.textColor = [UIColor colorWithHexString: @"7b6a5f"];
                  }else{
                      _LeftViewBg.backgroundColor = [UIColor colorWithHexString:@"712b19"];
                      _rightViewBg.backgroundColor = [UIColor colorWithHexString:@"833522"];
                      
                      _allLabel.textColor = [UIColor colorWithHexString:@"cccecd"];
                      _title.textColor = [UIColor colorWithHexString:@
                                          "cccecd"];
                      _content.textColor = [UIColor colorWithHexString: @"7b6b5b"];
                      
                  }
              }else{
                  _allBtn.selected = isAllChecked;
                  _LeftViewBg.backgroundColor = [UIColor colorWithHexString:@"151521"];
                  _rightViewBg.backgroundColor = [UIColor colorWithHexString:@"252432"];
                  
                  _allLabel.textColor = [UIColor colorWithHexString:@"b2b2b2"];
                  _title.textColor = [UIColor colorWithHexString:@
                                      "b2b2b2"];
                  _content.textColor = [UIColor colorWithHexString: @"7b6a5f"];
              }
        }

    
}



@end
