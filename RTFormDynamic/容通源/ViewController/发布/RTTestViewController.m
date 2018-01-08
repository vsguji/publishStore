//
//  RTTestViewController.m
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTTestViewController.h"
#import "RTFormHeaderView.h" // lipeng 2017.12.07
#import "UIView+Altar.h"
#import "RTFormImageView.h"
#import "RTPartnerTipView.h" // lipeng 2017.12.08
#import "RTBaseCell.h"
#import "ColorMacro.h"

@interface RTTestViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tabView;
}

@end

@implementation RTTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    
    // 1.0 拍照背景图
//    RTFormImageView *formImg = [[RTFormImageView alloc] init];
//    [self.view addSubview:formImg];
//    [formImg setFrameAndLayout:CGRectMake(0, 100,CGRectGetWidth(self.view.bounds), 230)];
//    [formImg relayoutFrameOfSubViews];
//
    // 2.0 合伙人拍照
//    RTFormHeaderView *formImg = [[RTFormHeaderView alloc] initWithLeftCornerTitle:@"投运营合伙人照片"];
//    [self.view addSubview:formImg];
//    [formImg setFrameAndLayout:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds), 230)];
//    [formImg relayoutFrameOfSubViews];
    
//    // 3.0 合伙人
//    RTPartnerInfoView *relationView =  [[RTPartnerInfoView alloc] init];
//    relationView.backgroundColor = [UIColor colorWithHexString:@"0x4e2523"];
//    [self.view addSubview:relationView];
//    [relationView setFrameAndLayout:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 365)];
//    [relationView configOwnViewsWidthInfo:nil];
    
      // 3.1 合伙人密档
//    RTFormSecretView *secretView = [[RTFormSecretView alloc] init];
//    [self.view addSubview:secretView];
//    [secretView setFrameAndLayout:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 167)];
//    [secretView configOwnViewsWidthInfo:nil];
    
//    // 3.2 合伙人关系
//    RTPartnerRelationView *relationView = [[RTPartnerRelationView alloc] init];
//    [self.view addSubview:relationView];
//    [relationView setFrameAndLayout:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 60)];
//    [relationView configOwnViewsWidthInfo:nil];

 //    4.0 表头
//    _tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    _tabView.delegate = self;
//    _tabView.dataSource = self;
//    [_tabView registerClass:[RTBaseCell class] forCellReuseIdentifier:[RTBaseCell cellIdentity]];
//    _tabView.tableHeaderView = [self baseHeaderView];
//    [self.view addSubview:_tabView];
    
    // 5.0
//    CGFloat width = kScreenW - 10 * 2;
//    RTFormSecretAttachment *attachment = [[RTFormSecretAttachment alloc] init];
//    [self.view addSubview:attachment];
//    [attachment configOwnViewsWidthInfo:nil];
//    [attachment setFrameAndLayout:CGRectMake(10, 0, width, 321)];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 120, 40);
    [btn setBackgroundImage:[UIImage imageNamed:@"form_inputField"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (NSArray *)dataSource {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"];
}

- (UIView *)baseHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 400)];
    headerView.backgroundColor = kYellowColor;
    return headerView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[RTBaseCell cellIdentity]];
    cell.textLabel.text = [NSString stringWithFormat:@"indexPath:%ld",indexPath.row];
    return cell;
}

@end
