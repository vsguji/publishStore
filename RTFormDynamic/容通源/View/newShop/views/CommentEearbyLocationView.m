//
//  CommentEearbyLocationView.m
//  darongtong
//
//  Created by xie on 17/12/19.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "CommentEearbyLocationView.h"
#import "NewShopSelectedLocationVC.h"
#import "UIView+ViewController.h"
#import "LocationService.h"
@interface CommentEearbyLocationView()
@property (strong, nonatomic) IBOutlet UIView *addressView;
@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) IBOutlet UILabel *currentPosition;

@end

@implementation CommentEearbyLocationView

- (void) awakeFromNib{
    [super awakeFromNib];
    _addressView.layer.borderColor = [UIColor colorWithHexString:@"999999"].CGColor;
    _addressView.layer.borderWidth = 0.5;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpMapView)];
    [_addressView addGestureRecognizer:tap];
    _bottomView.layer.masksToBounds = YES;
    _bottomView.layer.cornerRadius = 5;
    _bottomView.layer.borderWidth = 0.5;
    _bottomView.layer.borderColor = [UIColor colorWithHexString:@"999999"].CGColor;
    
}

#pragma mark -- 跳转到选择地图 --
- (void) jumpMapView{
    
    __weak typeof(self) weakSelf = self;
     LocationService* ls = [[LocationService alloc]init];
    ls.callAddress = ^(AMapReGeocodeSearchResponse* request){
        weakSelf.currentPosition.text = request.regeocode.formattedAddress;
    };
    NewShopSelectedLocationVC* vc = [[NewShopSelectedLocationVC alloc]init];
    vc.callBlock = ^(CLLocationCoordinate2D  coordinate){
        [ls searchReGeocodeWithCoordinate:coordinate];

    };
    vc.title = @"地理位置选择";
    [self.viewController.navigationController pushViewController:vc animated:YES];
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
