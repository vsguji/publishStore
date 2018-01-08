//
//  BasicInfoView.h
//  darongtong
//
//  Created by liuxin on 2017/7/1.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYQAssetPickerController.h"
@interface BasicInfoView : UIView<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,ZYQAssetPickerControllerDelegate>
@property(nonatomic,strong)UIImageView * headImgV;//头像
@property(nonatomic,strong)NSString * storeID;      //店铺id
@property(nonatomic,strong)UITextField * shopName;      //商号 商标 简称
@property(nonatomic,strong)UITextField * product;      //产品
@property(nonatomic,strong)UITextField * AD;           //广告词
@property(nonatomic,strong)UIButton * firstAttribute;//主属性
@property(nonatomic,strong)UIButton * secondAttribute;//次属性
@property(nonatomic,strong)UIButton * thirdAttribute;//再次属性
@property(nonatomic,strong)UIButton * storeName;      //店铺id
@property(nonatomic,strong)UIImageView * licenseImgV;//执照img
@property(nonatomic,copy)NSString * businessCategory;//经营类别
@property(nonatomic,copy)NSString * belongCategory;//所属类别

@property(nonatomic, copy) void (^showSelectView)(NSInteger index);



@end
