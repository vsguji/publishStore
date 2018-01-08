//
//  RTLiveListModel.h
//  darongtong
//
//  Created by zy on 2017/8/25.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RTBaseModel.h"
//0-未开始、1-直播中、2-异常、3-关闭
typedef enum : NSUInteger {
    kVideo_Live_0 = 0,  // 未开始
    kVideo_Live_1,      // 直播中
    kVideo_Live_2,      // 异常
    kVideo_Live_3,      // 关闭
} kVideo_Live_State;


// 在线状态   1|在线 2|隐身 3|离开 4|离线
typedef enum : NSUInteger {
    kOnLine_State_1 = 0,
    kOnLine_State_2,
    kOnLine_State_3,
    kOnLine_State_4
} kOnLine;


// 是否显示 1|显示 0 |不显示
typedef enum : NSUInteger {
    kVisible_0 = 0,
    kVisible_1,
} kVisible;

// 交易标的
@interface RTTrades :RTBaseModel
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSURL *picUrl;
@end

// 经常地址 && 当前地址
@interface RTCoordinate2D : RTBaseModel
@property(nonatomic,assign) CLLocationCoordinate2D coor2D;
@property(nonatomic,copy) NSString *address;
@end

@interface RTLiveListModel :RTBaseModel{

}
/*elments*/
// 直播ID
@property(nonatomic,copy) NSString *live_id;
// 当前登录用户ID
@property(nonatomic,copy) NSString *customer_id;
// 直播状态
@property(nonatomic,assign,readonly) kVideo_Live_State videoState;
// 直播名称
@property(nonatomic,copy) NSString *channel_name;
// 直播图片
@property(nonatomic,copy) NSString *channel_pic;
// 查看数量
@property(nonatomic,copy) NSString *views;
// 点赞总数
@property(nonatomic,copy) NSString *thumbs_up_num;
// 分类标示
@property(nonatomic,copy) NSString *cate_name;
// 直播属性
@property(nonatomic,copy) NSString *type_name;
// 当前请求type
@property(nonatomic,copy) NSString *type;
// 距离
@property(nonatomic,copy) NSString *dist;
// 头像
@property(nonatomic,copy) NSURL *headUrl;
// 用户昵称
@property(nonatomic,copy) NSString *nick_name;
// 发布时间
@property(nonatomic,copy) NSString *timestring;
// 是否显示 1|显示 0 |不显示
@property(nonatomic,assign,readonly) kVisible in_level;
// 在线状态   1|在线 2|隐身 3|离开 4|离线
@property(nonatomic,assign,readonly) kOnLine onStatus;
// 行业图标
@property(nonatomic,copy) NSString *cate_icon;
// 角色图标
@property(nonatomic,copy) NSString *role_icon;
// 粉丝数量
@property(nonatomic,copy) NSString *fans_num;
// 约会/约起数量
@property(nonatomic,copy) NSString *about_num;
// 约会/约起数量
@property(nonatomic,copy) NSString *is_about;
// 关注
@property(nonatomic,copy) NSString *is_attention;
// 收藏
@property(nonatomic,copy) NSString *is_collect;
// 是否点赞
@property(nonatomic,copy) NSString *is_zan;
// 经常地址
@property(nonatomic,strong,readonly) RTCoordinate2D *often_lng_lat;
// 在线时间
@property(nonatomic,copy) NSString *online_time;
// 交易标的列表
@property(nonatomic,strong) NSArray <RTTrades *> *trades;
// 当前地址
@property(nonatomic,strong,readonly) RTCoordinate2D *local_lng_lat;

@end

//////////////////////////////////////////////////////////////////////////////////////
// 点播  lipeng 2017.11.20

@interface RTLiveVodModel:RTBaseModel
// 点播id
@property (nonatomic,copy) NSString *video_id;
// 直播id
@property (nonatomic,copy) NSString *live_id;
// 点播频道
@property (nonatomic,copy) NSString *channel_id;
// 点播文件名称
@property (nonatomic,copy) NSString *file_id;
// 点播文件格式
@property (nonatomic,copy) NSString *file_format;
// 点播文件大小
@property (nonatomic,copy) NSString *file_size;
// 视频时长
@property (nonatomic,copy) NSString *duration;
// 点播缩略图
@property (nonatomic,copy) NSURL *vodIcon;
// 点播地址
@property (nonatomic,copy) NSURL *vodUrl;
// 点播次数
@property (nonatomic,copy) NSString *views;
// 点播Id
@property (nonatomic,copy) NSString *vodId;
// 点播名称
@property (nonatomic,copy) NSString *channel_name;
// 房间id
@property (nonatomic,copy) NSString *room_id;
// 创建时间
@property (nonatomic,copy) NSString *create_time;
@end

