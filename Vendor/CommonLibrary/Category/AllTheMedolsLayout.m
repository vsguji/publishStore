//
//  AllTheMedolsLayout.m
//  EightPlaces
//
//  Created by luo on 2017/4/18.
//  Copyright © 2017年 Jacky. All rights reserved.
//

#import "AllTheMedolsLayout.h"
#define iPhone4Height (480.f)
#define iPhone4Width (320.f)

#define iPhone5Height (568.f)
#define iPhone5Width (320.f)

#define iPhone6Height (667.f)
#define iPhone6Width (375.f)

#define iPhone6PlusHeight (736.f)
#define iPhone6PlusWidth (414.f)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

@implementation AllTheMedolsLayout

#pragma mark - 适配所有机型高度
+ (CGFloat)neu_layoutForAlliPhoneHeight:(CGFloat)height {
    CGFloat layoutHeight = 0.0f;
    if (iPhone4Height) {
        layoutHeight = ( height / iPhone6Height ) * iPhone4Height;
    } else if (iPhone5Height) {
        layoutHeight = ( height / iPhone6Height ) * iPhone5Height;
    } else if (iPhone6Height) {
        layoutHeight = ( height / iPhone6Height ) * iPhone6Height;
    } else if (iPhone6PlusHeight) {
        layoutHeight = ( height / iPhone6Height ) * iPhone6PlusHeight;
    } else {
        layoutHeight = height;
    }
    return layoutHeight;
}

+ (CGFloat)neu_layoutForAlliPhoneWidth:(CGFloat)width {
    
    CGFloat layoutWidth = 0.0f;
    if (iPhone4Width) {
        layoutWidth = ( width / iPhone6Width ) * iPhone4Width;
    } else if (iPhone5Width) {
        layoutWidth = ( width / iPhone6Width ) * iPhone5Width;
    } else if (iPhone6Width) {
        layoutWidth = ( width / iPhone6Width ) * iPhone6Width;
    } else if (iPhone6PlusWidth) {
        layoutWidth = ( width / iPhone6Width ) * iPhone6PlusWidth;
    }
    
    return layoutWidth;
}

@end
