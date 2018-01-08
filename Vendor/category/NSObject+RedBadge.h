//
//  NSObject+RedBadge.h
//  darongtong
//
//  Created by luo on 16/1/14.
//  Copyright © 2016年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (RedBadge)
- (void)showBadgeOnItemIndex:(int)index;   //显示小红点
- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点
@end
