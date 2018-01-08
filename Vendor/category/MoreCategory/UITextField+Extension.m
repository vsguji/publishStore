//
//  UITextField+Extension.m
//

#import "UITextField+Extension.h"

@interface UITextField ()<UITextFieldDelegate>


@end

@implementation UITextField (Extension)

+ (instancetype )addFieldWithFrame:(CGRect)frame
                              text:(NSString *)text
                              font:(UIFont *)font
                       placeholder:(NSString *)placeholder

{
    UITextField *textField = [[UITextField alloc] init];
    textField.delegate = self;
    textField.placeholder = placeholder;
//    textField.font = leftFont;
    textField.text = text;
//    textField.textColor = subTitleColor;
    textField.textAlignment = NSTextAlignmentRight;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.frame = frame;
    
    return textField;
}



@end
