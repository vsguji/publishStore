//
//  NewShopMainCategoryTypeVC.h
//  darongtong
//
//  Created by xie on 17/12/25.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "BaseViewController.h"

@interface NewShopMainCategoryTypeVC : BaseViewController

@property (nonatomic,copy)NSString*  p_id;//类别id
@property (nonatomic,strong) NSMutableArray* dataArray;//数据源

@property (nonatomic,copy) void (^backCallUpdateData)();

@end
