//
//  NewShopSingletonModel.m
//  darongtong
//
//  Created by xie on 17/12/27.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "NewShopSingletonModel.h"

@implementation NewShopSingletonModel


static NewShopSingletonModel *single = nil;
+ (NewShopSingletonModel *)sharedSingleton
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[self alloc] init];
    });
    
    return single;
}

@end
