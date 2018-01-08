//
//  CommonLocationView.h
//  darongtong
//
//  Created by xie on 17/12/19.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CommonLocationView <NSObject>


@optional
- (void) selectedFinish:(NSDictionary*) dic; //选择 delegteView


@end

@interface CommonLocationView : UIView


#pragma mark -- 返回高度 --
+ (CGFloat) getLocationViewHeight;

@end
