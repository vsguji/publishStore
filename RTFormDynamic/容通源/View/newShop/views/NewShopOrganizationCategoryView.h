//
//  NewShopOrganizationCategoryView.h
//  darongtong
//
//  Created by xie on 17/12/22.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewShopSecretTiGangModel.h"
#import "My_addJueSeView.h"

@interface NewShopOrganizationCategoryView : UIView
@property (strong, nonatomic) NSMutableArray*  dataArray;//数据源
@property (strong, nonatomic) IBOutlet UIButton *dashedBtn;
@property (nonatomic,copy) void (^setContentHeight)(CGFloat contentHeight) ;

@property (nonatomic,copy) void (^clickMoreBlock)(NewShopSecretTiGangModel* model );

@property (nonatomic,copy) void (^clickChainCategory)(NSArray* model );

@property (nonatomic, copy) void  (^requestFinishCall)();




@property (strong, nonatomic) IBOutlet My_addJueSeView *shopJinYingZhuTiCategory;
@property (strong, nonatomic) IBOutlet My_addJueSeView *shopSuoChuHangYeLeiCategory;

- (void) selectedGouXuan:(NSString*) idm;

@end
