//
//  FillHomeView.m
//  darongtong
//
//  Created by liuxin on 2017/7/11.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "FillHomeView.h"
#import "RoundView.h"
#import "UIView+UIViewController.h"
#import "MySaysViewController.h"
#import "WZC_MyLivelyView.h"
#import "MyLiveViewController.h"
#import "MyView_EditViewController.h"
#import "My_MineController.h"

@interface FillHomeView ()
{
}
@end
@implementation FillHomeView

//- (void)drawRect:(CGRect)rect
//{

//}
-(id)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if (self)
    {
        self.frame = frame;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 45;
        self.backgroundColor = RGB(67, 81, 64);
        [self buildView];
    }
    return self;
}
-(void)buildView
{
    [self addTitleViewWithString:@"完善家门" frame:CGRectMake(0,0,kScreenW,47)];
    NSArray * strArr = @[@"家门名片",@"电子名片便于传播",@"家门宣说",@"说说",@"绘声绘色",@"直播",@"分享铺·启明星说"];
    for (int i =0; i<7; i++)
    {
        if (i == 0 || i==2)
        {
            BOOL hidden = YES;
            if (i == 2) {
                hidden = NO;
            }
            
            [self addTitleViewTitleStr:strArr[i] ifHiddenLineView:hidden viewTag:10086+i frame:CGRectMake(0, 47+i*44, self.width_cust,44)];
        }else{
            BOOL hidden = YES;
            if (i ==1)
            {
                hidden = NO;
            }
            [self addCellViewWithFrame:CGRectMake(0, 47+i*44, self.width_cust,44) titleStr:strArr[i] titleType:0 ifHiddenLineView:hidden viewTag:10086+i];
            
        }
    }
}
#pragma mark --点击事件
-(void)selectorConditions:(UIButton *)sender
{
    DaRongTongUser  *userSin=[DaRongTongUser sharedSingleton];

    YYLog(@"家门点击%d",sender.tag);
    NSArray *arr = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
    int r = arc4random() % [arr count];
    if (sender.tag == 10089) {
        //电子名片
        MyView_EditViewController *VC = [[MyView_EditViewController alloc] init];
        VC.titleIndex = 3;
        [self.viewController.navigationController pushViewController:VC animated:NO];
    }

    if (sender.tag == 10089) {
        //说说
        My_MineController *jialiVC = [[My_MineController alloc]init];
        jialiVC.userID = userSin.customer_id;
        [self.viewController.navigationController pushViewController:jialiVC animated:YES];

//        MySaysViewController *set =[[MySaysViewController alloc]init];
//        
//        //                        Tan_RootViewController *set =[[Tan_RootViewController alloc]init];
//        
//        [self.viewController.navigationController pushViewController:set animated:YES];

    }
    if (sender.tag == 10090) {
        
        //绘声绘色
        My_MineController *jialiVC = [[My_MineController alloc]init];
        jialiVC.userID = userSin.customer_id;
        [self.viewController.navigationController pushViewController:jialiVC animated:YES];
//        WZC_MyLivelyView *lively = [[WZC_MyLivelyView alloc] init];
//        lively.customer_id = userSin.customer_id;
//        if (userSin.customer_id == nil|| [userSin.customer_id isEqualToString:@""]) {
//            KPostNotification(KLoginOutNotification);
//        }
//        [self.viewController.navigationController pushViewController:lively animated:YES];

    }
    if (sender.tag == 10091) {
        //直播
        My_MineController *jialiVC = [[My_MineController alloc]init];
        jialiVC.userID = userSin.customer_id;
        [self.viewController.navigationController pushViewController:jialiVC animated:YES];
//        MyLiveViewController *vc = [[MyLiveViewController alloc]init];
//        [self.viewController.navigationController pushViewController:vc animated:YES];

    }
    if (sender.tag == 10092) {
        //分享铺
        [Alert showWithTitle:@"分享铺开发ing"];
    }

    
    if (sender.tag == 10086+1)
    {
        RoundView * view = [self viewWithTag:10086];
        view.colorHight = [arr[r] integerValue];
    }else
    {
        RoundView * view = [self viewWithTag:10088];
        view.colorHight = [arr[r] integerValue];
    }
}
#pragma mark --view初始化方法
//标题行
-(void)addTitleViewWithString:(NSString *)string frame:(CGRect)frame
{
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    //划线
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
    lineView.backgroundColor = RGB(94, 107, 88);
    [backView addSubview:lineView];
    
    UILabel * cLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15,frame.size.width, 30)];
    cLabel.textAlignment = NSTextAlignmentCenter;
    cLabel.textColor = HexColor(0Xa2a38a);
    cLabel.font = [UIFont systemFontOfSize:15];
    cLabel.text = string;
    [backView addSubview:cLabel];
    
    UIView * greenView = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width/2-30, frame.size.height-3, 60, 3)];
    greenView.backgroundColor = HexColor(0Xa2a38a);
    [backView addSubview:greenView];
}
-(void)addTitleViewTitleStr:(NSString *)titleStr ifHiddenLineView:(BOOL)ifHidden viewTag:(int)viewtag frame:(CGRect)frame
{
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,backView.width_cust,backView.height_cust)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.text = titleStr;
    [backView addSubview:titleLabel];
    
    UIImageView * verticalView = [[UIImageView alloc]initWithFrame:CGRectMake(24, 0, 2, backView.height_cust)];
    verticalView.hidden = ifHidden;
    verticalView.image = [UIImage imageNamed:@"sp_线条"];
    [backView addSubview:verticalView];
    
    RoundView * rv = [[RoundView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    rv.colorHight = 0;
    rv.tag = viewtag;
    [backView addSubview:rv];
}
//type 0 正常 1绿色
-(void)addCellViewWithFrame:(CGRect)frame titleStr:(NSString *)str titleType:(int)type ifHiddenLineView:(BOOL)ifHidden viewTag:(int)viewtag
{
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 0,backView.width_cust-20,backView.height_cust)];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.text = str;
    [backView addSubview:titleLabel];
    
    if (type)
    {
        titleLabel.textColor = RGB(159, 163, 139);
        titleLabel.text = [NSString stringWithFormat:@"   %@",str];
    }
    
    UIImageView * arrowView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width_cust-20, 10, 10, 24)];
    arrowView.image = [UIImage imageNamed:@"sp_返回箭头-right"];
    [backView addSubview:arrowView];
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(titleLabel.left_cust, backView.height_cust-1, backView.width_cust, 1)];
    lineView.backgroundColor = RGB(93, 105, 85);
    [backView addSubview:lineView];
    
    UIImageView * verticalView = [[UIImageView alloc]initWithFrame:CGRectMake(24, 0, 2, backView.height_cust)];
    verticalView.hidden = ifHidden;
    verticalView.image = [UIImage imageNamed:@"sp_线条"];
    [backView addSubview:verticalView];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake(0, 0, backView.width_cust, backView.height_cust);
    btn.tag = viewtag;
    [btn addTarget:self action:@selector(selectorConditions:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:btn];
}
@end
