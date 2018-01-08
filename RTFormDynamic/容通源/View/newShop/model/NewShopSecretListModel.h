//
//  NewShopSecretListModel.h
//  darongtong
//
//  Created by xie on 18/1/2.
//  Copyright © 2018年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewShopSecretListModel : NSObject


@property(nonatomic, copy) NSString *id;
@property(nonatomic, copy) NSString *case_id;
@property(nonatomic, copy) NSString *investment;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *keywords;
@property(nonatomic, copy) NSString *cover_img;
@property(nonatomic, copy) NSString *cover_img_thumb;
@property(nonatomic, strong) NSMutableArray *allow_see;
@property(nonatomic, strong) NSMutableArray *deny_see;
@property(nonatomic, strong) NSMutableArray *allow_see_business;
@property(nonatomic, strong) NSMutableArray *push_see;
@property(nonatomic, copy)   NSString *has_privilege;
@property(nonatomic, strong) NSMutableDictionary *card_desc;

@property(nonatomic, strong) NSMutableArray *pri_list;
@property(nonatomic, strong) NSMutableArray *content;





@end
