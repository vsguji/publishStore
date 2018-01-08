//
//  CommonAreaModel.h
//  darongtong
//
//  Created by xie on 17/12/19.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonAreaModel : NSObject

@property(nonatomic, copy) NSString * area;//地名区划
@property(nonatomic, copy) NSString * address;//所在社区
@property(nonatomic, copy) NSString * detailAddress;//详细地址




@property(nonatomic, assign) NSInteger  addressType;//地址类型 0经常所在地 1店铺总部 2工作社区 3店铺分支机构



@end
