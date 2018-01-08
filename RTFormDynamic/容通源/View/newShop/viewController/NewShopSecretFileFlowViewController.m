//
//  NewShopSecretFileFlowViewController.m
//  darongtong
//
//  Created by xie on 17/12/23.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopSecretFileFlowViewController.h"
#import "CommonServer.h"
#import "Masonry.h"
#import "NewShopHSHSAuditStatus.h"
#import "WZCLivelyListModel.h"
@interface NewShopSecretFileFlowViewController ()

@end

@implementation NewShopSecretFileFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"密档图文审核";
    // Do any additional setup after loading the view.
    [self makeUI];
    
}


- (void) makeUI{
    
    __weak typeof(self) weakSelf = self;
    UIScrollView* scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 0, kScreenW, self.view.frame.size.height);
    scrollView.contentSize = CGSizeMake(kScreenW, 827);
    [self.view addSubview:scrollView];
    
    [scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(weakSelf.view);
    }];
    
    NewShopHSHSAuditStatus* secretFileFlowView = (NewShopHSHSAuditStatus*) [CommonServer getViewByXib:@"NewShopHSHSAuditStatus"];
    secretFileFlowView.hshs_id = _hshs_id;
    secretFileFlowView.frame =  CGRectMake(0, 0, kScreenW, 827);
    [secretFileFlowView makeUI];
    [scrollView addSubview:secretFileFlowView];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
