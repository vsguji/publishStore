//
//  NewShopMainCategoryTypeCell.h
//  darongtong
//
//  Created by xie on 17/12/25.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewShopSecretTiGangModel.h"

@class NewShopMainCategoryTypeCell;

@protocol NewShopMainCategoryTypeCellDelegate <NSObject>


@optional   //operation  1 全删除  2 全选
- (void) alllSelected:(NewShopMainCategoryTypeCell*) model operation:(NSInteger) operation;

#pragma mark -- 计算当前下面所有选中的 --
- (BOOL) counterCurrentNextSelected:(NewShopMainCategoryTypeCell*) model;

#pragma mark -- 判断当前界面是否有一个子集 --
//- (void) counterCurrentNextSelected:(NewShopMainCategoryTypeCell*) model;


@end

@interface NewShopMainCategoryTypeCell : UICollectionViewCell

@property (nonatomic, weak)   id<NewShopMainCategoryTypeCellDelegate>  delegate;
@property (strong,nonatomic)  NewShopSecretTiGangModel* model;
@property (strong, nonatomic) IBOutlet UIView *LeftViewBg;
@property (strong, nonatomic) IBOutlet UIView *rightViewBg;
@property (strong, nonatomic) IBOutlet UILabel *num;
@property (strong, nonatomic) IBOutlet UIButton *allBtn;

@property (nonatomic, assign) bool  selecte;


@end
