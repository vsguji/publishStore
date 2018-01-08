//
//  WTTNewShopBaseModel.h
//  darongtong
//
//  Created by xie on 18/1/3.
//  Copyright © 2018年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTTNewShopBaseModel : NSObject

@property(nonatomic, copy) NSString *pic_url;
@property(nonatomic, copy) NSString *pic_url_thumb;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *intro;
@property(nonatomic, copy) NSString *video_url;
@property(nonatomic, copy) NSString *type;


//id": "10109",
//"pic_url": "",        //图片地址
//"pic_url_thumb": "",    //图片缩略图
//"item_id": "0",        //交易标的ID
//"order_num": "0",        //排序编号
//"update_time": "0",        //编辑时间
//"title": "悯农",        //标题
//"intro": "锄禾日当午，汗滴禾下土",    //图文
//"hshs_id": "1382",        //绘声绘色ID
//"type": "1",        //元素类型
//"if_groundimage": "0",    //用不到
//"video_url": ""        //视频地址

@end
