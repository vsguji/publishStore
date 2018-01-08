//
//  NewShopSingletonModel.h
//  darongtong
//
//  Created by xie on 17/12/27.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewShopSingletonModel : NSObject

@property(nonatomic, strong) NSMutableArray*  cate_id_scope_num;//用户选择的子集
@property(nonatomic, strong) NSMutableArray* cate_id_scope;//用户选择的子集
@property(nonatomic, strong) NSMutableArray* cate_id_scope_str;//用户选择的子集

@property(nonatomic, strong) NSMutableDictionary* cate_id_scope_num_key;//{}用户选择的子集
@property(nonatomic, strong) NSMutableDictionary* cate_id_scope_num_key_value;//

@property(nonatomic, strong) NSMutableArray*  hshs_ids;//

+ (NewShopSingletonModel *)sharedSingleton;

@end
