//
//  NSString+Extension.h
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 *  自适应高度
 *
 *  @param font  字体
 *  @param width 宽度
 *
 *  @return 返回的高度
 */
- (float) heightWithFont: (UIFont *) font withinWidth: (float) width;
- (float) widthWithFont: (UIFont *) font;

- (long long)fileSize;

//判断字符串中的表情
+ (BOOL)stringContainsEmoji:(NSString *)string;

////unicode---字符串
//+ (NSString*) replaceUnicode:(NSString*)aUnicodeString;
//
////utf8－－－unicode
//+(NSString *) utf8ToUnicode:(NSString *)string;
//生成唯一字符串
+ (NSString *)getUniqueStrByUUID;

// 判断字符串 只有 空格 和换行符
+(BOOL)isBlankString:(NSString *)string;
//时间戳转换
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;
//当前时间MM-dd
+ (NSString *)timeString:(NSString *)timeString;

//字符串宽度计算
+ (CGSize) getAttributeSizeWithText:(NSString *)text fontSize:(int)fontSize;
@end
