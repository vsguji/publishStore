//
//  NewShopBaseInfoModel.h
//  darongtong
//
//  Created by xie on 18/1/2.
//  Copyright © 2018年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewShopBaseInfoModel : NSObject


@property (nonatomic,copy) NSString* name;
@property (nonatomic,copy) NSString* pic_url;
@property (nonatomic,copy) NSString* goods;
@property (nonatomic,copy) NSString* abstract;

@property (nonatomic,strong) NSArray* cate_id_str;

@property (nonatomic,copy) NSString* cate_id_case;
@property (nonatomic,copy) NSString* cate_id_scope;
@property (nonatomic,strong) NSArray* cate_id_scope_num;
@property (nonatomic,copy) NSString* cate_id_scope_str;
@property (nonatomic,copy) NSString* cate_id_step;
@property (nonatomic,copy) NSString* cate_id_step_str;

@property (nonatomic,copy) NSString* id; 


//{
//pic_url： 'asd.jpg'   //图片 (选填)

//    "name": "精气神",            //商号  商标 简称
//    "goods": "精神 气血  神气",    //产品 产出质能
//    "abstract": "明天是奋斗出来的",        //一句话简介
//    "cate_id_str": [                //主属性 次属性 再次属性
//                    {
//                        "level": "1",        //级别
//                        "cate_id": "775",    //分类ID
//                        "cate_id_str": "仓案大农>生态农业>土特产"    //简介
//                    },
//                    {
//                        "level": "2",
//                        "cate_id": "771",
//                        "cate_id_str": "仓案大农>生态农业>土特产"
//                    }
//                    ],
//    "cate_id_case": "1",            //店铺组织结构类别
//    "cate_id_scope": ",2,3,4,5,",    //店铺经营主体规模类别ID拼接
//    "cate_id_scope_num" ： [{"id":1,"num":5},{"id":2,"num":3}]      //经营主体规模类别子分类选中个数
//    "cate_id_scope_str ": "堂前燕2>种养殖农户",    //店铺主体规模类别字符串
//    "cate_id_step": "23",            //所处产业链环节类别
//    "cate_id_step_str ": "所处产业链环节类别>原产地"   //所处产业链环节类别
//}

@end
