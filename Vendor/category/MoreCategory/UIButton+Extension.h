//
//  UIButton+Extension.h
//

#import <UIKit/UIKit.h>

typedef void(^TapButtonActionBlock) (UIButton *button) ;

@interface UIButton (MYExtension)

//@property (nonatomic, assign) NSTimeInterval uxy_acceptedEventTime;

/**
 *  快速创建Button
 *
 *  @param frame           frame
 *  @param title           title
 *  @param backgroundColor 背景颜色
 *  @param titleColor      文字颜色
 *  @param Action       动作
 */
+ (instancetype)addButtonWithFrame:(CGRect)frame
                        backgroundColor:(UIColor *)backgroundColor
                            Target:(id)target action:(SEL)action;


/**
 *  快速创建文字Button
 *
 *  @param frame           frame
 *  @param title           title
 *  @param backgroundColor 背景颜色
 *  @param titleColor      文字颜色
 *  @param Action       动作
 */
+ (instancetype)addButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                   backgroundColor:(UIColor *)backgroundColor
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font
                            Target:(id)target action:(SEL)action;



/**
 *   快速创建图片Button
 *
 *  @param frame       frame
 *  @param image       按钮的正常图片
 *  @param highImage   高亮状态的图片
 *  @param Action      触发方法
 */
+ (instancetype)addButtonWithFrame:(CGRect)frame
                             image:(NSString *)image
                         highImage:(NSString *)highImage
                   backgroundColor:(UIColor *)backgroundColor
                            Target:(id)target action:(SEL)action;


/**
 *   快速创建文字和图片Button
 *
 *  @param frame       frame
 *  @param image       按钮的正常图片
 *  @param highImage   高亮状态的图片
 *  @param Action      触发方法
 */
+ (instancetype)addButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font
                             image:(NSString *)image
                         highImage:(NSString *)highImage
                   backgroundColor:(UIColor *)backgroundColor
                            Target:(id)target action:(SEL)action;


/**
 *  快速创建文字Button
 *
 *  @param frame           frame
 *  @param title           title
 *  @param backgroundColor 背景颜色
 *  @param titleColor      文字颜色
 *  @param tapAction       回调
 */
+ (instancetype)addCustomButtonWithFrame:(CGRect)frame
                                         title:(NSString *)title
                               backgroundColor:(UIColor *)backgroundColor
                                    titleColor:(UIColor *)titleColor
                                     tapAction:(TapButtonActionBlock)tapAction;
/**
 *   快速创建图片Button
 *
 *  @param frame       frame
 *  @param imageString 按钮的背景图片
 *  @param tapAction   回调
 */
+ (instancetype)addSystemButtonWithFrame:(CGRect)frame
                   NormalBackgroundImageString:(NSString *)imageString
                                     tapAction:(TapButtonActionBlock)tapAction;



/**
 *  快速创建上图下文Button
 *  @param image           图片名
 *  @param frame           frame
 *  @param title           title
 *  @param backgroundColor 背景颜色
 *  @param titleColor      文字颜色
 *  @param tapAction       回调
 *  @param font            文字大小
 */
+ (instancetype)addCustomButtonWithFrame:(CGRect)frame
                                   title:(NSString *)title
                         backgroundColor:(UIColor *)backgroundColor
                              titleColor:(UIColor *)titleColor
                                   image:(NSString *)image
                                    font:(UIFont *)font
                                    type:(int)type //0左右 1上下
                               tapAction:(TapButtonActionBlock)tapAction;


@end
