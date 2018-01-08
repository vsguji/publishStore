//
//  RTModelTools.h
//  darongtong
//
//  Created by zy on 2017/10/27.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 处理工具
#import <Foundation/Foundation.h>

@interface RTModelTools : NSObject

// 本地json
+ (NSDictionary *)jsonLocalDic:(NSString *)file;

// UTC转GMT
+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate;

// 倒计时
+ (NSString *)timeIntervalToString:(NSTimeInterval)time;

// Array 转 json
+ (NSString *)jsonStringWithPrettyPrint:(NSArray *) array;

// NSDictionary 转 json
+ (NSString *)jsonStringWithDicPrint:(NSDictionary *) dic;

// json  转 NSDictionary
+ (NSDictionary *)dicWithJsonString:(NSString *)json;

// json  转 NSArray
+ (NSDictionary *)arrayWithJsonString:(NSString *)json;

// 通讯录分区排序
+ (NSMutableArray *)addressBookArrayTmp:(NSArray *)backToControllerData;

// 通讯录联系人首字母
+ (NSString *)firstCharactorWithString:(NSString *)string;

@end
