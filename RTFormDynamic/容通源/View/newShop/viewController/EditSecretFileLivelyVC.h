//
//  MeiPianListViewController.h
//  darongtong
//
//  Created by luo on 16/5/14.
//  Copyright © 2016年 darongtong. All rights reserved.
//

#import "RootViewController.h"
#import "MeipianModel.h"
#import "NewShopSecretListModel.h"
typedef NS_ENUM (NSInteger,SelectType){
    
    SelectImage,
    SelectVideo
    
};

typedef NS_ENUM (NSInteger,UploadType){
    
    UploadText,
    UploadImage,
    UploadVideo
    
};


typedef void(^AliyunAdressBlock)(NSString *url,MeipianModel *model);

@interface EditSecretFileLivelyVC : RootViewController
@property(nonatomic,strong) UIImage *topImgName;
@property(nonatomic,copy) NSString *caseId;
@property(nonatomic,copy) NSString *custom_id;
@property(nonatomic,strong) NSArray*  screatFiles;//密档类型
@property (nonatomic,copy) NSString* secretTitle;//密档标题
@property (nonatomic,copy) NSString* projectOutline;//密档标题

@property  (nonatomic, strong) NewShopSecretListModel* editModel ;//编辑对象



@property (nonatomic,copy)void (^refreshDataAfterSuccessBlock)();

@end
