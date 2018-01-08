//
//  UIFont+Font.m
//  darongtong
//
//  Created by xie on 17/2/15.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "UIFont+Font.h"
#import <objc/message.h>

@implementation UIFont (Font)

//+ (void)load {
//    
//    Method systimeFont = class_getClassMethod(self, @selector(systemFontOfSize:));
//    
//    Method qsh_systimeFont = class_getClassMethod(self, @selector(qsh_systemFontOfSize:));
//    // 交换方法
//    method_exchangeImplementations(qsh_systimeFont, systimeFont);
//    
//}
//
//
//+ (UIFont *)qsh_systemFontOfSize:(CGFloat)pxSize{
//    
//    CGFloat pt = (pxSize/96)*72;
//    
//    NSLog(@"pt--%f",pt);
//    
//    CGFloat sizeScale = (SCREEN_HEIGHT > 568) ? SCREEN_HEIGHT/568 : 1;
//
//    
//    UIFont *font = [UIFont qsh_systemFontOfSize:pt*sizeScale];
//    
////    UIFont *font = [UIFont qsh_systemFontOfSize:sizeScale*pxSize];
//
//    
//    return font;
//    
//}
@end
