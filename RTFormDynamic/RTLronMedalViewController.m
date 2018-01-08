//
//  RTLronMedalViewController.m
//  darongtong
//
//  Created by zy on 2017/12/6.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTLronMedalViewController.h"
#import "RTBaseCell.h"
#import "RTPartnerViewController.h"
#import "RTMoneyViewController.h"
#import "RTAreaViewController.h"
#import "RTGroupViewController.h"
#import "RTWisdomViewController.h"
#import "RTProjectViewController.h"

@interface RTLronMedalViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tab;
}
@end

@implementation RTLronMedalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tab = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tab registerClass:[RTBaseCell class] forCellReuseIdentifier:[RTBaseCell cellIdentity]];
    _tab.delegate = self;
    _tab.dataSource = self;
    [_tab reloadData];
    [self.view addSubview:_tab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataSource {
    return @[@{@"我有可投运营合伙人":[RTPartnerViewController new]},
             @{@"我有可投货币":[RTMoneyViewController new]},
             @{@"我有可投项目":[RTProjectViewController new]},
             @{@"我有可投团队":[RTGroupViewController new]},
             @{@"我有可投场地":[RTAreaViewController new]},
             @{@"我有可投智慧":[RTWisdomViewController new]}
             ];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[RTBaseCell cellIdentity]];
    cell.textLabel.text = [self.dataSource[indexPath.row] allKeys][0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *itemDic = self.dataSource[indexPath.row];
    NSString *key = [itemDic allKeys][0];
    UIViewController *vc = [itemDic objectForKey:key];
    vc.title = key;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
