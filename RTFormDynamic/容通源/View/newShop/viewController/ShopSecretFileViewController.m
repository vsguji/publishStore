//
//  ShopSecretFileViewController.m
//  darongtong
//
//  Created by xie on 17/12/19.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "ShopSecretFileViewController.h"

#import "CommonServer.h"
#import "Masonry.h"

@interface ShopSecretFileViewController ()
@property (nonatomic,strong)NewShopPulishScretFileView* mainView ;

@end


@implementation ShopSecretFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"密档提纲";
    if(self.type == NewShopsecretTypeManageCategory){
         self.title = @"选择店铺经营主体规模类别";
    }
    
    // Do any additional setup after loading the view.
    [self maskUI];
    
}

#pragma  mark -- 总的来说  --
- (void) maskUI{
    
    __block UIScrollView*  mainScroll = [[UIScrollView alloc]init];
    mainScroll.frame = CGRectMake(0, 0,kScreenW, self.view.frame.size.height-55);
    [self.view addSubview:mainScroll];
    mainScroll.contentSize = CGSizeMake(kScreenW, 800);
   _mainView = (NewShopPulishScretFileView*)[CommonServer getViewByXib:@"NewShopPulishScretFileView"];
    _mainView.dataArray = _dataArray;
    _mainView.p_id = _p_id;
    _mainView.frame = CGRectMake(0, 0, kScreenW, 800);
    _mainView.setContentHeight = ^(CGFloat contentHeight){
        mainScroll.contentSize = CGSizeMake(kScreenW, contentHeight);
    };
    _mainView.type = self.type;
    [mainScroll addSubview:_mainView];
    
}



- (void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    if(_callBlock){
        _callBlock(_mainView.arrayList,_mainView.appendStr);
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
