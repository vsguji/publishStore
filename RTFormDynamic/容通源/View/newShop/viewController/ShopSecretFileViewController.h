//
//  ShopSecretFileViewController.h
//  darongtong
//
//  Created by xie on 17/12/19.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "BaseViewController.h"
#import "NewShopPulishScretFileView.h"

@interface ShopSecretFileViewController : BaseViewController

@property (strong, nonatomic) NSMutableArray*  dataArray;//数据源
@property (nonatomic, assign) NewShopsecretType  type;
@property (nonatomic, copy)   NSString * p_id;


@property(nonatomic, copy) void (^callBlock)(NSArray* array ,NSString* str);


@end
