//
//  UIView+network.h
//  darongtong
//
//  Created by xie on 17/9/13.
//  Copyright © 2017年 darongtong. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MySays_CommentModel.h"

@interface UIView (network)

#pragma mark -- 关注和收藏 --
- (void)uploadDataWith:(NSDictionary*) param call:(void(^)()) call;


#pragma mark - 发起约坛接口
- (void)addYueTanRequestAFN:(MySays_CommentModel *)mModel type:(NSString*)ty;

@end
