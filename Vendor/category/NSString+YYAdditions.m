//
//  NSString+MD5.m
//  darongtong
//
//  Created by luo on 15/11/20.
//  Copyright (c) 2015年 darongtong. All rights reserved.
//

#import "NSString+YYAdditions.h"
#include <sys/utsname.h>
#import <commoncrypto/CommonDigest.h>
@implementation NSString (YYAdditions)

- (NSString *)JL_MD5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[32];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
    CFStringRef sRef = CFURLCreateStringByAddingPercentEscapes(NULL,
                                                               (CFStringRef)self,
                                                               NULL,
                                                               (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                               CFStringConvertNSStringEncodingToEncoding(encoding));
    NSString *re = [NSString stringWithFormat:@"%@",sRef];
    CFRelease(sRef);
    return re;
}

-(NSString *)urlEncodeWithEncodingUTF8{
    return [self urlEncodeUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)getNotNullString:(NSString *)aString
{
    if (![aString isKindOfClass:[NSNull class]] && ![aString isEqualToString:@""] && aString != nil) {
        if (![aString isEqualToString:@"<null>"] && ![aString isEqualToString:@"null"] && ![aString isEqualToString:@"(null)"]) {
            return aString;
        } else {
            return @"";
        }
    } else {
        return @"";
    }
}

//数据解析
- (NSDictionary *)jsonDataDic
{
    if (!self)return @{};
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return @{};
    }
    return dic;
    
}

//NSString<->NSDate
- (NSString *)dateStringWithFmt:(NSString *)fmtString
{
    if([self isEqualToString:@""])return @"";
    NSUInteger temp = [self rangeOfString:@"."].location;
    NSString *tempString;
    if(temp != NSNotFound){
        tempString = [self substringToIndex:temp];
    }else tempString = self;
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [fmt dateFromString:tempString];
    [fmt setDateFormat:fmtString];
    return  [NSString getNotNullString:[fmt stringFromDate:date]];
}

