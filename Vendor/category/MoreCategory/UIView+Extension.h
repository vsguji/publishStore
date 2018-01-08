//
//  UIView+Extension.h
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

/** 控件最左边那根线的位置(minX的位置) */
@property (nonatomic, assign) CGFloat left;
/** 控件最右边那根线的位置(maxX的位置) */
@property (nonatomic, assign) CGFloat right;
/** 控件最顶部那根线的位置(minY的位置) */
@property (nonatomic, assign) CGFloat top;
/** 控件最底部那根线的位置(maxY的位置) */
@property (nonatomic, assign) CGFloat bottom;


- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

+ (UIView *)addLineWithLineTopValue:(int)y;
/** Avilable in iOS 8.0 and later */
+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame;
+(UIViewController *)getControllerWithName:(NSString *)name selfView:(UIView *)view
;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// lipeng 合并  jackyLive相同"UIView+Extension.h" 定义的属性|方法

@property (nonatomic) CGPoint viewOrigin;
@property (nonatomic) CGSize viewSize;

- (UIImage *)toRetinaImage;
- (void)removeAllSubviews;
- (void)removeSubviewWithTag:(NSInteger)tag;
- (void)removeSubviewExceptTag:(NSInteger)tag;
- (void)removeSubviewExceptClass:(Class)class1;
- (void)shakeX:(float)range;
- (UIView *)subviewWithTag:(NSInteger)tag;
- (UIView *)findFirstResponder;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

@end
