//
//  RTAlert.h
//  darongtong
//
//  Created by zy on 2017/9/14.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
// 提示框 兼容 UIAlertView,UIAlertViewController
@interface RTAlert : NSObject

+ (void)showAlertTitle:(NSString *)title
               withMsg:(NSString *)msg
        viewController:(UIViewController *)vc
           aletBlock:(void (^)(NSInteger buttonIdx))block
      buttonsStatement:(NSString*)cancelString, ...;

@end
