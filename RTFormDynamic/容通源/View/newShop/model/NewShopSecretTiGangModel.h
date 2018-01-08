//
//  NewShopSecretTiGangModel.h
//  darongtong
//
//  Created by xie on 17/12/20.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewShopSecretTiGangModel : NSObject

@property(nonatomic, copy) NSString *id;//点
@property(nonatomic, copy) NSString *parent_id;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *sub_name;//名称
@property(nonatomic, copy) NSString *sort_order;
@property(nonatomic, copy) NSString *list_id;
@property(nonatomic, copy) NSString *pic_url;
@property(nonatomic, copy) NSString *pic_urlq;
@property(nonatomic, copy) NSString *desc;
@property(nonatomic, copy) NSString *type;
@property(nonatomic, copy) NSArray *_child;
@property(nonatomic, strong) NSMutableArray *_childModel;

@property(nonatomic, assign) BOOL  checked;//是否选中
@property(nonatomic, assign) BOOL  allChecked;//子集都选中



//"id": "2562",
//"parent_id": "0",
//"name": "资质证明",
//"sub_name": "",
//"sort_order": "0",
//"list_id": ",2562,",
//"pic_url": "",
//"pic_urlq": "",
//"type": "0",
//"desc": "发布店铺时密挡所需要的资质证明",
//"_child": [
//           {


@end
