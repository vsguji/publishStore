//
//  RTBaseView.h
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//
// 自定义基类
#import <UIKit/UIKit.h>
#import "RTFormProtocol.h"
#import "RTCellProtocal.h"
@interface RTBaseView : UIView<RTFormProtocol,RTFormViewDynamicDelegate>
{
    @protected
    __weak id<RTFormViewDynamicDelegate> _dynamicDelegate;
}
@property (nonatomic,weak) id <RTFormViewDynamicDelegate> dynamicDelegate;

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info;
- (void)addOwnViewsWithInfo:(id<RTFormProtocol>)info;

- (void)configSuperViewsWidthInfo:(id<RTFormProtocol>)info;

@end
