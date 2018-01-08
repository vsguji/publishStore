//
//  CommonLocationView.m
//  darongtong
//
//  Created by xie on 17/12/19.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "CommonLocationView.h"
#import "CommentLocationSelectedView.h"
#import "CommonServer.h"
#import "CommentEearbyLocationView.h"
#import "NewShopInLocationTypeView.h"
#import "Masonry.h"

@implementation CommonLocationView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    __weak typeof(self) weakSelf = self;
    self.backgroundColor = [UIColor clearColor];
    UIView* addressTitle = [self  addTitleViewWithString:@"店铺经营总部地理位置" frame:CGRectMake(0, 0, kScreenW, 44) hiddenLine:NO];
    addressTitle.backgroundColor = [UIColor whiteColor];
    [self addSubview:addressTitle];
    [addressTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf);
        make.height.equalTo(44);
    }];
    
    UILabel *title2 = [UILabel addLabelWithFrame:APP_CGRectMake(10, 43, 200, 25) title:@"①选择所处地名区划" titleColor:HexColor(0x6ebc00) font:FONT_SIZE(16)];
    [self addSubview:title2];
    [title2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(25);
        make.top.equalTo(addressTitle.mas_bottom);
    }];
    title2.backgroundColor = [UIColor whiteColor];
    
    //第一块
    CommentLocationSelectedView* view1 = [[CommentLocationSelectedView alloc ] initWithFrame:CGRectMake(0, 0, kScreenW, 300)];
    [self addSubview:view1];
    [view1 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(250);
        make.top.equalTo(title2.mas_bottom);
    }];
    
    //第二块
    CommentEearbyLocationView*  view2 = (CommentEearbyLocationView*)[CommonServer getViewByXib:@"CommentEearbyLocationView"];
    view2.frame = CGRectMake(0, 0, kScreenW, 263);
    [self addSubview:view2];
    [view2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(263);
        make.top.equalTo(view1.mas_bottom);
    }];
    
    //第三块
     NewShopInLocationTypeView*  view3 = (NewShopInLocationTypeView*)[CommonServer getViewByXib:@"NewShopInLocationTypeView"];
     view3.frame = CGRectMake(0, 0, kScreenW, 385);
     [self addSubview:view3];
    [view3 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(385);
        make.top.equalTo(view2.mas_bottom);
    }];
    
}



#pragma mark --view初始化方法
//标题行
-(UIView*)addTitleViewWithString:(NSString *)string frame:(CGRect)frame hiddenLine:(BOOL)hidden
{
    UIView * backView = [[UIView alloc]initWithFrame:frame];
//    [self addSubview:backView];
    //划线
    UIView * lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 1)];
    lineView1.backgroundColor = HexColor(0Xe1e1e1);
    [backView addSubview:lineView1];
    
    UIView * lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
    lineView2.backgroundColor = HexColor(0Xe1e1e1);
    [backView addSubview:lineView2];
    
    lineView1.hidden = hidden;
    lineView2.hidden = hidden;
    
    UIView * greenView = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width/2-30, frame.size.height-3, 60, 3)];
    greenView.backgroundColor = HexColor(0Xa2a38a);
    [backView addSubview:greenView];
    
    UILabel * cLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15,frame.size.width, 30)];
    cLabel.textAlignment = NSTextAlignmentCenter;
    cLabel.textColor = HexColor(0Xa2a38a);
    cLabel.font = [UIFont systemFontOfSize:15];
    cLabel.text = string;
    [backView addSubview:cLabel];
    
    return backView;
}





#pragma mark -- 返回高度 --
+ (CGFloat) getLocationViewHeight{
    //"店铺经营总部地理位置 + ①选择所处地名区划 +
    return 55 + 25+ 250+263+385;
}

@end
