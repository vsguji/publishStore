//
//  FillStoreView.m
//  darongtong
//
//  Created by liuxin on 2017/7/12.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "FillStoreView.h"
#import "RoundView.h"
#import "UIView+UIViewController.h"
#import "SummaryInputViewController.h" //创业故事概要
#import "OriginalTextViewController.h" //商业计划书
#import "MeiPianListViewController.h" //绘声绘色
#import "detailSelecteViewController.h" //创业气象
#import "LiChengViewController.h" //创业历程
#import "AddWuchanViewController.h"//新建物产
#import "RTAgreementViewController.h" // lipeng 2017.12.06
#import "RTPageViewController.h" // lipeng 2017.12.06
#import "RTBaseNavigationController.h" // lipeng 2017.12.06
#import "NewPublishViewController.h" // lipeng 2017.12.06
#import "StorePublishController.h" // lipeng 2017.12.06
#import "RTTestViewController.h" // lipeng 2017.12.07

@interface FillStoreView ()
{
}
@end

@implementation FillStoreView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
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
    [self addTitleViewWithStrArray:@[@"完善店铺",@"完善店铺赢得更广阔的发展空间"] frame:CGRectMake(0, 0, self.frame.size.width,55)];
    
    NSArray * strArr = @[@"坛报道",@"评论、即时通迅、交流思想的地方",@"容通值与诚信",@"创始历程",@"创业气象",@"商业计划书",@"容通值",@"年月周报告",@"谴诉诚信指数",@"容通源",@"容通源I 八类资本组合股权",@"容通源II 加盟.七统一三需求一分帐",@"容通源III 标单贸易物流三端供需",@"容通源IV 分利消费标单的需求供给",@"",@"智慧展厅",@"",@"时间智慧品",@"智慧成果",@"智慧组合品标单",@"智慧资本品-预期分利消费"];
    for (int i =0; i<21; i++)
    {
        if (i == 0 || i==2|| i==9|| i==15)
        {
            BOOL hidden = NO;
            if (i == 0) {
                hidden = YES;
            }
            
            [self addTitleViewTitleStr:strArr[i] ifHiddenLineView:hidden viewTag:10086+i frame:CGRectMake(0, 47+i*44, self.width_cust,44)];
        }else if (i == 14)
        {
            [self addCenterImgViewWithFrame:CGRectMake(0, 47+i*44, self.width_cust,44)];
            
        }else if (i == 16)
        {
            [self addLeftImgViewWithFrame:CGRectMake(0, 47+i*44, self.width_cust,44)];
        }else
        {
            BOOL hidden = NO;
            int type = 0;
            if (i >16)
            {
                hidden = YES;
            }
            if (i ==17 || i==18) {
                type = 1;
            }
            [self addCellViewWithFrame:CGRectMake(0, 47+i*44, self.width_cust,44) titleStr:strArr[i] titleType:type ifHiddenLineView:hidden viewTag:10086+i];
        }
    }
}
#pragma mark --点击事件
-(void)selectorConditions:(UIButton *)sender
{
    YYLog(@"完善店铺点击%d",sender.tag);
    if (sender.tag == 10089) {
        //评论、即时通讯、交流思想
        
    }
    
    if (sender.tag == 10089) {
        //创始历程
        LiChengViewController *VC = [[LiChengViewController alloc] init];
        VC.caseId=@"593";
        [self.viewController.navigationController pushViewController:VC animated:NO];

    }
    if (sender.tag == 10090) {
        //创业气象
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"detailSelecteViewController" owner:nil options:nil];
        detailSelecteViewController *detailVc= [views objectAtIndex:0];
        detailVc.delegate=self;
        [self.viewController.navigationController pushViewController:detailVc animated:YES];
    }
    if (sender.tag == 10091) {
        //商业计划书
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"OriginalTextViewController" owner:nil options:nil];
        OriginalTextViewController *orginVc = [views objectAtIndex:0];
        orginVc.caseId= @"593";
        [self.viewController.navigationController pushViewController:orginVc animated:YES];

    }
    if (sender.tag == 10092) {
        //容通值
    }
    if (sender.tag == 10093) {
        //年月周报告
    }
    if (sender.tag == 10094) {
        //谴颂诚信指数
    }
    if (sender.tag == 10096) {
    
        //八类资本组合股权
       // StorePublishController *stockVC = [[StorePublishController alloc] init];
        RTAgreementViewController *stockVC = [[RTAgreementViewController alloc] init];
       // NewPublishViewController *stockVC = [[NewPublishViewController alloc] init];
       // RTTestViewController *stockVC = [[RTTestViewController alloc] init];
        [self.viewController.navigationController pushViewController:stockVC animated:YES];
    }
    if (sender.tag == 10097) {
        //加盟七统一三需求一分账
    }
    if (sender.tag == 10098) {
        //三端供需
    }
    if (sender.tag == 10099) {
        //需求供给
    }
    if (sender.tag == 10103) {
        //时间智慧品
    }
    if (sender.tag == 10104) {
        //智慧成果
    }
    if (sender.tag == 10105) {
        //智慧组合标单
    }
    if (sender.tag == 10106) {
        //预期分利消费
    }
    
    
    NSArray *arr = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
    int r = arc4random() % [arr count];

    if (sender.tag == 10086+1)
    {
        RoundView * view = [self viewWithTag:10086];
        view.colorHight = [arr[r] integerValue];
    }else if(sender.tag > 10086+2 && sender.tag < 10086+9 )
    {
        RoundView * view = [self viewWithTag:10086+2];
        view.colorHight = [arr[r] integerValue];
    }else if(sender.tag > 10086+9 && sender.tag < 10086+14 )
    {
        RoundView * view = [self viewWithTag:10086+9];
        view.colorHight = [arr[r] integerValue];
    }else{
        RoundView * view = [self viewWithTag:10086+15];
        view.colorHight = [arr[r] integerValue];
    }

}
#pragma mark --view初始化方法
//标题行
-(void)addTitleViewWithStrArray:(NSArray *)strArray frame:(CGRect)frame
{
    if (strArray.count>2) {
        return;
    }
    
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    //划线
    UIView * lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
    lineView2.backgroundColor = RGB(93, 105, 85);
    [backView addSubview:lineView2];
    
    UIView * greenView = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width/2-30, frame.size.height-3, 60, 3)];
    greenView.backgroundColor = HexColor(0Xa2a38a);
    [backView addSubview:greenView];

    NSInteger max_l;
    NSString * str1;
    NSString * str2;
    if (strArray.count ==1) {
        str1 = strArray[0];
        max_l = str1.length*16;
    }else
    {
        str1 = strArray[0];
        str2 = strArray[1];
        max_l = (str1.length >str2.length)?str1.length:str2.length;
        max_l = max_l*12;
    }
    
    UILabel * cLabel = [[UILabel alloc]initWithFrame:CGRectMake((frame.size.width-max_l)/2, 13,max_l, 30)];
    cLabel.textAlignment = NSTextAlignmentCenter;
    cLabel.textColor = HexColor(0Xa2a38a);
    
    [backView addSubview:cLabel];
    
    if (strArray.count ==1) {
        cLabel.font = [UIFont systemFontOfSize:15];
        cLabel.text = str1 = strArray[0];
    }else
    {
        NSString * str =[NSString stringWithFormat:@"%@\n%@",str1,str2];
        cLabel.numberOfLines = 0;
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
        
        NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init];
        paragraph.alignment=NSTextAlignmentCenter;
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, str.length)];
        
        [attributedString addAttribute:NSFontAttributeName
         
                                 value:[UIFont systemFontOfSize:15.0]
         
                                 range:NSMakeRange(0, str1.length)];
        
        [attributedString addAttribute:NSFontAttributeName
         
                                 value:[UIFont systemFontOfSize:11.0]
         
                                 range:NSMakeRange(str1.length+1, str2.length)];
        
        cLabel.attributedText = attributedString;
        [cLabel sizeToFit];
    }
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
-(void)addCenterImgViewWithFrame:(CGRect)frame
{
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    
    UIImageView * verticalView = [[UIImageView alloc]initWithFrame:CGRectMake(24, 0, 2, backView.height_cust)];
    verticalView.image = [UIImage imageNamed:@"sp_线条"];
    [backView addSubview:verticalView];
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(backView.width_cust/2-35, 0, 70, backView.height_cust)];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor =RGB(159, 163, 139);
    titleLabel.text = @"四品交易";
    [backView addSubview:titleLabel];
    
    UIImageView * leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(titleLabel.left_cust-26, titleLabel.height_cust/2-8, 16, 16)];
    leftImg.image = [UIImage imageNamed:@"sp_四品交易箭头-left"];
    [backView addSubview:leftImg];
    UIImageView * rightImg = [[UIImageView alloc]initWithFrame:CGRectMake(titleLabel.right_cust+10, leftImg.top_cust, 16, 16)];
    rightImg.image = [UIImage imageNamed:@"sp_四品交易箭头-right"];
    [backView addSubview:rightImg];
}
-(void)addLeftImgViewWithFrame:(CGRect)frame
{
    UIView * backView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:backView];
    
    UIImageView * leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(40,9,110,26)];
    leftImg.image = [UIImage imageNamed:@"sp_智慧品单品"];
    [backView addSubview:leftImg];

}
@end

