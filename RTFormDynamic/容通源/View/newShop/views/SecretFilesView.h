//
//  SecretFilesView.h
//  darongtong
//
//  Created by xie on 17/12/16.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewShopSecretListModel.h"
@interface SecretFilesView : UIView

@property (strong, nonatomic) IBOutlet UILabel *projectName;

@property (strong, nonatomic) IBOutlet UIButton *hshsImageView;
@property (strong, nonatomic) IBOutlet UILabel *hshsTitle;
@property  (nonatomic, strong) NewShopSecretListModel* model ;


@property (nonatomic,copy) void (^openCamera)(NSArray* data);
@property (strong, nonatomic) IBOutlet UIButton *addHSHSButton;
@property (strong, nonatomic) IBOutlet UILabel *secretTitle;
@property (strong, nonatomic) IBOutlet UITextView *secretTextView;

@property(nonatomic, copy) void (^addNewHSHS)();


@end
