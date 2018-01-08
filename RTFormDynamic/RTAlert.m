//
//  RTAlert.m
//  darongtong
//
//  Created by zy on 2017/9/14.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTAlert.h"
#import <UIKit/UIKit.h>
#import "UIAlertView+BlocksKit.h"
#warning "jackyLive BlocksKit"

typedef void(^btnSelected)(NSInteger index);

@interface RTAlert()<UIAlertViewDelegate> {
}
@end
@implementation RTAlert

+ (BOOL)isIos8
{
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ;
}

+ (void)showAlertTitle:(NSString *)title withMsg:(NSString *)msg viewController:(UIViewController *)vc aletBlock:(void (^)(NSInteger))block buttonsStatement:(NSString *)cancelString, ...
{
    NSMutableArray* argsArray = [[NSMutableArray alloc] initWithCapacity:2];
    [argsArray addObject:cancelString];
    id arg;
    va_list argList;
    if(cancelString)
    {
        va_start(argList,cancelString);
        while ((arg = va_arg(argList,id)))
        {
            [argsArray addObject:arg];
        }
        va_end(argList);
    }
    
    if ( [RTAlert isIos8])
    {
        // UIAlertController
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
        for (int i = 0; i < [argsArray count]; i++)
        {
            UIAlertActionStyle style =  (0 == i)? UIAlertActionStyleCancel: UIAlertActionStyleDefault;
            UIAlertAction *action = [UIAlertAction actionWithTitle:[argsArray objectAtIndex:i] style:style handler:^(UIAlertAction *action) {
                if (block) {
                    block(i);
                }
            }];
            [alertController addAction:action];
        }
        [vc presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
    // UIAlertView
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:title message:msg delegate:nil cancelButtonTitle:cancelString otherButtonTitles:nil, nil];
    [argsArray removeObject:cancelString];
    for (NSString *buttonTitle in argsArray) {
        [alertView addButtonWithTitle:buttonTitle];
    }
    [alertView bk_setDidDismissBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
        block(buttonIndex);
    }];
}

@end
