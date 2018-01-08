//
//  RTRecommendType.h
//  darongtong
//
//  Created by zy on 2017/9/19.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#ifndef RTRecommendType_h
#define RTRecommendType_h

/** 容通关系 */
typedef enum : NSUInteger {
    RTCloudRelationShip = 1, // 好坛友
    RTMineFollow,            // 我关注的
    RTFollowMe,              // 关注我的
    RTInvite,                // 约坛
    RTMineLook,              // 我看好的
    RTLookMe,                // 看好我的
    RTObserve,               // 观察
    RTStoreUp,               // 收藏
    RTUnKnown                // 未知
} RTRecommendType;


/** 直播聊天消息列表分类 */
typedef enum : NSUInteger {
    RTShowLiveMessagePraise = 0, // 颂
    RTShowLiveMessageMiddle,    // 中
    RTShowLiveMessageBlame,     // 遣
} RTShowLiveMessageType;


/** 直播聊天容通自定义消息分类 */
typedef enum : NSUInteger {
    RTShowLiveCustomerSystemMessage = 0, // 系统消息
    RTShowLiveCustomerTradeMessage,    //  交易消息
    RTShowLiveCustomerCoin,            //  容通币消息
} RTShowLiveCustomerMessageType;

// 单例
#define RTSingleTonClassInterface(class) + (instancetype)shared##class;


#define RTSingleTonClassImplementation(class) \
static class *_instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
\
return _instance; \
} \
\
+ (instancetype)shared##class \
{ \
if (_instance == nil) { \
_instance = [[class alloc] init]; \
} \
\
return _instance; \
}


// lipeng 2017.11.6
typedef enum : NSUInteger {
    kLiveModelFullScreen,
    kLiveModelHalfScreen,
    kLiveModelHorizontalScreen,
} kLiveModelScreen;


#endif /* RTRecommendType_h */
