//
//  CustomEditButton.h
//  darongtong
//
//  Created by xie on 17/12/16.
//  Copyright © 2017年 darongtong. All rights reserved.
//

typedef  NS_ENUM(NSInteger,NewShopCustomButtonType){
    NewShopCustomButtonTypeDefault = 0,//默认 左边编辑 右边icon
    NewShopCustomButtonTypeAuthority = 1,//左边icon 右边设置权限可见范围
    NewShopCustomButtonTypeSecretTitle = 2,// 密档标题按钮
    NewShopCustomButtonTypeSecretSubject = 3,// 密档子按钮
    NewShopCustomButtonTypeShopType = 4,// 组织结构类别
    
    
};

#import <Foundation/Foundation.h>
#import "NewShopSecretTiGangModel.h"

@class CustomEditButton;

@protocol  CustomEditButtonDelegate <NSObject>

@optional
#pragma mark -- 点击事件 --
- (void) clickItem:(NSIndexPath*) indexPath btn:(CustomEditButton*) btn;


@end

@interface CustomEditButton : UIButton
@property(nonatomic, assign) NewShopCustomButtonType  type;//类型
@property(nonatomic, weak)   id<CustomEditButtonDelegate> delegate;
@property(nonatomic, strong) NewShopSecretTiGangModel* model ;





@property(nonatomic, strong) NSIndexPath* indexPath;//



@end
