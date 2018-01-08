//
//  NSString+File.h
//

#import <Foundation/Foundation.h>

@interface NSString (File)

- (long long)fileSize;

- (float) heightWithFont: (UIFont *) font withinWidth: (float) width;
- (float) widthWithFont: (UIFont *) font;

/**
 *  判断字符串是否为空
 */
- (BOOL) isBlankString:(NSString *)string;

/*
 *  判断手机号是否正确
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

@end
