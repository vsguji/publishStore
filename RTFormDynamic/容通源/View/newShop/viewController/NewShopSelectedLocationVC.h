//
//  NewShopSelectedLocationVC.h
//  darongtong
//
//  Created by xie on 18/1/4.
//  Copyright © 2018年 darongtong. All rights reserved.
//

#import "BaseViewController.h"

@interface NewShopSelectedLocationVC : BaseViewController

@property (nonatomic,strong) void (^callBlock)(CLLocationCoordinate2D address);

@end
