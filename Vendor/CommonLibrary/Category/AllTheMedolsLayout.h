//
//  AllTheMedolsLayout.h
//  EightPlaces
//
//  Created by luo on 2017/4/18.
//  Copyright © 2017年 Jacky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, IPhoneType) {
    iPhone4Type = 0,
    iPhone5Type,
    iPhone6Type,
    iPhone6PlusType
};


@interface AllTheMedolsLayout : NSObject


/**
 * 基于UI设计的iPhone6设计图的全机型高度适配
 *
 * @param height View高度
 *
 * @return 适配后的高度
 */

+ (CGFloat)neu_layoutForAlliPhoneHeight:(CGFloat)height;
/**
 * 基于UI设计的iPhone6设计图的全机型宽度适配
 *
 * @param width 宽度
 *
 * @return 适配后的宽度
 */
+ (CGFloat)neu_layoutForAlliPhoneWidth:(CGFloat)width;




@end