//数字采用逗号计数
-(NSString *)moneyNumberStringDecimalNone
{
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
    [numberFormatter setPositiveFormat:@"###,##0"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
    
    return formattedNumberString;
}

-(NSString *)moneyNumberStringDecimalOne
{
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
    [numberFormatter setPositiveFormat:@"###,##0.0"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
    
    return formattedNumberString;
}
-(NSString *)moneyNumberStringWanyuan
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
    [numberFormatter setPositiveFormat:@"###,##0.0000"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
    
    return formattedNumberString;
}

-(NSString *)moneyNumberString
{
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
    [numberFormatter setPositiveFormat:@"###,##0.00"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
    return formattedNumberString;
}

-(NSString *)moneyNumberCommenString
{
    
    //    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    //    [numberFormatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
    //    [numberFormatter setPositiveFormat:@"##0.00"];
    //    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
    //    [numberFormatter release];
    //    return formattedNumberString;
    
    NSMutableString *string = [NSMutableString stringWithString:self];
    NSRange range = [string rangeOfString:@","];
    while (range.length >0)
    {
        [string replaceCharactersInRange:range withString:@""];
        range = [string rangeOfString:@","];
    }
    return string;
}

//  获取设备类型
+ (NSString *)getDeviceVersionInfo
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithFormat:@"%s", systemInfo.machine];
    
    return platform;
}

+ (NSString *)correspondVersion
{
    NSString *correspondVersion = [NSString getDeviceVersionInfo];
    
    if ([correspondVersion isEqualToString:@"i386"])        return@"Simulator";
    if ([correspondVersion isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([correspondVersion isEqualToString:@"iPhone1,1"])   return@"iPhone1";
    if ([correspondVersion isEqualToString:@"iPhone1,2"])   return@"iPhone3";
    if ([correspondVersion isEqualToString:@"iPhone2,1"])   return@"iPhone3S";
    if ([correspondVersion isEqualToString:@"iPhone3,1"] || [correspondVersion isEqualToString:@"iPhone3,2"])   return@"iPhone4";
    if ([correspondVersion isEqualToString:@"iPhone4,1"])   return@"iPhone4S";
    if ([correspondVersion isEqualToString:@"iPhone5,1"] || [correspondVersion isEqualToString:@"iPhone5,2"])   return @"iPhone5";
    if ([correspondVersion isEqualToString:@"iPhone5,3"] || [correspondVersion isEqualToString:@"iPhone5,4"])   return @"iPhone5C";
    if ([correspondVersion isEqualToString:@"iPhone6,1"] || [correspondVersion isEqualToString:@"iPhone6,2"])   return @"iPhone5S";
    if ([correspondVersion isEqualToString:@"iPhone7,1"] || [correspondVersion isEqualToString:@"iPhone7,1"])   return @"iPhone6Plus";
    
    if ([correspondVersion isEqualToString:@"iPhone7,2"] || [correspondVersion isEqualToString:@"iPhone7,2"])   return @"iPhone6";
    if ([correspondVersion isEqualToString:@"iPhone8,1"] || [correspondVersion isEqualToString:@"iPhone8,1"])
        return @"iPhone6S";
    if ([correspondVersion isEqualToString:@"iPhone8,2"] || [correspondVersion isEqualToString:@"iPhone8,2"])
        return @"iPhone6SPlus";
    return correspondVersion;
}

//返回码 - 对应意义
+ (NSString *)getMassageWithCode:(NSString *)codeString
{
    if(!codeString)return @"";
    if([codeString isEqualToString:@""])return @"";
    if([codeString isEqualToString:@"US000"])return @"登录成功!";
    if([codeString isEqualToString:@"US001"])return @"用户名密码错误!";
    if([codeString isEqualToString:@"US002"])return @"用户不存在!";
    if([codeString isEqualToString:@"CM001"])return @"服务端异常!";
    if([codeString isEqualToString:@"US003"])return @"用户已存在!";
    if([codeString isEqualToString:@"US004"])return @"用户注册成功!";
    if([codeString isEqualToString:@"US005"])return @"用户注册失败";
    if([codeString isEqualToString:@"US006"])return @"用户注册验证码错误!";
    if([codeString isEqualToString:@"US007"])return @"用户信息获取成功!";
    if([codeString isEqualToString:@"US008"])return @"用户修改失败!";
    if([codeString isEqualToString:@"US009"])return @"用户找回密码时发送验证码，用户不存在!";
    if([codeString isEqualToString:@"US010"])return @"用户密码修改失败!";
    if([codeString isEqualToString:@"US0011"])return @"用户修改用户信息失败!";
    if([codeString isEqualToString:@"US012"])return @"用户修改用户信息失败!";
    if([codeString isEqualToString:@"US013"])return @"发送短信成功!";
    if([codeString isEqualToString:@"US014"])return @"发送短信失败!";
    return @"";
    
}
//身份证号码校验
+ (BOOL)IDCardIsValidated:(NSString *)value {
    if([[NSString getNotNullString:value] isEqualToString:@""])return NO;
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSInteger length =0;
    if (!value)return NO;
    else {
        length = value.length;
        if (length !=15 && length !=18)return NO;
    }
    
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
            
        case 18:
            
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return NO;
    }
}

//手机号码校验
+ (BOOL)phoneCodeIsValidated:(NSString *)value
{
    if([[NSString getNotNullString:value] isEqualToString:@""])return NO;
    NSString *regex = @"^((1[34578][0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:value];
}

//邮箱校验
+ (BOOL)emailIsValidated:(NSString *)value
{
    if([[NSString getNotNullString:value] isEqualToString:@""])return NO;
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:value];
}
//用户名校验
+ (BOOL)userNameIsValidated:(NSString *)value
{
    if([[NSString getNotNullString:value] isEqualToString:@""])return NO;
    NSString *regex = @"^[A-Za-z0-9]{6,16}+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:value];
}

//真实姓名校验
+ (BOOL)realNameIsValidated:(NSString *)value
{
    if([[NSString getNotNullString:value] isEqualToString:@""])return NO;
    NSString *regex = @"^[\u4e00-\u9fa5]{2,10}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:value];
}

//密码校验
+ (BOOL)passWordIsValidated:(NSString *)value
{
    if([[NSString getNotNullString:value] isEqualToString:@""])return NO;
    NSString *regex = @"^[a-zA-Z0-9]{6,16}+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:value];
}

//银行卡 * 处理
- (NSString *)bankCardFilter:(NSString *)cardNumString
{
    if(!cardNumString || [cardNumString isEqualToString:@""])return @"";
    NSMutableString *tempString=[[NSMutableString alloc] init];
    //    NSMutableString *tempString = [NSMutableString stringWithString:[cardNumString substringWithRange:NSMakeRange(0, 4) ]];
    for(NSInteger i =0;i<cardNumString.length-4;i++)
        [tempString appendString:@"*"];
    //    return [cardNumString stringByReplacingCharactersInRange:NSMakeRange(0, cardNumString.length-4) withString:tempString];
    return [cardNumString stringByReplacingCharactersInRange:NSMakeRange(0, cardNumString.length-4) withString:tempString];
    
}
/** 一般的自适应   返回Size */
- (CGSize)getStringSize:(UIFont*)font width:(CGFloat)width
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSDictionary *attrSyleDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  font, NSFontAttributeName,
                                  nil];
    [attributedString addAttributes:attrSyleDict
                              range:NSMakeRange(0, self.length)];
    CGRect stringRect = [attributedString boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                       context:nil];
    
    return stringRect.size;
}
- (CGFloat)getStringHeight:(UIFont*)font width:(CGFloat)width
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSDictionary *attrSyleDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  font, NSFontAttributeName,
                                  nil];
    [attributedString addAttributes:attrSyleDict
                              range:NSMakeRange(0, self.length)];
    CGRect stringRect = [attributedString boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                       context:nil];
    
    return stringRect.size.height;
}
@end
