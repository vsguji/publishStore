//
//  NewShopSelectedLocationVC.m
//  darongtong
//
//  Created by xie on 18/1/4.
//  Copyright © 2018年 darongtong. All rights reserved.
//

#import "NewShopSelectedLocationVC.h"
#import <MAMapKit/MAMapKit.h>
#import "Masonry.h"
#import "LocationService.h"

@interface NewShopSelectedLocationVC ()

@property (nonatomic,strong) MAMapView* mapShowView ;
@end

@implementation NewShopSelectedLocationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMapShowView];
    // Do any additional setup after loading the view.
}



#pragma mark - 初始化
-(void)initMapShowView
{
    __weak typeof(self) weakSelf = self;

    _mapShowView = [[MAMapView alloc] initWithFrame:self.view.frame];
    _mapShowView.delegate = self;
    // 不显示罗盘
    _mapShowView.showsCompass = NO;
    // 不显示比例尺
    _mapShowView.showsScale = NO;
    // 地图缩放等级
    _mapShowView.zoomLevel = 15;
    // 开启定位
    _mapShowView.showsUserLocation = YES;
    [self.view addSubview:self.mapShowView];
    
    [self.mapShowView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.bottom.equalTo(weakSelf.view);
    }];
    
  
}


- (void) viewDidDisappear:(BOOL)animated{
    
    if(self.callBlock){
        self.callBlock([_mapShowView centerCoordinate]);
    }
    
    
    
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
