//
//  UITextField+Extension.h
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)<UITextFieldDelegate>

+ (instancetype )addFieldWithFrame:(CGRect)frame
                              text:(NSString *)text
                            font:(UIFont *)font
                       placeholder:(NSString *)placeholder;



@end
