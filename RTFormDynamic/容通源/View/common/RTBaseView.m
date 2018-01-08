//
//  RTBaseView.m
//  darongtong
//
//  Created by zy on 2017/12/7.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import "RTBaseView.h"

@implementation RTBaseView

@synthesize dynamicDelegate = _dynamicDelegate;

- (void)configOwnViewsWidthInfo:(id<RTFormProtocol>)info{
   // do something ...
}

- (void)addOwnViewsWithInfo:(id<RTFormProtocol>)info {
    // do something ...
}

- (void)configSuperViewsWidthInfo:(id<RTFormProtocol>)info {
    
}

- (CGFloat)verticalMargin {
    return 10.;
}

- (CGFloat)horizontalMargin{
    return 10.;
}

- (CGFloat)leftMagin {
    return 15.;
}

@end
