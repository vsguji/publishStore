//
//  NewShopHSHSAuditStatus.h
//  darongtong
//
//  Created by xie on 17/12/23.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person_S_LivelyCell.h"
@interface NewShopHSHSAuditStatus : UIView

@property(nonatomic, strong) WZCLivelyListModel * model;
@property (nonatomic ,copy) NSString* hshs_id;//绘声绘色id


#pragma mark -- 创建界面 --
- (void) makeUI;

@end
