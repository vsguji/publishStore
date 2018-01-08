//
//  NSString+MD5.h
//  darongtong
//
//  Created by luo on 15/11/20.
//  Copyright (c) 2015年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (YYAdditions)
-(NSString *)JL_MD5String;


-(NSString *)urlEncodeWithEncodingUTF8;

//NSString<->NSDate
- (NSString *)dateStringWithFmt:(NSString *)fmtString;
//字符串处理
+ (NSString *)getNotNullString:(NSString *)aString;
//数据解析
- (NSDictionary *)jsonDataDic;

//逗号计数法
-(NSString *)moneyNumberStringDecimalNone;
-(NSString *)moneyNumberStringDecimalOne;
-(NSString *)moneyNumberStringWanyuan;
-(NSString *)moneyNumberString;
-(NSString *)moneyNumberCommenString;

//获取设备类型
+ (NSString *)correspondVersion;

//返回码 - 对应意义
+ (NSString *)getMassageWithCode:(NSString *)codeString;

//身份证号码校验
+ (BOOL)IDCardIsValidated:(NSString *)value;
//手机号码校验
+ (BOOL)phoneCodeIsValidated:(NSString *)value;
//邮箱校验
+ (BOOL)emailIsValidated:(NSString *)value;
//用户名校验
+ (BOOL)userNameIsValidated:(NSString *)value;
//真实姓名校验
+ (BOOL)realNameIsValidated:(NSString *)value;
//密码校验
+ (BOOL)passWordIsValidated:(NSString *)value;

//银行卡 * 处理
- (NSString *)bankCardFilter:(NSString *)cardNumString;
/** 一般的自适应   返回Size */
- (CGSize)getStringSize:(UIFont*)font width:(CGFloat)width;
- (CGFloat)getStringHeight:(UIFont*)font width:(CGFloat)width;



@end
